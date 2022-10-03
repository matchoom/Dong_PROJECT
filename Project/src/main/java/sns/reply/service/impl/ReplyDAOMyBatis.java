package sns.reply.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import sns.reply.service.ReplyDAO;
import sns.reply.service.ReplyVO;

@Repository("ReplyDAOMyBatis")
public class ReplyDAOMyBatis extends EgovAbstractMapper implements ReplyDAO {

	@Override
	public void sendMessage(ReplyVO replyVo) throws Exception {
		insert("sendMessage",replyVo);
	}

	@Override
	public List<ReplyVO> sendBox(ReplyVO replyVo) throws Exception {
		return selectList("sendBox",replyVo);
	}

	@Override
	public ReplyVO sendView(ReplyVO replyVo) throws Exception {
		return selectOne("sendView",replyVo);
	}

}
