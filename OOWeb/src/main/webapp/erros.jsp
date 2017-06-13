<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${mensagens != null && !mensagens.isEmpty()}">
	<div id="erro">
		<ul>
			<c:forEach var="erro" items="${mensagens}">
				<li> ${erro} </li>
			</c:forEach>
		</ul>
	</div>
</c:if>