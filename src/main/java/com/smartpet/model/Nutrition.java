package com.smartpet.model;

public class Nutrition {

    private int nutritionId;
    private int petId;
    private String foodName;
    private String foodType;
    private String quantity;
    private String feedingTime;
    private String notes;

    public Nutrition() {
    }

    public Nutrition(int petId,
                     String foodName,
                     String foodType,
                     String quantity,
                     String feedingTime,
                     String notes) {

        this.petId = petId;
        this.foodName = foodName;
        this.foodType = foodType;
        this.quantity = quantity;
        this.feedingTime = feedingTime;
        this.notes = notes;
    }

    public int getNutritionId() {
        return nutritionId;
    }

    public void setNutritionId(int nutritionId) {
        this.nutritionId = nutritionId;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodType() {
        return foodType;
    }

    public void setFoodType(String foodType) {
        this.foodType = foodType;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getFeedingTime() {
        return feedingTime;
    }

    public void setFeedingTime(String feedingTime) {
        this.feedingTime = feedingTime;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}