<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<jsp:include page="menu.jsp"/>


<!-- Page Content -->
<div class="container">

    <!-- Marketing Icons Section -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header titoloevento">
                Visite
            </h1>
        </div>
    </div>
    <!-- /.row -->
    <!-- Features Section -->
        <c:forEach items="${visite}" var="visita">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4><i class="fa fa-bars"></i> ${visita.getTitolo()}</h4>
                </div>
                <div class="panel-heading">
                    <h4><i class="fa fa-usd"></i> ${visita.getTariffa()}</h4>
                </div>
                <div class="panel-body">
                    <p>${visita.getDescrizione()}</p>
                    <a href="#" class="btn btn-success" style="margin-top: 7%;width: 100%;">Acquista</a>
                </div>
            </div>
        </div>
        </c:forEach>
</div>

<jsp:include page="contatti.jsp"/>
<jsp:include page="footer.jsp"/>
