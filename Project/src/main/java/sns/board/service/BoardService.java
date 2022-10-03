package sns.board.service;

import java.util.List;

public interface BoardService {
	
	List<BoardVO> boardList(BoardVO boardVo) throws Exception;
	
	void insertBoard(BoardVO boardVo) throws Exception;
	
	BoardVO selectView(BoardVO boardVo) throws Exception;
	
	void deleteBoard(BoardVO boardVo) throws Exception;
	
	void updateBoard(BoardVO boardVo) throws Exception;
	
	public int totalBoard(BoardVO boardVo) throws Exception;
	
	BoardVO selectViewInt(int boardNo) throws Exception;
}
