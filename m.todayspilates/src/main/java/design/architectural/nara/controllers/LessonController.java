package design.architectural.nara.controllers;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import design.architectural.nara.common.BaseController;
import design.architectural.nara.common.CamelCaseMap;
import design.architectural.nara.common.ParamNames;
import design.architectural.nara.common.SessionUtils;
import design.architectural.nara.common.api.ApiResponse;
import design.architectural.nara.domain.lesson.LessonService;
import design.architectural.nara.domain.reservation.teacher.TeacherService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class LessonController extends BaseController {
	
	@Autowired
	LessonService lessonService;
	
	@RequestMapping(value = "/api/lesson", method = RequestMethod.GET, produces = APPLICATION_JSON)
	@ResponseBody
	public List getLesson(@RequestParam String storCd,
						  @RequestParam(required = false) String lsnFg) {
		String compCd = SessionUtils.getCurrentUser().getCompCd();
		return lessonService.getLesson(compCd, storCd, lsnFg);
	}
	
	@RequestMapping(value = "/api/lesson/list", method = RequestMethod.GET, produces = APPLICATION_JSON)
	@ResponseBody
	public List getRegisterLessons(@RequestParam String storCd,
							@RequestParam(required = false) String memberNm,
							@RequestParam(required = false) String memberNo) {
		String compCd = SessionUtils.getCurrentUser().getCompCd();
		return lessonService.getRegisterLessons(compCd, storCd, memberNm, memberNo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/lesson/add", method = RequestMethod.PUT, produces = APPLICATION_JSON)
	public ApiResponse addLesson(@RequestBody List<HashMap> requestParams) {
		return lessonService.addMemberLesson(requestParams);
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/lesson/modify", method = RequestMethod.PUT, produces = APPLICATION_JSON)
	public ApiResponse modifyLesson(@RequestBody List<HashMap> requestParams) {
		return lessonService.modifyMemberLesson(requestParams);
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/lesson/delete", method = RequestMethod.PUT, produces = APPLICATION_JSON)
	public ApiResponse deleteLesson(@RequestBody List<HashMap> requestParams) {
		return lessonService.deleteMemberLesson(requestParams);
	}
	
	@ResponseBody
	@RequestMapping(value = "/api/lesson/relsn", method = RequestMethod.GET, produces = APPLICATION_JSON)
	public List reLesson(@RequestParam String storCd,
								@RequestParam String lsnCd,
								@RequestParam String memberNo) {
		String compCd = SessionUtils.getCurrentUser().getCompCd();
		return lessonService.relesson(compCd, storCd, memberNo, lsnCd);
	}
}
