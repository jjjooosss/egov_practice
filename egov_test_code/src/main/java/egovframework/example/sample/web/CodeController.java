package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
import egovframework.example.sample.service.SampleDefaultVO;
import egovframework.example.sample.service.SampleVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value = "/codeWrite.do")
	public String codeWrite() {
		log.info("-----controller codeWriteView-----");
		return "code/codeWrite";
	}
	
	@RequestMapping(value = "codeWriteSave.do", method = RequestMethod.POST)
//	@ResponseBody
	public String codeWriteSave(CodeVO vo) throws Exception {
		log.info("-----controller saveCode-----");
		String result = codeService.insertCode(vo);
//		정상적으로 insert시 null
		log.info("@#@#===>result"+result);
		
//		return "code Save Ok";
		return "redirect:/codeList.do";
//		return "forward:/codeList.do";
	}
	
	@RequestMapping(value = "/codeList.do")
	public String selectCodeList(CodeVO vo, ModelMap model) throws Exception{
		log.info("-----controller codeList-----");
		
		List<?> list = codeService.selectCodeList(vo);
		model.addAttribute("resultList",list);
		
		int total = codeService.selectCount();
		model.addAttribute("total",total);
		
		return "code/codeList";
	}
	

	@RequestMapping("/deleteCode.do")
	public String deleteCode(Integer code) throws Exception{
		codeService.deleteCode(code);
		
		return "forward:/codeList.do";
	}
	
	@RequestMapping("/updateCode.do")
	public String updateCode(Integer code, ModelMap model) throws Exception{
		CodeVO vo = codeService.selectCode(code);
		model.addAttribute("codeVO",vo);
		
		return "code/codeUpdate";
	}
	@RequestMapping("/updateCodeSave.do")
	public String updateCodeSave(CodeVO vo) throws Exception{
		codeService.updateCode(vo);
		
		return "redirect:/codeList.do";
	}
}
