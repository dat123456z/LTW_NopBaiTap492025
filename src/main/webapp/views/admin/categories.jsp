<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách Category</title>
<style>
  :root{
    --bg:#0f172a;            /* slate-900 */
    --card:#111827;          /* gray-900 */
    --fg:#e5e7eb;            /* gray-200 */
    --muted:#9ca3af;         /* gray-400 */
    --border:#1f2937;        /* gray-800 */
    --accent:#7c3aed;        /* violet-600 */
    --accent-2:#06b6d4;      /* cyan-500 */
    --good:#22c55e;          /* green-500 */
    --bad:#ef4444;           /* red-500 */
  }

  *{box-sizing:border-box}
  body{
    margin:0; font-family:Inter,Segoe UI,Arial,sans-serif;
    background: radial-gradient(1000px 600px at 20% -10%, rgba(124,58,237,.25), transparent 60%),
                radial-gradient(900px 500px at 120% 0%, rgba(6,182,212,.18), transparent 50%),
                var(--bg);
    color:var(--fg);
  }

  .wrap{max-width:1050px; margin:40px auto; padding:0 20px;}
  .toolbar{
    display:flex; align-items:center; justify-content:space-between;
    margin-bottom:14px;
  }
  .title{
    font-size:28px; font-weight:800; letter-spacing:.2px;
    background:linear-gradient(90deg,var(--accent),var(--accent-2));
    -webkit-background-clip:text; background-clip:text; color:transparent;
  }

  .btn{
    display:inline-flex; align-items:center; gap:8px;
    padding:10px 14px; border-radius:12px; text-decoration:none;
    font-weight:700; border:1.5px solid var(--border); color:var(--fg);
    transition:transform .12s ease, border-color .12s ease, background .12s ease;
    background:linear-gradient(135deg, rgba(124,58,237,.18), rgba(6,182,212,.18));
  }
  .btn:hover{ transform:translateY(-1px); border-color:#334155; }

  .card{
    border:1px solid var(--border);
    background:linear-gradient(180deg, rgba(255,255,255,.02), rgba(255,255,255,.00));
    border-radius:16px;
    box-shadow:0 20px 50px rgba(0,0,0,.35);
    overflow:hidden;
  }

  table{
    width:100%; border-collapse:separate; border-spacing:0;
  }
  thead th{
    text-align:left; padding:14px 16px; font-size:13px; letter-spacing:.08em;
    text-transform:uppercase; color:var(--muted);
    background:linear-gradient(90deg, rgba(124,58,237,.2), rgba(6,182,212,.2));
    border-bottom:1px solid var(--border);
  }
  tbody td{
    padding:14px 16px; border-bottom:1px solid var(--border);
  }
  tbody tr{
    transition:background .15s ease, transform .08s ease;
  }
  tbody tr:hover{
    background:rgba(124,58,237,.08);
  }

  .pill{
    display:inline-flex; align-items:center; padding:6px 10px;
    border-radius:999px; font-size:13px; font-weight:700;
    text-decoration:none; border:1.5px solid currentColor;
    transition:background .12s ease, color .12s ease, transform .1s ease;
  }
  .pill.edit{ color:var(--good); }
  .pill.delete{ color:var(--bad); margin-left:8px; }
  .pill:hover{ background:currentColor; color:#0b1020; transform:translateY(-1px); }

  .empty{
    padding:28px; text-align:center; color:var(--muted);
  }
  .center{ text-align:center }
  .w-80{ width:80px }
  .w-180{ width:180px }
</style>
</head>
<body>
  <div class="wrap">
    <div class="toolbar">
      <div class="title">Danh sách Category</div>
      <a class="btn" href="${ctx}/admin/insert">+ Thêm Category</a>
    </div>

    <div class="card">
      <c:choose>
        <c:when test="${empty listcate}">
          <div class="empty">Chưa có danh mục nào.</div>
        </c:when>
        <c:otherwise>
          <table>
            <thead>
              <tr>
                <th class="w-80 center">STT</th>
                <th class="w-80 center">ID</th>
                <th>Tên Category</th>
                <th class="w-180 center">Hành động</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${listcate}" var="item" varStatus="stt">
                <tr>
                  <td class="center">${stt.index + 1}</td>
                  <td class="center">${item.id}</td>
                  <td>${item.categoryname}</td>
                  <td class="center">
                    <a class="pill edit" href="${ctx}/admin/edit?id=${item.id}">Sửa</a>
                    <a class="pill delete" href="${ctx}/admin/delete?id=${item.id}"
                       onclick="return confirm('Bạn có chắc muốn xóa không?');">Xóa</a>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</body>
</html>
