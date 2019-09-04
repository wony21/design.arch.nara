package design.architectural.nara.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import design.architectural.nara.common.CommonData;
import design.architectural.nara.common.CommonData.ROLE;
import design.architectural.nara.domain.user.User;
import design.architectural.nara.domain.user.UserService;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userId = (String) authentication.getPrincipal();		
		if ( userId.length() < 4) {
			throw new InternalAuthenticationServiceException("아이디는 4자리 이상이어야 합니다.");
		}
		if (userId.length() <= 0) {
			throw new InternalAuthenticationServiceException("아이디가 존재하지 않습니다.");
		}
		String userPw = (String) authentication.getCredentials();
		logger.debug(String.format("Request user login : [id]%s, [pw]%s", userId, userPw));
		User userInfo = userService.getUserInfo(userId, userPw);
		if (userInfo != null) {
			List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
			if ( userInfo.userLv.equals(CommonData.UserLv.SYSTEM)) { // 관리자는 모든 권한부여
				roles.add(new SimpleGrantedAuthority(ROLE.ADMIN));
				roles.add(new SimpleGrantedAuthority(ROLE.MANAGER));
				roles.add(new SimpleGrantedAuthority(ROLE.USER));
			} else if ( userInfo.userLv.equals(CommonData.UserLv.MANAGER)) { // 매니져는 매니져만 권한부여
				roles.add(new SimpleGrantedAuthority(ROLE.MANAGER));
			} else { // 나머지는 일반권한만 부여
				roles.add(new SimpleGrantedAuthority(ROLE.USER));
			}
			
			UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(userId, userPw, roles);
			result.setDetails(new CustomUserDetails(userInfo));
			return result;
			
		} else {

			throw new BadCredentialsException("Bad credentials [" + userId + "/" + userPw + "]");
		}
	}
}