package com.smartpet.model;

public class Medicine {

    private int medicineId;
    private String medicineName;
    private String medicineType;
    private String purpose;
    private String dosageInfo;
    private String precautions;

    public Medicine() {
    }

    public Medicine(String medicineName,
                    String medicineType,
                    String purpose,
                    String dosageInfo,
                    String precautions) {

        this.medicineName = medicineName;
        this.medicineType = medicineType;
        this.purpose = purpose;
        this.dosageInfo = dosageInfo;
        this.precautions = precautions;
    }

    public int getMedicineId() {
        return medicineId;
    }

    public void setMedicineId(int medicineId) {
        this.medicineId = medicineId;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getMedicineType() {
        return medicineType;
    }

    public void setMedicineType(String medicineType) {
        this.medicineType = medicineType;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getDosageInfo() {
        return dosageInfo;
    }

    public void setDosageInfo(String dosageInfo) {
        this.dosageInfo = dosageInfo;
    }

    public String getPrecautions() {
        return precautions;
    }

    public void setPrecautions(String precautions) {
        this.precautions = precautions;
    }
}