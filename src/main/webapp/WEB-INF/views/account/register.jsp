<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<br/>
<div class="container">
	<div class=dang-nhap>
		<h2>ĐĂNG KÝ</h2>
		<h4 class="label label-success">${message}</h4>
		<form:form action="/account/register" modelAttribute="form"
			enctype="multipart/form-data">
			<div class="form-group">
				<label>Tên đăng nhập:</label>
				<form:input path="id" class="form-control" />
			</div>
			<div class="form-group">
				<label>Mật khẩu:</label>
				<form:input path="password" type="password" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Họ tên:</label>
				<form:input path="fullname" class="form-control" />
			</div>
			<div class="form-group">
				<label>Số điện thoại:</label>
				<form:input path="telephone" type="number" class="form-control"/>
			</div>
			<div class="form-group">
				<label>Email:</label>
				<form:input path="email" class="form-control" />
			</div>
			<div class="form-group">
				<label>Ảnh:</label> <input type="file" name="photo_file" />
				<form:hidden path="photo" class="form-control" />
			</div>
			<button class="btn btn-success" >Đăng ký</button>
			<%-- <a class="btn btn-default" href="/account/register"><s:message code="act.button.reset" /></a> --%>
		</form:form>
	</div>
</div>
<br/>
<br/>

<style>
.dang-nhap{0
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>




