<%-- 
    Document   : Sorteo
    Created on : 13-09-2019, 10:03:40
    Author     : wbolivarc
--%>

<%@page import="Dao.DAOSorteo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="js/bootstrap.min.js"></script>

        <%
            Dao.DAOSorteo dao = new DAOSorteo();

            pageContext.setAttribute("premios", dao.ObtienePremios());

        %>


        <script>
            function getRandomInt() {
                document.getElementById("agua1").value = Math.floor(Math.random() * (1201 - 0)) + 0;
            }
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hola</title>
    </head>
    <!-- onLoad="setInterval('getRandomInt()', 100);" -->
    <body>
        <div class="panel-heading" style="">
            <center><h1>GRAN RIFA CARLOS MANCILLA</h1></center>
            <center><h1>PREMIOS</h1></center>    
        </div>
        <div class="table-responsive" style="display: table; justify-content: center; align-items: center">
            <table class="table table-hover" style="width: 100%" border="0">
                <tr>
                    <td><button onclick="redireccionar(1)" class="btn btn-default">Gift Card $ 50.000</button></td>
                    <td><button onclick="redireccionar(2)" class="btn btn-default">Cafetera Nescafé Dolce Gusto Jovia</button></td>
                    <td><button onclick="redireccionar(3)" class="btn btn-default">Gift Card $ 20.000 </button></td>
                    <td><button onclick="redireccionar(4)" class="btn btn-default">Pipeño + Granadina </button></td>
                    <td><button onclick="redireccionar(5)" class="btn btn-default">Vino 2 Litros Santa Rita + Juego de copas </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(6)" class="btn btn-default">Mango Sour + Champaña </button></td>
                    <td><button onclick="redireccionar(7)" class="btn btn-default">Licor de manzanilla + Licor de Menta </button></td>
                    <td><button onclick="redireccionar(8)" class="btn btn-default">Cusqueño + Chirimolla Colada </button></td>
                    <td><button onclick="redireccionar(9)" class="btn btn-default">Cusqueño + Mango Sour </button></td>
                    <td><button onclick="redireccionar(10)" class="btn btn-default">Cerveza Gran Torobayo </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(11)" class="btn btn-default">Tequila + Pisco Sour </button></td>
                    <td><button onclick="redireccionar(12)" class="btn btn-default">Tequila + Pisco Sour </button></td>
                    <td><button onclick="redireccionar(13)" class="btn btn-default">Vino blanco + Pisco </button></td>
                    <td><button onclick="redireccionar(14)" class="btn btn-default">Ron + Pisco </button></td>
                    <td><button onclick="redireccionar(15)" class="btn btn-default">Whisky </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(16)" class="btn btn-default">Vino tinto + GIN </button></td>
                    <td><button onclick="redireccionar(17)" class="btn btn-default">Vino tinto + Vodka </button></td>
                    <td><button onclick="redireccionar(18)" class="btn btn-default">Chicha + Vino Blanco </button></td>
                    <td><button onclick="redireccionar(19)" class="btn btn-default">Pisco Alto del Carmen </button></td>
                    <td><button onclick="redireccionar(20)" class="btn btn-default">10 Cervezas + Doritos </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(21)" class="btn btn-default">10 Cervezas + Ramitas </button></td>
                    <td><button onclick="redireccionar(22)" class="btn btn-default">10 Cervezas + Bebida </button></td>
                    <td><button onclick="redireccionar(23)" class="btn btn-default">10 Cervezas + Bebida </button></td>
                    <td><button onclick="redireccionar(24)" class="btn btn-default">10 Cervezas + Bebida </button></td>
                    <td><button onclick="redireccionar(25)" class="btn btn-default">10 Cervezas + 2 Jugos </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(26)" class="btn btn-default">Set parrillero </button></td>
                    <td><button onclick="redireccionar(27)" class="btn btn-default">Secador de Pelo </button></td>
                    <td><button onclick="redireccionar(28)" class="btn btn-default">1 Parlante Bluetooth </button></td>
                    <td><button onclick="redireccionar(29)" class="btn btn-default">1 Mantas para picnic </button></td>
                    <td><button onclick="redireccionar(30)" class="btn btn-default">1 Mantas para picnic </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(31)" class="btn btn-default">1 Mantas para picnic </button></td>
                    <td><button onclick="redireccionar(32)" class="btn btn-default">1 Mantas para picnic </button></td>
                    <td><button onclick="redireccionar(33)" class="btn btn-default">1 Chocolates LA FETE </button></td>
                    <td><button onclick="redireccionar(34)" class="btn btn-default">1 Chocolates LA FETE </button></td>
                    <td><button onclick="redireccionar(35)" class="btn btn-default">1 Chocolates LA FETE </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(36)" class="btn btn-default">1 Chocolates LA FETE </button></td>
                    <td><button onclick="redireccionar(37)" class="btn btn-default">Torta </button></td>
                    <td><button onclick="redireccionar(38)" class="btn btn-default">Chocolates + Crema Natura </button></td>
                    <td><button onclick="redireccionar(39)" class="btn btn-default">Tablas para Carne + Cajas de cuchilos coctel </button></td>
                    <td><button onclick="redireccionar(40)" class="btn btn-default">Botella con vasos con bombillas </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(41)" class="btn btn-default">Mini pimer  </button></td>
                    <td><button onclick="redireccionar(42)" class="btn btn-default">Set dispensador de agua  </button></td>
                    <td><button onclick="redireccionar(43)" class="btn btn-default">Botella con vasos wisquera  </button></td>
                    <td><button onclick="redireccionar(44)" class="btn btn-default">Casillero del diablo  </button></td>
                    <td><button onclick="redireccionar(45)" class="btn btn-default">Domino con chocolate  </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(46)" class="btn btn-default">Vino novas con chocolate MJ   </button></td>
                    <td><button onclick="redireccionar(47)" class="btn btn-default">Leon de Tarapaca con Sane Nuss   </button></td>
                    <td><button onclick="redireccionar(48)" class="btn btn-default">Vino Santa Rita + Sane Nuss   </button></td>
                    <td><button onclick="redireccionar(49)" class="btn btn-default">Pisco Mistral + Leon de tarapaca+ Bebida PAP   </button></td>
                    <td><button onclick="redireccionar(50)" class="btn btn-default">Vino cono sur + Vodka + Bebida   </button></td>
                </tr>
                <tr>
                    <td><button onclick="redireccionar(51)" class="btn btn-default">2 champañas    </button></td>
                    <td><button onclick="redireccionar(52)" class="btn btn-default">Juego mecano    </button></td>                    
                </tr>
            </table>
            <br>
            <br>
            <br>
            <center>
                <button onclick="redireccionar(53)" class="btn btn-default">Mochila Cibernetica    </button>
            </center>
        </div>
    </body>

    <script>
        function redireccionar(valor) {
            window.location = "Premio.jsp?premio=" + valor;
        }
    </script>


</html>
