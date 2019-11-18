<%-- 
    Document   : Premio
    Created on : 16-09-2019, 21:51:08
    Author     : wbolivarc
--%>

<%@page import="Modelo.Sorteo"%>
<%@page import="Dao.DAOSorteo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <%
            DAOSorteo dao = new DAOSorteo();

            String valor = request.getParameter("premio");
            int contador = dao.ContadorAgua(Integer.parseInt(valor));
            int ganador = dao.ContadorGanador(Integer.parseInt(valor));
            Sorteo s = dao.ObtenerGanador(Integer.parseInt(valor));
            String premio = dao.ObtienePremio(Integer.parseInt(valor));
            pageContext.setAttribute("agua", dao.ObtenerAguas(Integer.parseInt(valor)));

        %>
        
          <%
            if (session.getAttribute("sinRegistro") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("sinRegistro")%>");
        </script>
        <%
                session.removeAttribute("sinRegistro");
            }
        %>        

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/bootstrap-theme.css">
        <link rel="stylesheet" href="css/sidebar.css">
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color: #3ACA29">
                <center>
                    <table style="width: 100%">
                        <tr>
                            <td></td>
                            <td nowrap style="text-align: left">
                                <h1>PREMIO: <%=premio%></h1>
                            </td>
                            <td style="text-align: right">
                                <button class="btn btn-success" onclick="start_Int()">Iniciar</button>    
                                <button class="btn btn-danger" onclick="stop_Int()">Detener</button>
                            </td>
                        </tr>
                    </table>
            </div>
            <br>
            <br>
            <br>
            <br>
            <table border="0" style="width: 100%">           
                <tr>
                    <td style="width: 40%">
                        <table class="table table-hover" border="0" style="width: 90%">
                            <%if (contador > 0) {%>
                            <h1>Cantidad de numeros al agua: <%=contador%></h1>
                            <%}%>
                            <tr style="text-align: center; background-color:#a9dba9 ">
                                <td>Nombre:</td>
                                <td>Telefono:</td>
                                <td>Numero:</td>
                                <td>Cartulina:</td>
                            </tr>                            
                            <c:forEach var= "u" items="${agua}" >
                                <tr style="text-align: center">                                   
                                    <td>${u.getNombre()}</td>
                                    <td>${u.getTelefono()}</td>                                    
                                    <td>${u.getNumero()}</td>                                    
                                    <td>${u.getId_rifa()}</td>
                                </tr>
                            </c:forEach> 
                        </table>
                    </td>
                    <td>
                        <input type="text" disabled="" style="WIDTH: 565px; HEIGHT: 398px;font-size: 252px" id="numero" placeholder="1200">         
                    </td>
                    <td style="width: 30%">
                        <%if (ganador == 1) {%>
                <center><h1>GANADOR!</h1></center>
                <table class="table table-hover" border="0" style="width: 90%">
                    <thead style="background-color: #a9dba9">
                        <tr style="text-align: center">
                            <td>Nombre: </td>
                            <td>Telefono: </td>
                            <td>Numero Ganador: </td>
                            <td>Cartulina nro: </td>
                        </tr>
                    </thead>
                    <tr style="text-align: center">
                        <td nowrap><%=s.getNombre()%></td>
                        <td nowrap><%=s.getTelefono()%></td>
                        <td nowrap><%=s.getNumero()%></td>
                        <td nowrap><%=s.getId_rifa()%></td>
                    </tr>
                </table>
                <%}%>
                </td>

                </tr>
            </table>
        </center>
        <br>
        <center>
            <form name="formulario" action="ServletSorteo" method="POST">
                <input type="text" hidden="" name="numeroSorteo" id="numeroSorteo">
                <input type="text" hidden="" name="estado" id="estado">
                <input type="text" hidden="" name="premio" id="premio" value="<%=valor%>">
                <button class="btn btn-default" disabled="" id="btn_ganador" onclick="alerta(1)">Ganador</button>
                <button class="btn btn-default" disabled="" id="btn_agua" onclick="alerta(2)">Al Agua</button>
            </form>
            <br>
            <br>
            <br>
        </center>
    </div>
    <input hidden="" id="cont_agua" value="<%=contador%>">
</body>

<script>
    function getRandomInt() {
        var valor = Math.floor(Math.random() * (1201 - 1)) + 1;
        document.getElementById("numero").value = valor;
    }

    var intval = '';

    function start_Int() {
        intval = window.setInterval('getRandomInt()', 100);
    }

    function stop_Int() {
        if (intval != '') {
            window.clearInterval(intval);
            intval = '';
        }

        intval = window.setInterval('getRandomInt()', 500);
        var tiempo = Math.floor(Math.random() * (16 - 5)) + 5;
        tiempo = tiempo * 1000;
        $('<queue/>')
                .delay(tiempo /*ms*/)
                .queue((next) => {
                    if (intval != '') {
                        window.clearInterval(intval);
                        intval = '';
                    }
                    next();
                });

        var r = document.getElementById("numero").value;
        var c = document.getElementById("cont_agua").value;
        if (r = !null && c < 1) {
            document.getElementById("btn_agua").disabled = false;
        }

        if (c == 1) {
            document.getElementById("btn_ganador").disabled = false;
        }

    }


    function alerta(estado) {
        var r = document.getElementById("numero").value;
        document.getElementById("numeroSorteo").value = r;
        if (estado === 1) {
            window.alert("GANADOR!! " + r);
        }
        if (estado === 2) {
            window.alert("AL AGUAAAAA! " + r);
        }
        document.getElementById("estado").value = estado;
        document.getElementsByName("formulario").submit;
    }
</script>


</html>
