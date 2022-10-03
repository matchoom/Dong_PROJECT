package sns.members.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import sns.members.service.MembersDAO;
import sns.members.service.MembersVO;

@Repository("MembersDAOMyBatis")
public class MembersDAOMyBatis extends EgovAbstractMapper implements MembersDAO {

	@Override
	public void signUpMember(MembersVO membersVo) throws Exception {
		insert("signUpMember",membersVo);
		
	}

	@Override
	public int loginMember(MembersVO membersVo) throws Exception {
		int result= selectOne("loginMember", membersVo);
		return result;
	}

	@Override
	public String memberNickname(String memberId) throws Exception {
		return selectOne("memberNickname", memberId);
	}

	@Override
	public MembersVO selectMember(String memberId) throws Exception {
		return selectOne("selectMember", memberId);
	}

}
