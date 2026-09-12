package com.smartpet.model;

public class PetBusiness {

    private int businessId;
    private String businessName;
    private String businessType;
    private String phone;
    private String email;
    private String address;
    private String description;

    public PetBusiness() {
    }

    public PetBusiness(String businessName, String businessType,
                       String phone, String email,
                       String address, String description) {

        this.businessName = businessName;
        this.businessType = businessType;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.description = description;
    }

    public int getBusinessId() {
        return businessId;
    }

    public void setBusinessId(int businessId) {
        this.businessId = businessId;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}