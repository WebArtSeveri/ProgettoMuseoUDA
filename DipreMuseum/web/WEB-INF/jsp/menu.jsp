

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            
            <a class="navbar-brand" href="/DipreMuseum/">Dipr&egrave; Museum</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">Info</a>
                </li>
                <li>
                    <a href="#">Visite</a>
                </li>
                <li>
                    <a href="#">Contatti</a>
                </li>
                <li>

                    <% if (session.getAttribute("username") != null && !session.getAttribute("username").toString().equals("")) {

                            out.println("<li><a href='./profile'>Profilo</a></li>");
                        }
                    %>

                </li>
                <li>



                    <% if (session.getAttribute("username") != null && !session.getAttribute("username").toString().equals("")) {

                            out.println("<a href='./logout'>Logout</a>");
                        } else {
                            out.println("<a href='./login'>Login</a>");
                        }
                    %>

                </li>



            </ul>
        </div>
        <!-- /.navbar-collapse -->

        <!-- /.container -->
    </div>
</nav>

