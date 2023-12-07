<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-2">
	<h3>
		<a href="/lesson03/quiz02/list_layout.jsp" class="text-success text-decoration-none">Melong</a>
	</h3>
</div>
<form method="get" action="/lesson03/quiz02/info_layout.jsp" class="col-10">
	<div class="input-group">
		<input type="text" class="form-control col-6" name="search">
		<div class="input-group-append">
			<input type="submit" class="btn btn-info" value="검색">
		</div>
	</div>
</form>