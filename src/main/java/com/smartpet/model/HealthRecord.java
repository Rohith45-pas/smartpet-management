package com.smartpet.model;

public class HealthRecord {

    private int healthId;
    private int petId;
    private String healthDate;
    private String conditionName;
    private String description;
    private String treatment;

    public HealthRecord() {
    }

    public HealthRecord(int petId, String healthDate,
                        String conditionName, String description,
                        String treatment) {
        this.petId = petId;
        this.healthDate = healthDate;
        this.conditionName = conditionName;
        this.description = description;
        this.treatment = treatment;
    }

    public int getHealthId() {
        return healthId;
    }

    public void setHealthId(int healthId) {
        this.healthId = healthId;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getHealthDate() {
        return healthDate;
    }

    public void setHealthDate(String healthDate) {
        this.healthDate = healthDate;
    }

    public String getConditionName() {
        return conditionName;
    }

    public void setConditionName(String conditionName) {
        this.conditionName = conditionName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTreatment() {
        return treatment;
    }

    public void setTreatment(String treatment) {
        this.treatment = treatment;
    }
}