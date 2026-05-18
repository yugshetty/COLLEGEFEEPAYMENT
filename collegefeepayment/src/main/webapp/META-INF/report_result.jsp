<%@ page import="java.util.*,model.FeePayment" %>

<!DOCTYPE html>
<html>
<head>
<title>Report Result</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
    margin: 0;
}

.container {
    width: 80%;
    margin: 40px auto;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: center;
}

th {
    background: #007bff;
    color: white;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

.total {
    text-align: center;
    font-size: 28px;
    color: green;
    margin: 20px 0;
}

.msg {
    text-align: center;
    color: red;
    font-size: 18px;
}

.back {
    display: block;
    text-align: center;
    margin-top: 20px;
}
</style>

</head>
<body>

<div class="container">

<%
String type = (String) request.getAttribute("type");
%>

<!-- ================= TOTAL COLLECTION ================= -->
<% if ("total".equals(type)) { %>

    <h2>Total Collection Report</h2>

    <div class="total">
        ₹ <%= request.getAttribute("total") %>
    </div>

<!-- ================= SEARCH BY STUDENT ID ================= -->
<% } else if ("byid".equals(type)) {

    FeePayment f = (FeePayment) request.getAttribute("single");

    if (f != null) {
%>

    <h2>Student Details</h2>

    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Payment Date</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>

        <tr>
            <td><%=f.getStudentId()%></td>
            <td><%=f.getStudentName()%></td>
            <td><%=f.getPaymentDate()%></td>
            <td><%=f.getAmount()%></td>
            <td><%=f.getStatus()%></td>
        </tr>
    </table>

<% } else { %>

    <div class="msg">No student found with given ID</div>

<% } %>

<!-- ================= LIST (PAID / PENDING / OVERDUE / NOTPAID) ================= -->
<% } else {

    List<FeePayment> list = (List<FeePayment>) request.getAttribute("list");

    String title = "Report";

    if ("paid".equals(type)) {
        title = "Paid Students";
    } else if ("pending".equals(type)) {
        title = "Pending Students";
    } else if ("overdue".equals(type)) {
        title = "Overdue Students";
    } else if ("notpaid".equals(type)) {
        title = "Not Paid in Selected Period";
    }
%>

    <h2><%= title %></h2>

    <% if ("notpaid".equals(type)) { %>
        <div style="text-align:center; margin-bottom:15px;">
            From: <%= request.getAttribute("fromDate") %> |
            To: <%= request.getAttribute("toDate") %>
        </div>
    <% } %>

    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Amount</th>
            <th>Status</th>
        </tr>

<%
    if (list != null && !list.isEmpty()) {
        for (FeePayment f : list) {
%>

        <tr>
            <td><%=f.getStudentId()%></td>
            <td><%=f.getStudentName()%></td>
            <td><%=f.getAmount()%></td>
            <td><%=f.getStatus()%></td>
        </tr>

<%
        }
    } else {
%>

        <tr>
            <td colspan="4">No Data Found</td>
        </tr>

<%
    }
%>

    </table>

<% } %>

<a class="back" href="index.jsp"> Back to Home</a>

</div>

</body>
</html>
