package design.architectural.nara.domain.lesson;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LessonMapper {
	
	List getLesson(Map<String, Object> parameter);
	List getRegisterLessons(Map<String, Object> parameter);
	void addMemberLesson(Map<String, Object> parameter);
	void updateMemberLesson(Map<String, Object> parameter);
	void deleteMemberLesson(Map<String, Object> parameter);
	List checkReLesson(Map<String, Object> parameter);
	
}
