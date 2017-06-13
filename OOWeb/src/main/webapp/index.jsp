<%@page import="java.util.*,
		br.com.munif.ooweb.Lugar"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		
<!DOCTYPE html>
<html>
    <head>
        <title>Pos 2017</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    	<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    	<script src="js/jquery.min.js"></script>
    
	    <script type="application/x-javascript">
	    	${jogador != null ? 'setTimeout(function () { window.location.reload();}, 5000); ' : ''}
	    </script>
    </head>
	<body class="container">
		<header>
			<h1>Pos 2017</h1>
		</header>
		<br />
		<c:import url="erros.jsp"></c:import>
		<c:if test="${jogador == null}">
			<c:import url="solicitanome.jsp"></c:import>
		</c:if>
		<c:if test="${jogador != null}">
			<c:import url="mapa.jsp"></c:import>
		</c:if>
	
	</body>
</html>
