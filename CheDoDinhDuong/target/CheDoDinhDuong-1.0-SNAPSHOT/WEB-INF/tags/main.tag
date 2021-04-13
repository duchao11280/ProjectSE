<%@tag pageEncoding="utf-8" %>
<%@attribute name="css" fragment="true" required="false" %>
<%@attribute name="js" fragment="true" required="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>Document</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, maximum-scale=1, initial-scale=1, user-scalable=0"/>
    <!--[if IE]>
    <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600%7CRaleway:300,400,500,600,700%7CLato:300,400,400italic,600,700"
          rel="stylesheet" type="text/css"/>
    <!-- <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500&display=swap" rel="stylecssheet"> -->

    <!-- CORE CSS -->
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/plugins/bootstrap/css/bootstrap.min.css" />--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"/>
    <!-- THEME CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/essentials.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/layout.css"/>
    <!-- PAGE LEVEL SCRIPTS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/header-1.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/Styles/color_scheme.css"/>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>
<body class="smoothscroll enable-animation">
<div id="wrapper">
    <div id="header" class="navbar-toggleable-md clearfix">
        <header id="topNav">
            <div class="container">
                <ul class="float-right nav nav-pills nav-second-main">
                    <!-- SEARCH -->
                    <li class="search">
                        <a href="javascript:;">
                            <i class="fa fa-search"></i>
                        </a>
                        <div class="search-box">
                            <form method="post">
                                <div class="input-group">
                                    <input type="text" name="src" placeholder="Search" class="form-control"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-primary" type="button" formaction="#">Search</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </li>
                    <!-- /SEARCH -->
                </ul>

                <a class="logo float-left" href="#">
                    <img src="${pageContext.request.contextPath}/Public/images/logo_dark.png"/>
                </a>
                <div class="navbar-collapse collapse float-right nav-main-collapse">
                    <nav class="nav-main">


                        <ul id="topMain" class="nav nav-pills nav-main">
                            <li class="active">
                                <a href="#">
                                    HOME
                                </a>
                            </li>

                            <li class="dropdown"><!-- PAGES -->
                                <a class="dropdown-toggle" href="#">
                                    OPTION 1
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown">
                                        <a class="dropdown-toggle" href="#">
                                            SUB OPTION 1
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="portfolio-single-project.html">SUB SUB OPTION 1</a></li>
                                            <li><a href="page-category.html">SUB SUB OPTION 2</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">
                                            SUB OPTION 2
                                        </a>
                                    </li>
                                </ul>
                            </li>


                            <li class="active">
                                <a href="login.html">
                                    LOGIN
                                </a>
                            </li>
                            <li class="active">
                                <a href="register.html">
                                    REGISTER
                                </a>
                            </li>

                        </ul>

                    </nav>
                </div>
            </div>
        </header>
    </div>
    <jsp:doBody/>
    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <img src="${pageContext.request.contextPath}/Public/images/logo-footer.png" class="footer-logo">
                    <p>Contact us to any report</p>
                    <address>
                        <ul class="list-unstyled">
                            <li class="footer-sprite address">
                                PO Box 21132<br>
                                Here Weare St, Melbourne<br>
                                Vivas 2355 Australia<br>
                            </li>
                            <li class="footer-sprite phone">
                                Phone: 1-800-565-2390
                            </li>
                            <li class="footer-sprite email">
                                <a href="mailto:support@yourname.com">support@yourname.com</a>
                            </li>
                        </ul>
                    </address>
                </div>
                <div class="col-md-3">
                    <!-- Latest Blog Post -->
                    <h4 class="letter-spacing-1">LATEST NEWS</h4>
                    <ul class="footer-posts list-unstyled">
                        <li>
                            <a href="#">Donec sed odio dui. Nulla vitae elit libero, a pharetra augue</a>
                            <small>29 June 2017</small>
                        </li>
                        <li>
                            <a href="#">Nullam id dolor id nibh ultricies</a>
                            <small>29 June 2017</small>
                        </li>
                        <li>
                            <a href="#">Duis mollis, est non commodo luctus</a>
                            <small>29 June 2017</small>
                        </li>
                    </ul>
                    <!-- /Latest Blog Post -->
                </div>
                <div class="col-md-2">
                    <!-- Links -->
                    <h4 class="letter-spacing-1">EXPLORE SMARTY</h4>
                    <ul class="footer-links list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Our Clients</a></li>
                        <li><a href="#">Our Pricing</a></li>
                        <li><a href="#">Smarty Tour</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                    <!-- /Links -->
                </div>
                <div class="col-md-4">
                    <!-- Newsletter Form -->
                    <h4 class="letter-spacing-1">KEEP IN TOUCH</h4>
                    <p>Subscribe to Our Newsletter to get Important News &amp; Offers</p>

                    <form class="validate" action="php/newsletter.php" method="post"
                          data-success="Subscribed! Thank you!" data-toastr-position="bottom-right">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control required"
                                   placeholder="Enter your Email">
                            <span class="input-group-btn">
										<button class="btn btn-success" type="submit">Subscribe</button>
									</span>
                        </div>
                    </form>
                    <!-- /Newsletter Form -->

                    <!-- Social Icons -->
                    <div class="mt-20">
                        <a href="#" class="social-icon social-icon-border social-facebook float-left"
                           data-toggle="tooltip" data-placement="top" title="Facebook">

                            <i class="icon-facebook"></i>
                            <i class="icon-facebook"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-twitter float-left"
                           data-toggle="tooltip" data-placement="top" title="Twitter">
                            <i class="icon-twitter"></i>
                            <i class="icon-twitter"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-gplus float-left" data-toggle="tooltip"
                           data-placement="top" title="Google plus">
                            <i class="icon-gplus"></i>
                            <i class="icon-gplus"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-linkedin float-left"
                           data-toggle="tooltip" data-placement="top" title="Linkedin">
                            <i class="icon-linkedin"></i>
                            <i class="icon-linkedin"></i>
                        </a>

                        <a href="#" class="social-icon social-icon-border social-rss float-left" data-toggle="tooltip"
                           data-placement="top" title="Rss">
                            <i class="icon-rss"></i>
                            <i class="icon-rss"></i>
                        </a>

                    </div>
                    <!-- /Social Icons -->

                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <ul class="float-right m-0 list-inline mobile-block">
                    <li><a href="#">Terms &amp; Conditions</a></li>
                    <li>&bull;</li>
                    <li><a href="#">Privacy</a></li>
                </ul>
                &copy; All Rights Reserved, Company LTD
            </div>
        </div>
    </footer>
</div>
<script>
    $(document).mouseup(function(e)
    {
        var container = $(".search-box");

        // if the target of the click isn't the container nor a descendant of the container
        if (!container.is(e.target) && container.has(e.target).length === 0)
        {
            container.hide();
        }
    });
    $('.search').on("click",function () {
        $('.search-box').css("display","block");
    })
</script>
<script type="text/javascript">var plugin_path = 'assets/plugins/';</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/jquery/jquery-3.2.1.min.js"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/scripts.js"/>

</body>
</html>