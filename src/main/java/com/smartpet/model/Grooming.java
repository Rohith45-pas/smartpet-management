package com.smartpet.model;

public class Grooming {

    private int groomingId;
    private int petId;
    private String groomingType;
    private String groomingDate;
    private String nextDueDate;
    private String notes;

    public Grooming() {
    }

    public Grooming(int petId,
                    String groomingType,
                    String groomingDate,
                    String nextDueDate,
                    String notes) {

        this.petId = petId;
        this.groomingType = groomingType;
        this.groomingDate = groomingDate;
        this.nextDueDate = nextDueDate;
        this.notes = notes;
    }

    public int getGroomingId() {
        return groomingId;
    }

    public void setGroomingId(int groomingId) {
        this.groomingId = groomingId;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getGroomingType() {
        return groomingType;
    }

    public void setGroomingType(String groomingType) {
        this.groomingType = groomingType;
    }

    public String getGroomingDate() {
        return groomingDate;
    }

    public void setGroomingDate(String groomingDate) {
        this.groomingDate = groomingDate;
    }

    public String getNextDueDate() {
        return nextDueDate;
    }

    public void setNextDueDate(String nextDueDate) {
        this.nextDueDate = nextDueDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}