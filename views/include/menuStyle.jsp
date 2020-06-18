<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  .dropbtn {
    background-color: #343a40;
    color: #fff;
    padding: 0px 8px;
    font-size: 16px;
    border: none;
    cursor: pointer;
  }
  
  .dropdown {
    position: relative;
    /* display: inline-block; */
  }
  
  .dropdown a:hover {
    background-color: #555;
    color: #fff;
    font-weight: bold;
  }
  
  .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 120px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.5);
    z-index: 1;
    font-size: 10pt;
  }
  
  .dropdown-content a {
    color: black;
    padding: 10px 14px;
    text-decoration: none;
    display: block;
  }
  
  .dropdown-content a:hover {
    background-color: #ddd;
    color: #000;
    
  }
  
  .dropdown:hover .dropdown-content {
    display: block;
  }
  
</style>