package design.architectural.nara.controllers;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import design.architectural.nara.common.BaseController;
import design.architectural.nara.domain.stor.StorService;
import design.architectural.nara.domain.user.UserService;

@Controller
public class StorController extends BaseController {
	
	@Autowired
	StorService storService;
	
	@RequestMapping(value = "/api/stor", method = RequestMethod.GET, produces = APPLICATION_JSON)
	@ResponseBody
	public List getStor() {
		return storService.getStor();
	}
}
