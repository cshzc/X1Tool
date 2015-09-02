<!DOCTYPE html>
<html lang="en">
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
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
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
            
        </nav>
        <br/>
        <div>
            <div class="panel panel-info">
                <div class="panel-heading">X1Tool 信息管理平台</div>
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="" id="application_info">
                            <a data-toggle="tab" href="#detail">当前App信息</a>
                        </li>
                        <li class="" id="session_log">
                            <a data-toggle="tab" href="#detail">访客Session信息</a>
                        </li>
                        <li class="" id="user_visit_log">
                            <a data-toggle="tab" href="#detail">访客日志</a>
                        </li>
                        <li class="" id="application_usage_log">
                            <a data-toggle="tab" href="#detail">APP使用信息</a>
                        </li>
                    </ul>
                </div>
                <div id="result" class="panel-body"></div>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">
    $(function(){
        // application_info();
        $("#application_info").click(function () {
            if ($("#result_table")) {
                $("#result_table").remove();
            }
            $("#result").append("<div class='table-responsive' id='result_table'>\
                <table class='table'>\
                    <thead>\
                        <tr>\
                            <th>id</th>\
                            <th>resource</th>\
                            <th>name</th>\
                            <th>author</th>\
                            <th>comments</th>\
                            <th>category_id</th>\
                        </tr>\
                    </thead>\
                    <tbody id='result_details'></tbody>\
                </table>\
            </div>");
            $.post('/x1admin/', {type: "application_info" }, function(data){
                response = eval('(' + data + ')');
                // alert(response.length);
                $.each(response, function (index, item) {
                    // alert(index);
                    // Process the response data and fill the table
                    $("#result_details").append("<tr>\
                        <td>" + item[0] + "</td>\
                        <td>" + item[1] + "</td>\
                        <td>" + item[2] + "</td>\
                        <td>" + item[3] + "</td>\
                        <td>" + item[4] + "</td>\
                        <td>" + item[5] + "</td>\
                        </tr>");
                });
            });
        });

        $("#session_log").click(function () {
            if ($("#result_table")) {
                $("#result_table").remove();
            }
            $("#result").append("<div class='table-responsive' id='result_table'>\
                <table class='table'>\
                    <thead>\
                        <tr>\
                            <th>id</th>\
                            <th>stime</th>\
                            <th>atime</th>\
                        </tr>\
                    </thead>\
                    <tbody id='result_details'></tbody>\
                </table>\
            </div>");
            $.post('/x1admin/', {type: "session_log" }, function(data){
                response = eval('(' + data + ')');
                // alert(response.length);
                $.each(response, function (index, item) {
                    // alert(index);
                    // Process the response data and fill the table
                    $("#result_details").append("<tr>\
                        <td>" + item[0] + "</td>\
                        <td>" + item[1] + "</td>\
                        <td>" + item[2] + "</td>\
                        </tr>");
                });
            });
        });

        
        $("#user_visit_log").click(function () {
            if ($("#result_table")) {
                $("#result_table").remove();
            }
            $("#result").append("<div class='table-responsive' id='result_table'>\
                <table class='table'>\
                    <thead>\
                        <tr>\
                            <th>id</th>\
                            <th>uid</th>\
                            <th>login_time</th>\
                            <th>logout_time</th>\
                            <th>sid</th>\
                            <th>srcip</th>\
                            <th>location</th>\
                        </tr>\
                    </thead>\
                    <tbody id='result_details'></tbody>\
                </table>\
            </div>");
            $.post('/x1admin/', {type: "user_visit_log" }, function(data){
                response = eval('(' + data + ')');
                // alert(response.length);
                $.each(response, function (index, item) {
                    // alert(index);
                    // Process the response data and fill the table
                    $("#result_details").append("<tr>\
                        <td>" + item[0] + "</td>\
                        <td>" + item[1] + "</td>\
                        <td>" + item[2] + "</td>\
                        <td>" + item[3] + "</td>\
                        <td>" + item[4] + "</td>\
                        <td>" + item[5] + "</td>\
                        <td>" + item[6] + "</td>\
                        </tr>");
                });
            });
        });


        $("#application_usage_log").click(function () {
            if ($("#result_table")) {
                $("#result_table").remove();
            }
            $("#result").append("<div class='table-responsive' id='result_table'>\
                <table class='table' style='width=100%;'>\
                    <thead>\
                        <tr>\
                            <th>id</th>\
                            <th>sid</th>\
                            <th>appid</th>\
                            <th>uid</th>\
                            <th>inputs</th>\
                            <th>outputs</th>\
                            <th>stime</th>\
                            <th>etime</th>\
                        </tr>\
                    </thead>\
                    <tbody id='result_details'></tbody>\
                </table>\
            </div>");
            $.post('/x1admin/', {type: "application_usage_log" }, function(data){
                response = eval('(' + data + ')');
                // alert(response.length);
                $.each(response, function (index, item) {
                    // alert(index);
                    // Process the response data and fill the table
                    $("#result_details").append("<tr>\
                        <td>" + item[0] + "</td>\
                        <td>" + item[1] + "</td>\
                        <td>" + item[2] + "</td>\
                        <td>" + item[3] + "</td>\
                        <td>" + item[4] + "</td>\
                        <td>" + item[5] + "</td>\
                        <td>" + item[6] + "</td>\
                        <td>" + item[7] + "</td>\
                        </tr>");
                });
            });
        });
    });

    function fill_application_info () {
        // alert('application_info');
    }

    function fill_session_log() {
        // alert('session_log');
    }

    function fill_user_visit_log () {
        // alert('user_visit_log');
    }

    function fill_application_usage_log () {
        // alert('application_usage_log');
    }

</script>

</html>
