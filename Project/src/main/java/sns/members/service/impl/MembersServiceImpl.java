package sns.members.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sns.members.service.MembersDAO;
import sns.members.service.MembersService;
import sns.members.service.MembersVO;

@Service("MembersService")
public class MembersServiceImpl implements MembersService{
	
	@Resource(name = "MembersDAOMyBatis")
	private MembersDAO membersDAO;

	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		membersDAO.signUpMember(membersVo);
		
	}

	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result = membersDAO.loginMember(membersVo);
		return result;
	}

	@Override
	public String memberNickname(String memberId) throws Exception {
		return membersDAO.memberNickname(memberId);
	}

	@Override
	public MembersVO selectMember(String memberId) throws Exception {
		return membersDAO.selectMember(memberId);
	}

}
