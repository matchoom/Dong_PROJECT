package sns.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sns.board.service.BoardDAO;
import sns.board.service.BoardService;
import sns.board.service.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{
	
	@Resource(name = "BoardDAOMyBatis")
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> boardList(BoardVO boardVo) throws Exception {
		return boardDAO.boardList(boardVo);
	}

	@Override
	public void insertBoard(BoardVO boardVo) throws Exception {
		boardDAO.insertBoard(boardVo);
		
	}

	@Override
	public BoardVO selectView(BoardVO boardVo) throws Exception {
		return boardDAO.selectView(boardVo);
	}

	@Override
	public void deleteBoard(BoardVO boardVo) throws Exception {
		boardDAO.deleteBoard(boardVo);
		
	}

	@Override
	public void updateBoard(BoardVO boardVo) throws Exception {
		boardDAO.updateBoard(boardVo);
		
	}

	@Override
	public int totalBoard(BoardVO boardVo) throws Exception {
		return boardDAO.totalBoard(boardVo);
	}

	@Override
	public BoardVO selectViewInt(int boardNo) throws Exception {
		return boardDAO.selectViewInt(boardNo);
	}

}
