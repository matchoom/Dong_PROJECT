package sns.reply.service;

import java.util.List;

public interface ReplyDAO {
	
	void sendMessage(ReplyVO replyVo) throws Exception;
	
	List<ReplyVO> sendBox(ReplyVO replyVo) throws Exception;
	
	ReplyVO sendView(ReplyVO replyVo) throws Exception;
}
