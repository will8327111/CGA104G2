package com.activity.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.activityphoto.model.ActivityPhotoVO;
import com.activityreply.model.ActivityReplyVO;
import com.activityreport.model.ActivityReportVO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "ACTIVITY",catalog = "Community_Management")
public class ActivityVO implements Serializable{
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name = "ACTIVITY_ID")
	private Integer actId;
	@Column(name = "MEMBER_ID")
	private Integer memberId;
	@Column(name = "ACTIVITY_TYPE_ID")
	private Integer actType;
	@Column(name = "ACTIVITY_NAME")
	private String actName;
	@Column(name = "ACTIVITY_CONTENT")
	private String actContent;
	@Column(name = "ACTIVITY_CURRENT_COUNT" ,insertable = false,updatable = false )
	private Integer actCurrentCount;
	@Column(name = "ACTIVITY_MAX_COUNT")
	private Integer actMaxCount;
	@Column(name = "ACTIVITY_MIN_COUNT")
	private Integer actMinCount;
	@Column(name = "ACTIVITY_START_TIME")
	private Date actStart;
	@Column(name = "ACTIVITY_END_TIME")
	private Date actEnd;
	@Column(name = "SIGNUP_START_TIME")
	private Date signStart;
	@Column(name = "SIGNUP_END_TIME")
	private Date signEnd;
	@Column(name = "ACTIVITY_COUNTY")
	private String actCountry;
	@Column(name = "ACTIVITY_LOCATION")
	private String actLocation;
	@Column(name = "ACTIVITY_COST")
	private Integer actCost;
	@Column(name = "ACTIVITY_STATUS" ,insertable = false,updatable = false)
	private Integer actStatus;
	


	@OneToMany
	@JoinColumn(name = "ACTIVITY_ID",referencedColumnName = "ACTIVITY_ID")
	private List<ActivityPhotoVO> photos;
	
	
	@OneToMany
	@JoinColumn(name = "ACTIVITY_ID",referencedColumnName = "ACTIVITY_ID")
	private List<ActivityReportVO> reports;
			
	@OneToMany
	@JoinColumn(name = "ACTIVITY_ID",referencedColumnName = "ACTIVITY_ID")
	private List<ActivityReplyVO> repies;
	
//	@OneToOne
//	@JoinColumn(name = "ACTIVITY_TYPE_ID",insertable=false ,updatable=false)
//	private ActivityTypeVO activityTypeVO;
	
//	public static void main(String[] args) {
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		ActivityVO activityVO = session.get(ActivityVO.class, 91);
//		System.out.println(activityVO.activityTypeVO.getActTypeName());
//		
//	}
//	
	
	
//	
//	public static void main(String[] args) {
//		Session session = HibernateUtil.getSessionFactory().openSession();
//		session.beginTransaction();	
//		final String hql = " update ActivityVO SET actCurrentCount = :number where actId = :id  ";
//		session.createQuery(hql).setParameter("number", 0).setParameter("id", 91).executeUpdate();
//			System.out.println("有執行");
//		session.getTransaction().commit();	
//			session.close();
//		}
//	

}
