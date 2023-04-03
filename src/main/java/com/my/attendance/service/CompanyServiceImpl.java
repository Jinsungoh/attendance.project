package com.my.attendance.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.attendance.dao.CompanyDao;
import com.my.attendance.domain.Company;

@Service("service.CompanyService")
public class CompanyServiceImpl implements CompanyService {
    @Autowired private CompanyDao companyDao;
    
    @Override
    public void addMember(Company company) {
    	companyDao.insertMember(company);
    }
    
}
