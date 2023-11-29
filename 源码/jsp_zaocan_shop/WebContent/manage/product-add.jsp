<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>后台管理 - 安心早餐店</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="../images/logo.gif" /></div>
	<div class="help"><a href="../indexSelect">返回前台页面</a></div>
	<div class="navbar">
		<ul class="clearfix">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="user">用户</a></li>
			<li class="current"><a href="productSelect">餐饮</a></li>
			<li><a href="ordersel">订单</a></li>
			<!--<li><a href="SelManage">留言</a></li>-->
			<!--<li><a href="newsselect">新闻</a></li>-->
		</ul>
	</div>
</div>
<div id="childNav">
	<div class="welcome wrap">
		管理员${name.EU_USER_ID}您好，欢迎回到管理后台。
	</div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">安心早餐店</a> &gt; 管理后台
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>用户管理</dt>
				<dd><em><a href="user-add.jsp">新增</a></em><a href="user">用户管理</a></dd>
				<dt>餐饮信息</dt>
				<dd><em><a href="productClassAdd">新增</a></em><a href="productClass">分类管理</a></dd>
				<dd><em><a href="productAdd">新增</a></em><a href="productSelect">餐饮管理</a></dd>
				<dt>订单管理</dt>
				<dd><a href="ordersel">订单管理</a></dd>
				<!--<dt>留言管理</dt>-->
				<!--<dd><a href="SelManage">留言管理</a></dd>-->
				<!--<dt>新闻管理</dt>-->
				<!--<dd><em><a href="news-add.jsp">新增</a></em><a href="newsselect">新闻管理</a></dd>-->
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>添加餐饮</h2>
		<div class="manage">
			<form action="doProductAdd" enctype="multipart/form-data">
				<table class="form">
					<tr>
						<td class="field">餐饮名称：</td>
						<td><input type="text" class="text" name="productName"  /></td>
					</tr>
					<tr>
						<td class="field">所属分类：</td>
						<td>
							<select name="parentId">
								<c:forEach var="f" items="${flist}">
									<option value="${f.EPC_ID }" disabled="disabled">${f.EPC_NAME }</option>
									<c:forEach var="c" items="${clist}">
										<c:if test="${f.EPC_ID==c.EPC_PARENT_ID}">
											<option value="${f.EPC_ID }-${c.EPC_ID }">&nbsp;&nbsp;${c.EPC_NAME }</option>
										</c:if>
									</c:forEach>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="field">餐饮图片：</td>
						<td><input type="file" class="text" name="photo" /></td>
					</tr>
					<tr>
						<td class="field">餐饮价格：</td>
						<td><input type="text" class="text tiny" name="productPrice" /> 元(整数)</td>
					</tr>
					<tr>
						<td class="field">描述：</td>
						<td><input type="text" class="text" name="productDesc" /></td>
					</tr>
					<tr>
						<td class="field">库存：</td>
						<td><input type="text" class="text tiny" name="productStock" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-blue"><input type="submit" name="submit" value="添加" /></label></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>

