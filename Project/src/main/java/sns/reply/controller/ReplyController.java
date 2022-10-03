package sns.reply.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sns.board.service.BoardService;
import sns.board.service.BoardVO;
import sns.reply.service.ReplyService;
import sns.reply.service.ReplyVO;

@Controller
public class ReplyController {
	
	
	
	@Resource(name = "BoardService")
	private BoardService boardService;
	
	
	@Resource(name = "ReplyService")
	private ReplyService replyService;
	
	
	@RequestMapping("send.do")
	public String send(BoardVO boardVo,Model model) throws Exception {
		BoardVO board = boardService.selectView(boardVo);
		model.addAttribute("board",board);
		
		return "reply/sendMessage";
	}
	
	@RequestMapping("sendTo.do")
	public String sendTo(BoardVO boardVo,Model model,ReplyVO replyVo) throws Exception {
		
		ReplyVO reply = replyService.sendView(replyVo);
		
		model.addAttribute("reply",reply);
		
		return "reply/messageReply";
	}
	
	@RequestMapping(value= "sendMe.do" , method = RequestMethod.POST)
	public String sendMessage(int boardNo,ReplyVO replyVo,HttpSession session, HttpServletRequest request) throws Exception {
		session = request.getSession();
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
		BoardVO board = boardService.selectViewInt(boardNo);
		System.out.println("======================================================");
		System.out.println(board.toString());
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
		
		replyVo.setBoardNo(board.getBoardNo());
		replyVo.setMemberId((String)session.getAttribute("SessionMemberId"));
		replyVo.setMemberNickname((String)session.getAttribute("SessionMemberNickname"));
		replyVo.setTargetId(board.getMemberId());
		
		replyService.sendMessage(replyVo);

		return "reply/sendMessage";
	}
	
	@RequestMapping(value= "sendMeTo.do" , method = RequestMethod.POST)
	public String sendMessageTo(int boardNo,ReplyVO replyVo,HttpSession session, HttpServletRequest request) throws Exception {
		session = request.getSession();
		BoardVO board = boardService.selectViewInt(boardNo);
		ReplyVO reply = replyService.sendView(replyVo);
		
		
		replyVo.setBoardNo(board.getBoardNo());
		replyVo.setMemberId((String)session.getAttribute("SessionMemberId"));
		replyVo.setMemberNickname((String)session.getAttribute("SessionMemberNickname"));
		replyVo.setTargetId(reply.getMemberId());
		
		replyService.sendMessage(replyVo);

		return "reply/sendMessage";
	}
	
	
	@RequestMapping(value="sendBox.do")
	public String sendBox(ReplyVO replyVo,Model model) throws Exception {
		
		List<ReplyVO> replyList = replyService.sendBox(replyVo);
		model.addAttribute("replyList", replyList);
		return "reply/sendBox";
	}
	
	@RequestMapping(value="sendView.do")
	public String sendView(ReplyVO replyVo,Model model) throws Exception {
		ReplyVO reply = replyService.sendView(replyVo);
		model.addAttribute("reply", reply);
		return "reply/sendView";
	}
	

}
