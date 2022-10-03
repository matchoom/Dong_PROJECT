package sns.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import sns.board.service.BoardDAO;
import sns.board.service.BoardVO;

@Repository("BoardDAOMyBatis")
public class BoardDAOMyBatis extends EgovAbstractMapper implements BoardDAO{

	@Override
	public List<BoardVO> boardList(BoardVO boardVo) throws Exception {
		return selectList("boardList",boardVo);
	}

	@Override
	public void insertBoard(BoardVO boardVo) throws Exception {
		insert("insertBoard",boardVo);
		
	}

	@Override
	public BoardVO selectView(BoardVO boardVo) throws Exception {
		return selectOne("selectView",boardVo);
	}

	@Override
	public void deleteBoard(BoardVO boardVo) throws Exception {
		delete("deleteBoard",boardVo);
		
	}

	@Override
	public void updateBoard(BoardVO boardVo) throws Exception {
		update("updateBoard",boardVo);
		
	}

	@Override
	public int totalBoard(BoardVO boardVo) throws Exception {
		int rs = selectOne("totalBoard", boardVo);
		return rs;
	}

	@Override
	public BoardVO selectViewInt(int boardNo) throws Exception {
		return selectOne("selectViewInt",boardNo);
	}

}
