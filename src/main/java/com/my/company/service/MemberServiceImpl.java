package com.my.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.company.dao.MemberDao;
import com.my.company.domain.MemberDto;

@Service("service.MemberService")
public class MemberServiceImpl implements MemberService {
    @Autowired private MemberDao memberDao;
    
    @Override
    public void addMember(MemberDto memberDto) {
    	memberDao.insertMember(memberDto);
    }
    
}
