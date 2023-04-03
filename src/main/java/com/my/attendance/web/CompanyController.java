package com.my.attendance.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.attendance.domain.Company;
import com.my.attendance.service.CompanyService;

@Controller
@RequestMapping("company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;
    
    @GetMapping
    public ModelAndView company(ModelAndView mv) {
    	mv.setViewName("company");
    	return mv;
    }
    
    @PostMapping("add")
    	public void addMember(@RequestBody Company company) {
    	companyService.addMember(company);
    }
}
