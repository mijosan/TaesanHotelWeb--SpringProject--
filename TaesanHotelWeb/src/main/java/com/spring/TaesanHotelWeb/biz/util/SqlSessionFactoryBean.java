package com.spring.TaesanHotelWeb.biz.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryBean {
	private static SqlSessionFactory sessionFactory = null; 
	static { //static 초기화를 사용하면 맨처음 static을 부르는상황이 오면 자동으로 초기화된다.
		try {
			if(sessionFactory == null) {
				Reader reader = Resources.getResourceAsReader("sql/sql-map-config.xml");
				sessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSqlSessionInstance() {
		return sessionFactory.openSession();
	}
}
