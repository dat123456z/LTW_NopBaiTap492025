<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Category</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f0f0;
        margin: 0;
        padding: 0;
    }
    .form-container {
        width: 350px;
        margin: 60px auto;
        padding: 20px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    h2 {
        text-align: center;
        font-size: 20px;
        margin-bottom: 15px;
        color: #333;
    }
    label {
        font-size: 14px;
        color: #333;
        display: block;
        margin-bottom: 5px;
    }
    input[type="text"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #bbb;
        border-radius: 3px;
        margin-bottom: 12px;
        font-size: 14px;
    }
    button {
        width: 100%;
        padding: 8px;
        background: #2196F3;
        color: white;
        border: none;
        border-radius: 3px;
        font-size: 14px;
        cursor: pointer;
    }
    button:hover {
        background: #1976D2;
    }
    .back-link {
        display: block;
        margin-top: 12px;
        text-align: center;
        font-size: 13px;
        text-decoration: none;
        color: #555;
    }
    .back-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm Category</h2>
        <form action="${pageContext.request.contextPath}/admin/insert" method="post">
            <label for="categoryname">Tên Category:</label>
            <input type="text" id="categoryname" name="categoryname" required>
            <button type="submit">Thêm</button>
        </form>
        <a href="${pageContext.request.contextPath}/admin/categories" class="back-link">← Quay lại danh sách</a>
    </div>
</body>
</html>
