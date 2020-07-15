<%@ page isErrorPage="true" %>

<h1>Pagina de Error</h1>

<p>Acordarse de la directiva para indicar <code>&lt;%@ page isErrorPage="true" %&gt;</code> </p>
<p>En todas las JSPs que queramos gestionar los errores, hay que indicar cual es su pagina de error 
   <code> &lt;%@ page errorPage="error.jsp" %&gt;   </code>

<p>Motivo del error: </p>
<b>
 <%
 	// tenemos una variable con la Exception
 	if ( exception != null ){
 		out.print( exception.getMessage() );
 	}	
 	
 %>
 </b> 
 
 <hr>
 
 <p>Los fallos del tipo 404, se gestionan desde el <b>web.xml</b></p>
 <p>Puesto que estos fallos no se pueden capturar en la Vista, ni en ningun controlador </p>
 <pre><code>
 
 	<error-page>
		<error-code>404</error-code>
		<location>/error404.jsp</location>
	</error-page>
	
 </code></pre>