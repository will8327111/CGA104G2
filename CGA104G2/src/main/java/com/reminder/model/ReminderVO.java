package com.reminder.model;

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
@Table(name = "REMINDER",catalog = "Community_Management")
public class ReminderVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "REM_ID",insertable = false)
	private Integer reminderId;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name = "REM_INFO")
	private String reminderInfo;
	@Column(name = "REM_STATUS")
	private Integer reminderStatus;
}
