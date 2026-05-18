<!DOCTYPE html>
<html>
<head>
<title>Reports</title>

<style>
body { font-family: Arial; background: #f4f6f9; }

.container {
    width: 420px;
    margin: auto;
    margin-top: 60px;
    background: white;
    padding: 25px;
    border-radius: 10px;
}

h2 { text-align: center; }

input, select, button {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}

/* Buttons */
.btn-blue { background: #007bff; color: white; border: none; }
.btn-green { background: green; color: white; border: none; }

.section {
    margin-top: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
}
</style>
</head>

<body>

<div class="container">

<h2>Reports</h2>

<!-- 🔹 SECTION 1: SEARCH BY STUDENT ID -->
<div class="section">
<h3>Search by Student ID</h3>

<form action="report" method="post">
    <input type="hidden" name="type" value="byid">

    Enter Student ID:
    <input type="number" name="studentId" required>

    <button class="btn-blue">Search</button>
</form>
</div>

<!-- 🔹 SECTION 2: FILTER -->
<div class="section">
<h3>Filter Students</h3>

<form action="report" method="post">

<select name="type">
    <option value="paid">Paid Students</option>
    <option value="pending">Pending Students</option>
</select>

<button class="btn-green">Generate</button>

</form>
</div>

</div>
</body>
</html>
