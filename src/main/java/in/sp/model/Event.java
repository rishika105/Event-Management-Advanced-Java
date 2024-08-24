package in.sp.model;

public class Event {
    private int eventid;
    private String title;
    private String location;
    private String time;  // Renamed from slots to time
    private String description;
    private String imagePath;
    private double price;  // New field for price

    // Getters and Setters

    public int getEventId() {
        return eventid;
    }

    public void setId(int eventid) {
        this.eventid = eventid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public double getPrice() {  // Getter for price
        return price;
    }

    public void setPrice(double price) {  // Setter for price
        this.price = price;
    }
}
