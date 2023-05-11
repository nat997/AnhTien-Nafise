<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 	CSS (w3css) de la Page -->
    <link rel="stylesheet" href="<c:url value="css/w3.css" />"/>

    <title>Countries JSP</title>

</head>

<body onload="init();">

<%--<jsp:include page="header.jsp"></jsp:include>--%>

<div class="w3-container">
    <h2 style="text-align: center">Sakila - countries</h2>
    <br>
    <a class="w3-button" href="<c:url value="/" />">Retour</a>

    <div class="w3-container w3-center">
        <a class="w3-button" href="<c:url value="countryModify" />">Nouveau</a>
        <table id="countriesTable" class="w3-centered w3-table-all">
            <thead>
            <tr class="w3-light-grey">
                <th>Id</th>
                <th>Country</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${countries}" var="elem">
                <tr>
                    <th scope="row">${elem.id}</th>
                    <td>${elem.country}</td>
                </tr>
            </c:forEach>
            </tbody>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d83998.77824579946!2d2.2646349671528023!3d48.858938434575734!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis!5e0!3m2!1sen!2sfr!4v1683797792224!5m2!1sen!2sfr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </table>
    </div>
</div>
</body>

<!-- JavaScript resources dataTables + jQuery -->

</html>
