package com.ibm.floraHotel.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



@Entity
public class Hotel {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name="id", unique= true, nullable = false)
	private long id;
	
	@Column(name= "hotelName", unique= true,  nullable = false)
	private String hotelName;
	
	@Column(name="location")
	private String location;
	
	@Column(name="image")
	private String image;
	
	@Column(name="roomavailable",  nullable = false)
	private long roomavailable;
	
	public long getRoomAvailable() {
		return roomavailable;
	}

	public void setRoomAvailable(long roomavailable) {
		this.roomavailable = roomavailable;
	}


	@Column(name="price")
	private String price;
	
	@Column(name="description")
	private String description;
	
	public String getImage() {
		return image;
	}

	public void setImage(String image2) {
		this.image = image2;
	}



	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
