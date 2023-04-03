package com.my.company.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.company.domain.MemberDto;
import com.my.company.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
    @Autowired
    private MemberService memberService;
    
    @GetMapping
    public ModelAndView membermain(ModelAndView mv) {
    	mv.setViewName("member");
    	return mv;
    }
    
    @PostMapping("add")
    	public void addMember(@RequestBody MemberDto memberDto) {
    	memberService.addMember(memberDto);
    }
}
