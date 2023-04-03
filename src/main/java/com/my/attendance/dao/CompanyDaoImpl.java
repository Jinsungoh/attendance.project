package com.my.attendance.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.attendance.dao.map.CompanyMap;
import com.my.attendance.domain.Company;

@Repository("CompanyDao")
public class CompanyDaoImpl implements CompanyDao{
	@Autowired private CompanyMap companyMap;

	@Override
	public Company insertMember(Company company) {
		 return companyMap.insertMember(company);
	}	
}
