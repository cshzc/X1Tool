<!DOCTYPE html>
<html lang="en">
{% block head %}
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="alexaVerifyID" content="DvpMmDgDi2RpRRCpEa8G6Znz1wc"/>
    <title>X1 Tool, 一站式工具平台</title>
    <!-- Bootstrap Core CSS -->
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="http://cdn.bootcss.com/metisMenu/2.1.0/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/static/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="http://cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="/static/css/json-lint.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="http://cdn.bootcss.com/metisMenu/2.1.0/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/static/dist/js/sb-admin-2.js"></script>
    <script src="/static/js/stock.js"></script>
</head>
{% endblock %}

<body>
    <div id="wrapper">
        <!-- Navigation -->
        {% block navagation %}
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0" id="navagator">
            {% block logo %}
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/">X1 Tool</a>
                <ul class="nav navbar-top-links navbar-right">
                    <li style="padding-top: 15px;">
                        <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=52&icon=1&num=3" width="180" height="25" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" sandbox=""></iframe>
                    </li>
                </ul>
            </div>
            <ul class="nav navbar-top-links navbar-right" id="stock_bar">
                <li style="padding-top: 15px;">
                    <button class="btn btn-xs btn-danger" id="stock" data-toggle="tooltip" data-placement="bottom" title="上证指数">上证: NaN</button>
                </li>
                <li style="padding-top: 15px;">
                    <button class="btn btn-xs btn-danger" id="stock_sz" data-toggle="tooltip" data-placement="bottom" title="深证成指">深成: NaN</button>
                </li>
            </ul>
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
                                        <li><a appid="{{item.id}}" id="{{item.route.strip('/').replace('/', '-')}}" name= "{{item.name}}" href="{{item.route}}">{{tpl_data.utils.get_text(item.name)}}</a></li>
                                    {% endfor %}
                                </ul>
                            </li>
                        {% endfor %}
                        
                    </ul>
                </div>
            </div>
            {% endblock %}
        </nav>
        {% endblock %}

        <div id="page-wrapper">
        {% block content %}
            <br/>
            <div class="panel panel-info">
                <div class="panel-heading">
                    {% block content_name %}
                    {% endblock %}
                    {% include 'comments.tpl' ignore missing %}
                </div>
                {% block content_main %}
                {% endblock %}
                {% block content_script %}
                {% endblock %}
            </div>
        {% endblock %}
        </div>
        <hr>
        {% block footer %}
            {% include 'footer.tpl' ignore missing %}
        {% endblock %}
    </div>
</body>

</html>
