package sns.members.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sns.members.service.MembersService;
import sns.members.service.MembersVO;

@Controller
public class MembersController {
	
	@Resource(name= "MembersService")
	private MembersService membersService;
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainForm() {
		return "main";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	
	@RequestMapping("sign.do")
	public String sign(MembersVO membersVo) throws Exception {
		return "signUp";
	}
	
	@RequestMapping(value="signUp.do", method = RequestMethod.POST)
	public String signUp(MembersVO membersVo) throws Exception {
		membersService.signUpMember(membersVo);
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/loginMember.do", method = RequestMethod.POST)
	public int login(@RequestParam(name = "memberId") String memberId,
			@RequestParam(name = "memberPassword") String memberPassword, MembersVO membersVo, HttpSession session) throws Exception {
		membersVo.setMemberId(memberId);
		membersVo.setMemberPassword(memberPassword);
		int result = membersService.loginMember(membersVo);
		System.out.println("12r12ormk12mrp");
		if (result == 1) {
			String nickname = membersService.memberNickname(memberId);
			MembersVO memberSession = membersService.selectMember(memberId);
			session.setAttribute("SessionMemberId", membersVo.getMemberId());
			session.setAttribute("SessionMemberNickname", nickname);
			session.setAttribute("SessionMember", memberSession);
			return result;

		} else {
			System.out.println("로그인 실패");
			System.out.println("실패@@@@@@@@@@@@@@@@@@@@@"+result);
			return result;
			
		}
		
	}
	
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("SessionMemberId");
		return "main";
	}
}
