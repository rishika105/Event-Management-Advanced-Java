package in.sp.model;

public class TransportationModel {
    private int transportationId;      // Primary Key, Auto-Increment
    private int bookingId;        // Foreign Key, references Booking
    private String vehicleType;   // e.g., Car, Bus
    private String pickupLocation;
    private String dropoffLocation;
    private String pickupTime;
    private double price;         // Price according to the vehicle type

    // Getters and Setters
    public int getTransportationId() {
        return transportationId;
    }

    public void setTransportationId(int transportationId) {
        this.transportationId = transportationId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
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
}