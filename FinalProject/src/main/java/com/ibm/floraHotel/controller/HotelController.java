package com.ibm.floraHotel.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.support.RequestPartServletServerHttpRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.floraHotel.dao.BookingDao;
import com.ibm.floraHotel.dao.HotelDao;
import com.ibm.floraHotel.pojo.Booking;
import com.ibm.floraHotel.pojo.Hotel;
import com.ibm.floraHotel.pojo.User;

@Controller
public class HotelController {
	@RequestMapping(value = "/hotels", method = RequestMethod.GET)
	public ModelAndView displayHotels(HotelDao hotelDao, HttpServletRequest request) {
		List<Hotel> hotels = hotelDao.getAllHotels();
		return new ModelAndView("hotels", "hotels", hotels);
	}

	
	  @RequestMapping(value = "/hoteladddetails", method = RequestMethod.GET) public
	  String getAddHotelPage() { return "hoteladd"; }
	 

	@RequestMapping(value = "/hotelbook/*", method = RequestMethod.GET)
	public ModelAndView getBookView(HotelDao hotelDao, HttpServletRequest request) {
		String id = request.getParameter("id");
		String sId = id.replaceAll("'", "");
		Hotel hotel = hotelDao.getHotelById(sId);
//		request.setAttribute("hotel", hotel);
		return new ModelAndView("hotelbook", "hotel", hotel);
	}

	@RequestMapping(value = "/hoteldelete/*", method = RequestMethod.GET)
	public String deleteHotel(HotelDao hotelDao, HttpServletRequest request) {
		String id = request.getParameter("id");
		String sId = id.replaceAll("'", "");
		hotelDao.removeHotelById(sId);
		return "redirect:/hotels";
	}

	@RequestMapping(value = "/hotelupdate/*", method = RequestMethod.GET)
	public ModelAndView updateHotelView(HotelDao hotelDao, HttpServletRequest request) {
		String id = request.getParameter("id");
		String sId = id.replaceAll("'", "");
		Hotel hotel = hotelDao.getHotelById(sId);
		return new ModelAndView("hotelupdate", "hotel", hotel);
	}

	@RequestMapping(value = "/hotelupdate/*", method = RequestMethod.POST)
	public String updateHotel(HotelDao hotelDao, HttpServletRequest request) throws SQLException, IOException {
		String id = request.getParameter("id");
		String sId = id.replaceAll("'", "");
		System.out.println(id + " from hotel update post request");
		String hotelName = request.getParameter("hotelName");
		String location = request.getParameter("location");

		String image = request.getParameter("image");

		String price = request.getParameter("price");
		String description = request.getParameter("description");
		long roomavailable=Long.parseLong(request.getParameter("roomavailable"));
		hotelDao.updateHotelById(sId, hotelName, image, location, price, description,roomavailable);
		return "redirect:/hotels";
	}

	@RequestMapping(value = "/hotelbook", method = RequestMethod.POST)
	public String bookHotel(BookingDao bookingDao, HttpServletRequest request) throws Exception {

		// GET CURRENT USER
		HttpSession session = request.getSession();
		User curUser = (User) session.getAttribute("curUser");

		// GET OTHER ORDER ATTRIBUTE FROM FORM
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String date = request.getParameter("date");
		String hotelName = request.getParameter("hotelName");
		String phone = request.getParameter("phone");

//		fetch value of roomAvail from database
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/final", "root", "1234");

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select roomAvailable from hotel where hotelName= '" + hotelName + "'");
			int roomAvail = 0;
			while (rs.next()) {
				roomAvail = rs.getInt(1);
			}
			System.out.println(roomAvail);
			if (roomAvail > 0) {

				// create new order object and store in database
				Booking booking = new Booking();
				booking.setFirstName(firstName);
				booking.setLastName(lastName);
				booking.setHotelName(hotelName);
				booking.setPhone(phone);
				booking.setDate(date);
				booking.setCurUser(curUser.getUserEmail());

				//System.out.println("inside try");
				Booking o = bookingDao.addOrder(booking);
				System.out.println("call complete addOrder");
				--roomAvail;
				stmt.executeUpdate(
						"Update Hotel set roomAvailable=" + roomAvail + " where hotelname='" + hotelName + "'");
				return "redirect:/hotels";

			} else {
				request.setAttribute("getAlert", "yes");
			}
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/hotels";

	}

	@RequestMapping(value = "/hoteldetail/*", method = RequestMethod.GET)
	public ModelAndView getHotelDetail(HotelDao hotelDao, HttpServletRequest request) {
		String id = request.getParameter("id");
		String sId = id.replaceAll("'", "");
		Hotel hotel = hotelDao.getHotelById(sId);
//		Hotel hotel = hotelDao.getHotelById(id); 	MY COMMENT
		request.setAttribute("hotel", hotel);
		return new ModelAndView("hoteldetail", "hotel", hotel);
	}

	@RequestMapping(value = "/hoteladd", method = RequestMethod.POST)
	public String addHotel(HotelDao hotelDao, HttpServletRequest request) throws SQLException, IOException {
		String hotelName = request.getParameter("hotelName");
		String location = request.getParameter("location");

		String image = request.getParameter("image");

		String price = request.getParameter("price");
		String description = request.getParameter("description");
		long roomavailable=Long.parseLong(request.getParameter("roomavailable"));
		
		Hotel hotel = new Hotel();
		hotel.setHotelName(hotelName);
		hotel.setImage(image);
		hotel.setLocation(location);
		hotel.setPrice(price);
		hotel.setDescription(description);
		hotel.setRoomAvailable(roomavailable);

		try {
			Hotel h = hotelDao.addHotel(hotel);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return null;
	}

	@RequestMapping(value = "/viewbooking", method = RequestMethod.GET)
	public ModelAndView viewBooking(BookingDao bookingDao, HttpServletRequest request) throws Exception {
		// GET CURRENT USER
		HttpSession session = request.getSession();
		User curUser = (User) session.getAttribute("curUser");

		// GET ALL BOOKING UNDER THIS USER
		List<Booking> bookings = bookingDao.findAllOrderByUserEmail(curUser.getUserEmail());
//		request.setAttribute("bookings", bookings);
		return new ModelAndView("viewbooking", "bookings", bookings);
	}

	@RequestMapping(value = "/managebooking", method = RequestMethod.GET)
	public ModelAndView manangeBookingView(BookingDao bookingDao, HttpServletRequest request) throws Exception {
		List<Booking> bookings = bookingDao.findAllOrder();

		return new ModelAndView("managebooking", "bookings", bookings);
	}

	@RequestMapping(value = "/hotelsearch", method = RequestMethod.POST)
	public ModelAndView searchHotel(HotelDao hotelDao, HttpServletRequest request) throws Exception {
		String searchName = (request.getParameter("searchName"));
		List<Hotel> hotels = hotelDao.getHotelByName(searchName);
		return new ModelAndView("hotels", "hotels", hotels);
	}
	
	@RequestMapping(value="/cancelbooking", method = RequestMethod.GET)
	public String cancelBooking(BookingDao bookingDao, HttpServletRequest request) throws Exception {
	      	
		String param = request.getParameter("id");
		int id = Integer.parseInt(param);
		bookingDao.deleteBookingById(param);
		System.out.println("id : "+id);
		return "redirect:/managebooking";
	}
	@RequestMapping(value="/contactus", method = RequestMethod.GET)
	public ModelAndView contactUs(ModelAndView mv)
	{
		mv.setViewName("contactus");
		return mv;
	}
}
