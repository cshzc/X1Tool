<!DOCTYPE html>
<html lang="en">
{% block head %}
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>X1 Tool</title>
    <!-- Bootstrap Core CSS -->
    <link href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/static/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/static/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/static/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="/static/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/static/bower_components/metisMenu/dist/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/static/dist/js/sb-admin-2.js"></script>
    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256060940'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256060940%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));
        document.getElementById("cnzz_stat_icon_1256060940").style.display = "none";
    </script>
</head>
{% endblock %}

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            {% block logo %}
            <div class="navbar-header">
            	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">X1 TOOL</a>
                <ul class="nav navbar-top-links navbar-right">
                	<li class="dropdown" style="padding-top: 15px;">
                    	<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=52&icon=1&num=3" width="180" height="25" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" sandbox=""></iframe>
                	</li>
            	</ul>
            </div>
            
            {% endblock %}
            {% block sidebar_nav %}
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                	<button class="btn btn-default" type="button">
                                    	<i class="fa fa-search"></i>
                                	</button>
                            	</span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="/"><i class="fa fa-dashboard fa-fw"></i> 主面板</a>
                        </li>   
                        {% for category in tpl_data.category_list %}
                            <li>
                                <a href="#"><i class="fa {{category.icon}} fa-fw"></i> {{tpl_data.utils.get_text(category.name)}}<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    {% for item in tpl_data.app_list[category.name] %}
                                        <li><a appid="{{item.id}}" id="{{item.route.strip('/').replace('/', '-')}}" href="{{item.route}}">{{tpl_data.utils.get_text(item.name)}}</a></li>
                                    {% endfor %}
                                </ul>
                            </li>
                        {% endfor %}
                        
                    </ul>
                </div>
            </div>
            {% endblock %}
        </nav>
        <div id="page-wrapper">
        {% block content %}
        {% endblock %}
        </div>
    </div>
</body>
</html>
