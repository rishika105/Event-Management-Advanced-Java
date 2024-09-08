package in.sp.model;

import java.math.BigDecimal;
import java.util.Date;

public class Booking {
    private int booking_id;
    private String event_type;
    private int number_of_guests;
    private BigDecimal event_price;
    private String email;
    private Date date;
    private String phone;
    
    // Getter and Setter for booking_id
    public int getBooking_id() {
        return booking_id;
    }
    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }
    
    // Getter and Setter for event_type
    public String getEvent_type() {
        return event_type;
    }
    public void setEvent_type(String event_type) {
        this.event_type = event_type;
    }
    
    // Getter and Setter for number_of_guests
    public int getNumber_of_guests() {
        return number_of_guests;
    }
    public void setNumber_of_guests(int number_of_guests) {
        this.number_of_guests = number_of_guests;
    }
    
    // Getter and Setter for event_price
    public BigDecimal getEvent_price() {
        return event_price;
    }
    public void setEvent_price(BigDecimal event_price) {
        this.event_price = event_price;
    }
    
    // Getter and Setter for email
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    // Getter and Setter for date
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    
    // Getter and Setter for phone
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
	public void setFoodModel(FoodModel food) {
		// TODO Auto-generated method stub
		
	}
	public void setTransportationModel(TransportationModel transportation) {
		// TODO Auto-generated method stub
		
	}
}
