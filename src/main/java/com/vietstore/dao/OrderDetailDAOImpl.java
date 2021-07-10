package com.vietstore.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.vietstore.entity.OrderDetail;
@Transactional
@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
	@Autowired
	SessionFactory factory;
	@Override
	public OrderDetail findById(Integer id) {
		Session session= factory.getCurrentSession();
		OrderDetail entity = session.find(OrderDetail.class,id);
		return entity;
	}

	@Override
	public List<OrderDetail> findAll() {
		String hql="FROM OrderDetail";
		Session session= factory.getCurrentSession();
		TypedQuery<OrderDetail>query= session.createQuery(hql,OrderDetail.class);
		List<OrderDetail>list=query.getResultList();
		
		return list;
	}

	@Override
	public OrderDetail create(OrderDetail entity) {
		Session session= factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(OrderDetail entity) {
		Session session= factory.getCurrentSession();
		session.update(entity);
		
	}

	@Override
	public OrderDetail delete(Integer id) {
		Session session= factory.getCurrentSession();
		OrderDetail entity = session.find(OrderDetail.class,id);
		session.delete(entity);
		return entity;
	}
	
	

}
