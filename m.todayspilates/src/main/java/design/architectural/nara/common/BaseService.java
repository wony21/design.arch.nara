package design.architectural.nara.common;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BaseService {
	
	@Autowired
	protected SqlSession sqlSession;

}
