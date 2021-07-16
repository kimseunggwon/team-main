<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${listUrl }"><i class="fas fa-list"></i> </a>
      </li>
      <sec:authorize access="isAuthenticated()">
      <li class="nav-item">
        <a class="nav-link" href="${registerUrl }"><i class="fas fa-pen"></i> </a>
      </li>
      </sec:authorize>
      </ul>
      </div>