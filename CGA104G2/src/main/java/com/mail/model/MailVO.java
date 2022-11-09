package com.mail.model;

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
@Table(name = "MAIL",catalog = "Community_Management")
public class MailVO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MAIL_ID",insertable = false)
	private Integer mailId;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name = "MAIL_TYPE")
	private String mailType;
	@Column(name = "MAIL_DEL_TIME")
	private Date mailDelTime;
	@Column(name = "MAIL_PICKUP_TIME",insertable = false)
	private Date mailPickupTime;
	@Column(name = "MAIL_STATE",insertable = false)
	private	Integer mailState;
//	@Column(name = "MEMBER_NAME",insertable = false)
//	private String memberName;

	
}
