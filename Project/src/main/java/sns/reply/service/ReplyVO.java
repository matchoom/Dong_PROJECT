package sns.reply.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyVO {
	
	private int replyNo;
	private String title;
	private String content;
	private Date wdate;
	private int boardNo;
	private String memberId;
	private String memberNickname;
	private String targetId;
	

}
