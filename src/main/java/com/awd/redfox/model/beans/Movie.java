package com.awd.redfox.model.beans;

import java.io.Serializable;
import java.time.LocalDate;

public class Movie  implements Serializable {
    private int mID;
    private String title;
    private String director;
    private String genre;
    private LocalDate dateReleased;
    private String synopsis;
    private String image;
    private String actors;

    private int rating;

    private double price;

    public Movie() {
    }


    public Movie(int mID, String title, String director, String actors, String genre, LocalDate dateReleased,
                 int rating, String image,String synopsis, double price) {
        this.mID = mID;
        this.title = title;
        this.director = director;
        this.genre = genre;
        this.dateReleased = dateReleased;
        this.synopsis = synopsis;
        this.image = image;
        this.actors = actors;
        this.rating = rating;
        this.price = price;

    }

    public int getmID() {
        return mID;
    }

    public void setmID(int mID) {
        this.mID = mID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public LocalDate getDateReleased() {
        return dateReleased;
    }

    public void setDateReleased(LocalDate dateReleased) {
        this.dateReleased = dateReleased;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
