package com.lotoshare.entity;

import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;

import javax.persistence.*;
import javax.servlet.http.Cookie;
import java.sql.Date;

@Entity
@Table(name = "post")
public class Post {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    //TODO -> Посмотреть на @Valid и @NoNull в Entity
    @Column(name = "category")
    private String category;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "text")
    private String text;

    @Column(name = "telephone")
    private String telephone;

    @Column(name = "status")
    private String status;

    @Column(name = "city")
    private String city;

    @Column(name = "email")
    private String email;

    @Generated(GenerationTime.ALWAYS)
    @Column(name = "date")
    private Date date;

    @Column(name = "author")
    private String author;

    @Lob
    @Column(name = "cook")
    private String cook;

    @Lob
//    @Generated(GenerationTime.ALWAYS)
    @Column(name = "url1")
    private String URL1;

    @Lob
//    @Generated(GenerationTime.ALWAYS)
    @Column(name = "url2")
    private String URL2;

    @Lob
//    @Generated(GenerationTime.ALWAYS)
    @Column(name = "url3")
    private String URL3;

    @Lob
//    @Generated(GenerationTime.ALWAYS)
    @Column(name = "url4")
    private String URL4;

    @Lob
//    @Generated(GenerationTime.ALWAYS)
    @Column(name = "url5")
    private String URL5;

    @Column(name = "type")
    private String type;

    @Column(name = "showpost")
    private String showPost;

    @Column(name = "postmassage")
    private String postMassage;

    public Post() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getURL1() {
        return URL1;
    }

    public void setURL1(String URL1) {
        this.URL1 = URL1;
    }

    public String getURL2() {
        return URL2;
    }

    public void setURL2(String URL2) {
        this.URL2 = URL2;
    }

    public String getURL3() {
        return URL3;
    }

    public void setURL3(String URL3) {
        this.URL3 = URL3;
    }

    public String getURL4() {
        return URL4;
    }

    public void setURL4(String URL4) {
        this.URL4 = URL4;
    }

    public String getURL5() {
        return URL5;
    }

    public void setURL5(String URL5) {
        this.URL5 = URL5;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCook() {
        return cook;
    }

    public void setCook(String cook) {
        this.cook = cook;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getShowPost() {
        return showPost;
    }

    public void setShowPost(String showPost) {
        this.showPost = showPost;
    }

    public String getPostMassage() {
        return postMassage;
    }

    public void setPostMassage(String postMassage) {
        this.postMassage = postMassage;
    }
}
