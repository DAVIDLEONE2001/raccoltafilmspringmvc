<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="it" class="h-100" >
	 <head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 	<!-- Common imports in pages -->
	 	<jsp:include page="../header.jsp" />
	 	
	   <title>Visualizza Elemento</title>
	   
	 </head>
	   <body class="d-flex flex-column h-100">
	   
	   		<!-- Fixed navbar -->
	   		<jsp:include page="../navbar.jsp"></jsp:include>
	    
			
			<!-- Begin page content -->
			<main class="flex-shrink-0">
			  <div class="container">
			  
			  		<div class='card'>
					    <div class='card-header'>
					        <h5>Visualizza dettaglio</h5>
					    </div>
					    
					
					    <div class='card-body'>
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Id:</dt>
							  <dd class="col-sm-9">${show_regista_attr.id}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Nome:</dt>
							  <dd class="col-sm-9">${show_regista_attr.nome}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Cognome:</dt>
							  <dd class="col-sm-9">${show_regista_attr.cognome}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">NickName:</dt>
							  <dd class="col-sm-9">${show_regista_attr.nickName}</dd>
					    	</dl>
					    	
					    	<dl class="row">
							  <dt class="col-sm-3 text-right">Data Di Nascita:</dt>
							  <dd class="col-sm-9">
							  	<fmt:parseDate value="${show_regista_attr.dataDiNascita}" pattern="yyyy-MM-dd" var="localDateToBeParsed" type="date"/>
								<fmt:formatDate pattern="dd/MM/yyyy" value="${localDateToBeParsed}" />
							  </dd>
					    	</dl>
					    	
					    	
					    	<!-- info Regista -->
					    	<c:if test="${not empty(list_film_regista_attr)}">
					    	<p>
							  <a class="btn btn-primary btn-sm" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
							    Info Film
							  </a>
							  
							</p>
							</c:if>
							<c:forEach var = "filmItem" items="${list_film_regista_attr}">
							<div class="collapse" id="collapseExample">
							  <div class="card card-body">
							  	<dl class="row">
								  <dt class="col-sm-3 text-right">Id:</dt>
								  <dd class="col-sm-9">${filmItem.id}</dd>
							   	</dl>
							  	<dl class="row">
								  <dt class="col-sm-3 text-right">Titolo:</dt>
								  <dd class="col-sm-9">${filmItem.titolo}</dd>
							   	</dl>
							   	<dl class="row">
								  <dt class="col-sm-3 text-right">Genere:</dt>
								  <dd class="col-sm-9">${filmItem.genere}</dd>
							   	</dl>
							   	<dl class="row">
								  <dt class="col-sm-3 text-right">Data Publicazzione:</dt>
								  <dd class="col-sm-9">${filmItem.dataPubblicazione}</dd>
							   	</dl>
							   	<dl class="row">
								  <dt class="col-sm-3 text-right">Durata In Minuti:</dt>
								  <dd class="col-sm-9">${filmItem.minutiDurata}</dd>
							   	</dl>
							    
							  </div>
							<!-- end info Regista -->
							</div>
					    	 </c:forEach>
					    <!-- end card body -->
					    </div>
					   
					    <div class='card-footer'>
					        <a href="${pageContext.request.contextPath}/regista" class='btn btn-outline-secondary' style='width:80px'>
					            <i class='fa fa-chevron-left'></i> Back
					        </a>
					    </div>
					<!-- end card -->
					</div>	
			  
			    
			  <!-- end container -->  
			  </div>
			  
			</main>
			
			<!-- Footer -->
			<jsp:include page="../footer.jsp" />
	  </body>
</html>