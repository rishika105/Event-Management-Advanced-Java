package in.sp.model;

public class FoodModel {
    private int foodId;
    private int bookingId;
    private String foodItems;
    private double totalCost;
    private String foodProviderName;

    // Getters and Setters
    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
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
}
