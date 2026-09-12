package com.smartpet.model;

public class Pet {

    private int petId;
    private String petName;
    private String species;
    private String breed;
    private int age;
    private double weight;

    public Pet() {
    }

    public Pet(String petName, String species, String breed, int age, double weight) {
        this.petName = petName;
        this.species = species;
        this.breed = breed;
        this.age = age;
        this.weight = weight;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public String getPetName() {
        return petName;
    }

    public void setPetName(String petName) {
        this.petName = petName;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }

    public String getBreed() {
        return breed;
    }

    public void setBreed(String breed) {
        this.breed = breed;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }
}
