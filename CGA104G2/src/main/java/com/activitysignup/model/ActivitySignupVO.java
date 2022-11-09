package com.activitysignup.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ACTIVITY_SIGNUP",catalog = "Community_Management")
public class ActivitySignupVO implements Serializable{
	
	@Id
	@Column(name = "ACTIVITY_ID")
	private Integer actId;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name = "SIGNUP_TIME")
	private Date signupTime;
	@Column(name = "SIGNUP_NUMBER")
	private Integer signupNumber;
	@Column(name = "SIGNUP_STATUS" ,insertable = false)
	private Integer signupStatus;
	
}
