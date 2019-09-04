package design.architectural.nara.domain.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import design.architectural.nara.common.BaseService;
import design.architectural.nara.common.ParamNames;

@Service
public class CommonService extends BaseService {
	
	@Autowired
	private CommonMapper commonMapper;
	
	public List getCommon(String groupCd) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put(ParamNames.groupCd, groupCd);
		return commonMapper.getCommonCode(parameter);
	}
	
	public List getTest() {
		Map<String, Object> parameter = new HashMap<String, Object>();
		return commonMapper.test(parameter);
	}

}
