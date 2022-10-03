package sns.members.service;


public interface MembersDAO {
	
	void signUpMember(MembersVO membersVo)throws Exception;
	
	int loginMember(MembersVO membersVo) throws Exception;
	
	String memberNickname(String memberId) throws Exception;
	
	MembersVO selectMember(String memberId) throws Exception;

}
