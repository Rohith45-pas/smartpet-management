package com.smartpet.model;

public class VeterinaryService {

    private int serviceId;
    private String serviceName;
    private String veterinarianName;
    private String clinicName;
    private String phone;
    private String address;
    private String specialization;

    public VeterinaryService() {
    }

    public VeterinaryService(String serviceName,
                             String veterinarianName,
                             String clinicName,
                             String phone,
                             String address,
                             String specialization) {

        this.serviceName = serviceName;
        this.veterinarianName = veterinarianName;
        this.clinicName = clinicName;
        this.phone = phone;
        this.address = address;
        this.specialization = specialization;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getVeterinarianName() {
        return veterinarianName;
    }

    public void setVeterinarianName(String veterinarianName) {
        this.veterinarianName = veterinarianName;
    }

    public String getClinicName() {
        return clinicName;
    }

    public void setClinicName(String clinicName) {
        this.clinicName = clinicName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }
}