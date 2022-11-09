package com.activity.common;

import org.hibernate.Session;

import com.activity.model.ActivityVO;
import com.activityphoto.model.ActivityPhotoDAO;
import com.activityphoto.model.ActivityPhotoVO;
import com.activitytype.model.ActivityTypeVO;


public class test {
	
	public static void main(String[] args) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		ActivityTypeVO photo = session.get(ActivityTypeVO.class,2 );
		System.out.println(photo.getActTypeName());
		HibernateUtil.shutdown();
	}

}
