package sns.board.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	
	private int boardNo;
	private String title;
	private String content;
	private int price;
	private Date wdate;
	private String boardType;
	private String memberId;
	private String memberNickname;
	private String picturePath;
	
	
	private int viewPage = 1;
	private int startIndex = 0;
	private int endIndex = 10;
	
	private int pageList = 5;
	private int firstPage = 0;
	private int lastPage = 0;

}
