package com.ibm.floraHotel.dao;

import java.sql.*;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;

import com.ibm.floraHotel.pojo.Booking;

public class BookingDao extends DAO{
	public Booking addOrder(Booking booking) throws Exception{
		try {

			if(getSession().getTransaction().isActive())
			{
				getSession().getTransaction().rollback();
			}
			
			begin();
			getSession().save(booking);
			commit();
			return booking;
			
		} catch (HibernateException e) {
			
			rollback();
		}
		return booking;
	}
	
	public List<Booking> findAllOrderByUserEmail(String userEmail) throws Exception{
		List<Booking> result = null;
		try {
			
				if(getSession().getTransaction().isActive())
				{
					getSession().getTransaction().rollback();
				}
				
				begin();
				Query query = getSession().createQuery("from Booking where curUser = :curUser");
				query.setParameter("curUser", userEmail);
				result = query.list();
				commit();
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Booking> findAllOrder() throws Exception{
		List<Booking> result = null;
		try {
				if(getSession().getTransaction().isActive())
				{
					getSession().getTransaction().rollback();
				}
			begin();
			Query query = getSession().createQuery("from Booking");
			result = query.list();
			
			commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public void deleteBookingById(String id){
		try {
			
			if(getSession().getTransaction().isActive())
			{
				getSession().getTransaction().rollback();
			}
			begin();
			Query query = getSession().createQuery("delete Booking where id = :id");
			query.setString("id", id);
			query.executeUpdate();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
