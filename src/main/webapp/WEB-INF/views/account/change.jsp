<%@ page pageEncoding="utf-8"%>

<br/>
<div class="container">
	<div class="dang-nhap">
		<h2>ĐỔI MẬT KHẨU</h2>
		<h4  class="label label-success">${message}</h4>
		<form action="/account/change" method="post">
			<div class="row">
							<div class="col-sm-4">
								<p>Tên đăng nhập:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<input style="width: 90%;" name="id" class="form-control"  />
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Mật khẩu hiện tại:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<input name="pw" type="password" class="form-control" style="width: 90%;" required="required" pattern=".{6,}" title="Mật khẩu phải từ 6 ký tự trở lên"/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Mật khẩu mới:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<input name="pw1" type="password" class="form-control" style="width: 90%;" required="required" pattern=".{6,}" title="Mật khâu phải từ 6 ký tự trở lên"/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4">
								<p>Xác nhận mật khẩu mới:</p>
							</div>
							<div class="col-sm-8">
								<p>
									<input name="pw2" type="password" class="form-control" style="width: 90%;" required="required" pattern=".{6,}" title="Mật khẩu phải từ 6 ký tự trở lên"/>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-8">
								<button class="btn btn-success" style="width: 90%;">Cập nhật</button>
							</div>
						</div>
					</form>
	</div>
</div>
<br/>
<br/>

<style>
.dang-nhap{
	background-color: white;
	padding: 30px 120px;
	margin: 0 auto;
	width: 60%;
}
</style>