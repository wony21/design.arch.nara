package design.architectural.nara.domain.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommonMapper {
	
	List getCommonCode(Map<String, Object> parameter);
	
	List test(Map<String, Object> parameter);

}
