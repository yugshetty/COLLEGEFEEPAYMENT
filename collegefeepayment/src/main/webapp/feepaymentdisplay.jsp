<%@ page import="java.util.*,model.FeePayment" %>

<!DOCTYPE html>
<html>
<head>
<title>All Payments</title>

<style>
body {
    font-family: Arial;
    background: #f4f4f4;
}

.container {
    width: 80%;
    margin: auto;
    margin-top: 40px;
}

h2 {
    text-align: center;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

th, td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

th {
    background: #333;
    color: white;
}

a {
    text-decoration: none;
    margin: 0 5px;
}

.edit {
    color: blue;
}

.delete {
    color: red;
}

.back {
    display: block;
    margin-top: 20px;
    text-align: center;
}
</style>

</head>
<body>

<div class="container">

<h2>All Payments</h2>

<table>
<tr>
    <th>Student ID</th>
    <th>Name</th>
    <th>Amount</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
List<FeePayment> list = (List<FeePayment>) request.getAttribute("list");

if(list != null && !list.isEmpty()){
    for(FeePayment f : list){
%>

<tr>
    <!-- ✅ SHOW STUDENT ID -->
    <td><%=f.getStudentId()%></td>

    <td><%=f.getStudentName()%></td>
    <td><%=f.getAmount()%></td>
    <td><%=f.getStatus()%></td>

    <td>
        <!-- Edit uses PaymentID internally -->
        <a class="edit" href="feepaymentupdate.jsp?id=<%=f.getPaymentId()%>">Edit</a> |
        
        <a class="delete" href="delete?id=<%=f.getPaymentId()%>">Delete</a>
    </td>
</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="5">No Data Found</td>
</tr>

<%
}
%>

</table>

<a class="back" href="index.jsp"> Back to Home</a>

</div>

</body>
</html>
