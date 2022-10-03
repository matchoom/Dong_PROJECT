package sns.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sns.board.service.BoardService;
import sns.board.service.BoardVO;
import sns.members.service.MembersVO;

@Controller
public class BoardController{

	@Resource(name = "BoardService")
	private BoardService boardService;

	@RequestMapping("main.do")
	public String test(HttpSession session, HttpServletRequest request) {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		System.out.println("!@$!@$!@$!@$!@$!@$!@$!@$!@$!@$"+memberId);
		return "index";
	}

	@RequestMapping("boardList.do")
	public String boardList(HttpSession session, HttpServletRequest request, Model model, MembersVO membersVo,
			BoardVO boardVo) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		session.setAttribute("SessionMemberId", memberId);
		
		int total= boardService.totalBoard(boardVo);
		int totalPage=(int)Math.ceil((double)total/10);
		int pageList=boardVo.getPageList();
		
		int viewPage=boardVo.getViewPage();
		
		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 10;
		int endIndex = 10;
		
		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);
		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);
		
		List<BoardVO> boardList = boardService.boardList(boardVo);
		
		
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("boardList",boardList);
		

		return "board/boardList";
	}
	
	@RequestMapping(value="insert.do",method = RequestMethod.GET)
	public String insert(HttpSession session, HttpServletRequest request,Model model,String memberId) throws Exception {
		
		//model.addAttribute("memberSelect", service.selectMember(memberIds));
		return "board/insertBoard";
	}
	
	
	//파일 업로드
	@PostMapping("/upload_ok")
	public String upload(@RequestParam("file") MultipartFile file, BoardVO boardVO,
			MembersVO membersVO, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("------>" + boardVO.toString());
		String data = "";
		session = request.getSession();
		// System.out.println(session);
		String memberId = (String) session.getAttribute("SessionMemberId");
		String memberNickname = (String) session.getAttribute("SessionMemberNickname");
		System.out.println("------>" + memberId + " : " + memberNickname);

		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		// 여기서 화이트 리스트로 정리해서 파일 업로드 막아야함....
		
		
		String fileExtension = "";
		
		if(fileRealName != "") {
			fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			
		}
		// String uploadFolder =
		// "/Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload";
		String uploadFolder = "C:\\picture";
//		윈도우 쪽 파일 업로드 경로.... 맥이라 저랑 다름..
//		String uploadFolder = "C:\\test\\upload";
		// 이러면 upload 파일 안에 들어감

		/*
		 * 파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다.
		 * 타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시) 고유한 랜던 문자를 통해 db와 서버에 저장할
		 * 파일명을 새롭게 만들어 준다.
		 * 
		 * /Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload
		 */

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		memberId = (String) session.getAttribute("SessionMemberId");
		memberNickname = (String) session.getAttribute("SessionMemberNickname");
		// System.out.println("닉네임"+memberNickname);

		boardVO.setMemberId(memberId);
		boardVO.setMemberNickname(memberNickname);
		boardVO.setPicturePath(uniqueName + fileExtension);
		boardService.insertBoard(boardVO);
		System.out.println();

		// uniqueName이게 어떻게 해서 만들어진 사진 이름
		// fileExtension 이 어떻게 해서 만들어진 파일 확장자 이름

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		//File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension); // 적용
		// 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:boardList.do";
	}
	
	
	@RequestMapping(value = "/view.do")
	public String reviewBoard(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request,
			MembersVO membersVo) throws Exception {
		// System.out.println("리뷰보드 컨트롤러");
		System.out.println("보드" + boardVo);
		String memberId = null;
		MembersVO sessionMember = null;
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		sessionMember = (MembersVO) session.getAttribute("SessionMember");

		BoardVO selectView = boardService.selectView(boardVo);
		
		membersVo.setMemberId(selectView.getMemberId());
		model.addAttribute("board", selectView);
		model.addAttribute("memberId", memberId);
		model.addAttribute("sessionMember", sessionMember);
		return "board/viewBoard";
	}
	
	@RequestMapping(value = "/deleteBoard.do")
	public String deleteReview(BoardVO boardVo) throws Exception {
		// System.out.println("딜리트시작");
		// System.out.println("딜리트넘버값"+boardVo.toString());
		System.out.println("====>>>>>>>"+boardVo.toString());
		boardService.deleteBoard(boardVo);
		return "board/insertBoard";
	}
	
	@RequestMapping(value = "updateView.do")
	public String reviewUp(BoardVO boardVo, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {
		// System.out.println(boardVo);
		String memberId = null;
		MembersVO sessionMember = null;
		BoardVO test = boardService.selectView(boardVo);
		test.setContent(test.getContent().replace("<br>", "\r\n"));
//		/* model.addAttribute("reviewBoard", boardService.selectReview(boardVo)); */
		model.addAttribute("board", test);
		// System.out.println(reviewBoard.toString());
		return "board/updateBoard";
	}
	
	@RequestMapping(value = "updateBoard.do", method=RequestMethod.POST)
	public String reviewUpdate(BoardVO boardVO, @RequestParam("file") MultipartFile file,
			MembersVO membersVO, HttpSession session, HttpServletRequest request) throws Exception {
		// System.out.println("넘어온 값"+boardVo.toString());
		
		
		System.out.println("QW!@E!@E!@E!@E!@E!@E!@E!@E!@E!@E!@E");
		
		System.out.println("------>" + boardVO.toString());
		String data = "";
		session = request.getSession();
		// System.out.println(session);

		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		// 여기서 화이트 리스트로 정리해서 파일 업로드 막아야함....
		
		
		String fileExtension = "";
		
		if(fileRealName != "") {
			fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			
		}
		// String uploadFolder =
		// "/Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload";
		//String uploadFolder = "/Users/roopre/Desktop/DIP/picture";
//		윈도우 쪽 파일 업로드 경로.... 맥이라 저랑 다름..
		String uploadFolder = "C:\\picture";
		// 이러면 upload 파일 안에 들어감

		/*
		 * 파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다.
		 * 타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시) 고유한 랜던 문자를 통해 db와 서버에 저장할
		 * 파일명을 새롭게 만들어 준다.
		 * 
		 * /Users/roopre/egov/PetInDeligth/src/main/webapp/resource/upload
		 */

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		// System.out.println("닉네임"+memberNickname);

		boardVO.setPicturePath(uniqueName + fileExtension);
		boardService.updateBoard(boardVO);
		// uniqueName이게 어떻게 해서 만들어진 사진 이름
		// fileExtension 이 어떻게 해서 만들어진 파일 확장자 이름

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		//File saveFile = new File(uploadFolder+"/"+uniqueName + fileExtension); // 적용
		// 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "redirect:boardList.do";
	}
	
	@RequestMapping("myBoard.do")
	public String myBoard(HttpSession session, HttpServletRequest request, Model model, MembersVO membersVo,
			BoardVO boardVo) throws Exception {
		String memberId = "";
		session = request.getSession();
		memberId = (String) session.getAttribute("SessionMemberId");
		session.setAttribute("SessionMemberId", memberId);
		
		int total= boardService.totalBoard(boardVo);
		int totalPage=(int)Math.ceil((double)total/10);
		int pageList=boardVo.getPageList();
		
		int viewPage=boardVo.getViewPage();
		
		int firstPage = ((viewPage - 1) / pageList) * pageList + 1;
		int lastPage = firstPage + pageList - 1;
		if (lastPage > totalPage) {
			lastPage = totalPage;
		}
		int startIndex = (viewPage - 1) * 10;
		int endIndex = 10;
		
		boardVo.setStartIndex(startIndex);
		boardVo.setEndIndex(endIndex);
		boardVo.setPageList(pageList);
		boardVo.setFirstPage(firstPage);
		boardVo.setLastPage(lastPage);
		
		List<BoardVO> boardList = boardService.boardList(boardVo);
		
		
		
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageList", pageList);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("boardList",boardList);
		

		return "board/myBoard";
	}
	
}
