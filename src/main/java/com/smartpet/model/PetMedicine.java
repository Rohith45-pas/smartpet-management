package com.smartpet.model;

public class PetMedicine {

    private int petMedicineId;
    private int petId;
    private int medicineId;
    private String dosage;
    private String frequency;
    private String startDate;
    private String endDate;
    private String notes;

    public PetMedicine() {
    }

    public PetMedicine(int petId,
                       int medicineId,
                       String dosage,
                       String frequency,
                       String startDate,
                       String endDate,
                       String notes) {

        this.petId = petId;
        this.medicineId = medicineId;
        this.dosage = dosage;
        this.frequency = frequency;
        this.startDate = startDate;
        this.endDate = endDate;
        this.notes = notes;
    }

    public int getPetMedicineId() {
        return petMedicineId;
    }

    public void setPetMedicineId(int petMedicineId) {
        this.petMedicineId = petMedicineId;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public int getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}