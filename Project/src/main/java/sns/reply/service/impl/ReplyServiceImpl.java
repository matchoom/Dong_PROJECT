package sns.reply.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sns.reply.service.ReplyDAO;
import sns.reply.service.ReplyService;
import sns.reply.service.ReplyVO;

@Service("ReplyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Resource(name = "ReplyDAOMyBatis")
	private ReplyDAO replyDAO;

	@Override
	public void sendMessage(ReplyVO replyVo) throws Exception {
		replyDAO.sendMessage(replyVo);
		
	}

	@Override
	public List<ReplyVO> sendBox(ReplyVO replyVo) throws Exception {
		return replyDAO.sendBox(replyVo);
	}

	@Override
	public ReplyVO sendView(ReplyVO replyVo) throws Exception {
		return replyDAO.sendView(replyVo);
	}
}
