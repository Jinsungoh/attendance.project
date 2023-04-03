package com.my.company.domain;


import lombok.Data;

@Data
public class MemberDto {
	private String comId;
	private String comName;
    private String pw;  
    private String email;        
    private String regNo;     
    private String comaddr;
    private String comdetailaddr;
    private String compostcode;
    private String president;     
    private String ph;  
}
