/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mayu.model;

/**
 *
 * @author MayuKogi
 */
public class Book {

    String bookId, bookTitle, author, mainClassification, subClassification, yearOfPublishing, lastPrintedYear, isbnNo, noOfPages;

    public String getBookId() {
        return bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public String getAuthor() {
        return author;
    }

    public String getMainClassification() {
        return mainClassification;
    }

    public String getSubClassification() {
        return subClassification;
    }

    public String getYearOfPublishing() {
        return yearOfPublishing;
    }

    public String getLastPrintedYear() {
        return lastPrintedYear;
    }

    public String getISBNNo() {
        return isbnNo;
    }

    public String getNoOfPages() {
        return noOfPages;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setMainClassification(String main_classification) {
        this.mainClassification = main_classification;
    }

    public void setSubClassification(String sub_classification) {
        this.subClassification = sub_classification;
    }

    public void setYearOfPublishing(String yop) {
        this.yearOfPublishing = yop;
    }

    public void setLastPrintedYear(String lpy) {
        this.lastPrintedYear = lpy;
    }

    public void setISBNNo(String isbn) {
        this.isbnNo = isbn;
    }

    public void setNoOfPages(String nop) {
        this.noOfPages = nop;
    }

}
