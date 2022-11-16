package com.activityreport.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.activity.model.ActivityVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ACTIVITY_REPORT",catalog = "Community_Management")
public class ActivityReportVO implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ACTIVITY_REPORT_ID")
	private Integer actReportId;
	@Column(name = "ACTIVITY_ID")
	private Integer actId;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name = "REPORT_CONTENT")
	private String reportContent;
	@Column(name = "REPORT_STATUS" ,insertable = false)
	private Integer reportStatus;
	@Column(name = "REPORT_NOTE" ,insertable = false)
	private String  reportNote;


	
}
