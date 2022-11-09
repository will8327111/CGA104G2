package com.activityreply.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ACTIVITY_REPLY",catalog = "Community_Management")
public class ActivityReplyVO implements Serializable {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="ACTIVITY_REPLY_ID")
	private Integer actReplyId;
	@Column(name="ACTIVITY_ID")
	private Integer actId;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name="REPLY_CONTENT")
	private String replyContent;
	@Column(name="REPLY_DATE")
	private Date replyDate;
	
	

}
