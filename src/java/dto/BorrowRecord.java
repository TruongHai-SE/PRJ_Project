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
public class BorrowRecord {
    private String prefixedId;
    private int id;
    private int userId;
    private int bookId;
    private String bookTitle;
    private Date borrowDate;
    private Date dueDate;
    private Date returnDate;
    private String status;
    private String requestType;

    public BorrowRecord() {
    }
    
    //constructor cho BorrowRecord
    public BorrowRecord(int id, int userId, int bookId, String bookTitle, Date borrowDate, Date dueDate, Date returnDate, String status) {
        this.prefixedId = "RC-" + id;
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.bookTitle = bookTitle;
        this.borrowDate = borrowDate;
        this.dueDate = dueDate;
        this.returnDate = returnDate;
        this.status = status;
        this.requestType = null;
    }
    
    //constructor cho BookRequest
    public BorrowRecord(int id, int userId, int bookId, String bookTitle, Date borrowDate, Date dueDate, Date returnDate, String status, String requestType) {
        this(id, userId, bookId, bookTitle, borrowDate, dueDate, returnDate, status);
        this.prefixedId = "RQ-" + id;
        this.requestType = requestType;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getPrefixedId() {
        return prefixedId;
    }

    public int getBookId() {
        return bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public String getRequestType() {
        return requestType;
    }

    public String getStatus() {
        return status;
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

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    public void setPrefixedId(String prefixedId) {
        this.prefixedId = prefixedId;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

    
}