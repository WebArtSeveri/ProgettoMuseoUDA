<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>

<div id="wrapper">
    <jsp:include page="menu.jsp"/>
    <script>
        function del(idservizio) {
            $.ajax({
                type: "POST",
                url: "./eliminaservizio",
                data: {cods : idservizio},
                success: function(){
                    window.location.replace("./adminservices?eliminato=true");
                },
                error:function(){
                    window.location.replace("./adminservices?eliminato=false");
                }
            });
        }
    </script>
    <div id="page-wrapper" >
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Services <small>manage services</small>
                    </h1>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <%
                        if (request.getParameter("inseriti") != null) {
                            if (request.getParameter("inseriti").equals("true")) {
                                out.write(" <div class='alert alert-success' role='alert'>Successfully added service</div>");
                            }
                        }
                        if (request.getParameter("aggiornato") != null) {
                            if (request.getParameter("aggiornato").equals("true")) {
                                out.write(" <div class='alert alert-success' role='alert'>Successfully updated service</div>");
                            }
                        }
                        if (request.getParameter("eliminato") != null) {
                            if (request.getParameter("eliminato").equals("true")) {
                                out.write(" <div class='alert alert-success' role='alert'>Successfully delited service</div>");
                            }else{
                                out.write(" <div class='alert alert-danger' role='alert'>Error service not delited </div>");
                            }
                        }
                    %>


                </div>
            </div>


            <div class="row pad">
                <div class="col-md-12">
                    <form class="form-inline" role="search" action="./cercaservice" method="post">
                        <button type="button" class="btn btn-success" data-toggle='modal' data-target="#inserisci">Add service</button>
                        <div class="form-group">
                            <input type="text" name="code" class="form-control" placeholder="Find service by code">
                        </div>
                        <button type="submit" class="btn btn-default">Search</button>
                    </form>
                </div>
            </div>
            <div class="modal fade" id="inserisci" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add new service</h4>
                        </div>

                        <div class="modal-body">
                            <form action="./addservice" method="post">
                                <div class="form-group">
                                    <label for="code">Service's code</label>
                                    <input name="code" type="text" class="form-control" id="code" placeholder="Service 's code">
                                </div>
                                <div class="form-group">
                                    <label for="desc">Description</label>
                                    <input name="desc" type="text" class="form-control" id="desc" placeholder="Service 's description">
                                </div>
                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input name="price" type="text" class="form-control" id="price" placeholder="Service 's price">
                                </div>
                                <button type="submit" class="btn btn-warning">Add</button>
                                <button  type="button" class="btn btn-default"  data-dismiss="modal">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>





            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-list fa-fw"></i> List of services</h3>
                        </div>
                        <div class="panel-body">
                            <div class="list-group">

                                <c:forEach  items="${servizi}" var="servizio">
                                    <a href="#modal${servizio.getCodS()}" class="list-group-item" data-toggle='modal'>
                                        <!--<span class="badge"><button>ciao</button></span>
                                        <i class="fa fa-fw fa-calendar"></i>
                                        Calendar updated-->
                                        <!--<div class="col-md-3"><button class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i></button> <button class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i></button></div>-->

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="col-md-9 paddingtop" >
                                                    ${servizio.getDescrizione()}
                                                </div>
                                                <div class="col-md-3 centertext" >
                                                    <div class="btn-group" role="group" >
                                                        <button type="button" class="btn btn-warning" ><i class="fa fa-pencil" aria-hidden="true"></i></button>
                                                        <button type="button" class="btn btn-danger" onclick="del('${servizio.getCodS()}')"><i class="fa fa-trash" aria-hidden="true"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </a>
                                    <div class="modal fade" id="modal${servizio.getCodS()}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">Service information</h4>
                                                </div>

                                                <div class="modal-body">
                                                    <form action="./modificaservice" method="post">
                                                        <input type="hidden" name="oldcode" value="${servizio.getCodS()}" >
                                                        <div class="form-group">
                                                            <label for="code">Service's code</label>
                                                            <input name="newcode" type="text" class="form-control" id="code" value='${servizio.getCodS()}'>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="desc">Description</label>
                                                            <input name="desc" type="text" class="form-control" id="desc" value='${servizio.getDescrizione()}'>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="price">Price</label>
                                                            <input name="price" type="text" class="form-control" id="price" value='${servizio.getPrezzo()}'>
                                                        </div>
                                                        <button type="submit" class="btn btn-warning">Modify</button>
                                                        <button  type="button" class="btn btn-default"  data-dismiss="modal">Close</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->

<jsp:include page="../footer.jsp"/>