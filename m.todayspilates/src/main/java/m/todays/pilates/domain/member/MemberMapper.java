package m.todays.pilates.domain.member;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
	
	List getMember();
	List getMemberList(Map<String, Object> parameter);
	List getExistMember(Map<String, Object> parameter);
	void addMember(Map<String, Object> parameter);
	void updateMember(Map<String, Object> parameter);
	void deleteMember(Map<String, Object> parameter);
}
