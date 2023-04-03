package com.my.company.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.company.dao.map.MemberMap;
import com.my.company.domain.MemberDto;

@Repository("dao.MemberDao")
public class MemberDaoImpl implements MemberDao{
	@Autowired private MemberMap memberMap;

	@Override
	public int insertMember(MemberDto memberDto) {
		return memberMap.insertMember(memberDto);
	}	
}
