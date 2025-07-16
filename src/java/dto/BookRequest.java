/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class BookRequest {
    private int id;
    private int userId;
    private int bookId;
    private Date requestDate;    
    private String status;
    private String requestType;

    public BookRequest() {
    }

    public BookRequest(int id, int userId, int bookId, Date requestDate, String status, String requestType) {
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.requestDate = requestDate;
        this.status = status;
        this.requestType = requestType;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public int getBookId() {
        return bookId;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public String getStatus() {
        return status;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }
    
    
}
