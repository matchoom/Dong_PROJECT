package sns.members.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MembersVO {
	
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberNickname;
	private String memberResident;
	private String memberAddress;

}
