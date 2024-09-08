package in.sp.model;

import java.math.BigDecimal;
import java.util.Date;

public class Bookinghistory {
	 private int booking_id;
	    private String event_type;
	    private int number_of_guests;
	    private BigDecimal event_price;
	    private String email;
	    private Date date;
	    private String phone;
	    
	    public int getBooking_id() {
			return booking_id;
		}
		public void setBooking_id(int booking_id) {
			this.booking_id = booking_id;
		}
		public String getEvent_type() {
			return event_type;
		}
		public void setEvent_type(String event_type) {
			this.event_type = event_type;
		}
		public int getNumber_of_guests() {
			return number_of_guests;
		}
		public void setNumber_of_guests(int number_of_guests) {
			this.number_of_guests = number_of_guests;
		}
		public BigDecimal getEvent_price() {
			return event_price;
		}
		public void setEvent_price(BigDecimal event_price) {
			this.event_price = event_price;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public String getPhone() {
			return phone;
		}
		public void setPhone(String phone) {
			this.phone = phone;
		}
		public int getFoodId() {
			return foodId;
		}
		public void setFoodId(int foodId) {
			this.foodId = foodId;
		}
		public String getFoodItems() {
			return foodItems;
		}
		public void setFoodItems(String foodItems) {
			this.foodItems = foodItems;
		}
		public double getTotalCost() {
			return totalCost;
		}
		public void setTotalCost(double totalCost) {
			this.totalCost = totalCost;
		}
		public String getFoodProviderName() {
			return foodProviderName;
		}
		public void setFoodProviderName(String foodProviderName) {
			this.foodProviderName = foodProviderName;
		}
		public int getTransportationId() {
			return transportationId;
		}
		public void setTransportationId(int transportationId) {
			this.transportationId = transportationId;
		}
		public String getVehicleType() {
			return vehicleType;
		}
		public void setVehicleType(String vehicleType) {
			this.vehicleType = vehicleType;
		}
		public String getPickupLocation() {
			return pickupLocation;
		}
		public void setPickupLocation(String pickupLocation) {
			this.pickupLocation = pickupLocation;
		}
		public String getDropoffLocation() {
			return dropoffLocation;
		}
		public void setDropoffLocation(String dropoffLocation) {
			this.dropoffLocation = dropoffLocation;
		}
		public String getPickupTime() {
			return pickupTime;
		}
		public void setPickupTime(String pickupTime) {
			this.pickupTime = pickupTime;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		private int foodId;
	    
	    private String foodItems;
	    private double totalCost;
	    private String foodProviderName;
	    private int transportationId;      // Primary Key, Auto-Increment
	           
	    private String vehicleType;   // e.g., Car, Bus
	    private String pickupLocation;
	    private String dropoffLocation;
	    private String pickupTime;
	    private double price; 

}
