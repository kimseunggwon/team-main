<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"	 uri="http://www.springframework.org/security/tags" %>

<style>

.container-1 input.search{
  width: 420px;
  height: 78px;
  background: rgb(242, 242, 242);
  border: none;
  font-size: 12pt;
  float: left;
  color: rgb(0, 0, 0);
  padding-left: 45px;
  -webkit-border-radius: 40px;
  -moz-border-radius: 40px;
  border-radius: 40px;
  outline-style: none;
}

#select-list {
}
</style>

<!-- Search Start -->
	<div class="container-1 row justify-content-center">
		<form class="d-flex align-items-center"action="${appRoot }/review/list" method="get">
			<div id="select-list" class="item">
				<select name="type" class="form-inline my-2 my-lg-0">
					<option value="">Select</option>
					<option value="T" ${recri.type	== "T" ? 'selected' : '' }>제목</option>
					<option value="C" ${recri.type	== "C" ? 'selected' : '' }>내용</option>
					<option value="W" ${recri.type	== "W" ? 'selected' : '' }>글쓴이</option>
					<option value="TC" ${recri.type	== "TC" ? 'selected' : '' }>제목
						+ 내용</option>
					<option value="TW" ${recri.type	== "TW" ? 'selected' : '' }>제목
						+ 글쓴이</option>
					<option value="TWC" ${recri.type	== "TWC" ? 'selected' : '' }>제목
						+ 글쓴이 + 내용</option>
				</select>
			</div>
			<div class="item">
				<span
					style="position:absolute; margin-top: 27px; margin-left: 18px"
					class="icon"></span> <input name="keyword"
					value="${recri.keyword }" class="search" type="search"
					id="jinah-search1" placeholder="Search" />
			</div>

			<div class="item">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</div>

			<input type="hidden" name="pageNum" value="1"> <input
				type="hidden" name="amount" value="${recri.amount }">
		</form>
	</div>
	<!-- Search End -->