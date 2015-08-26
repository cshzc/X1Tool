{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">快递查询</div>
    <div class="panel-body">
        <ul class="nav nav-tabs">
            <li class="active" id="sf">
                <a data-toggle="tab" href="#text">顺丰</a>
            </li>
            <li class="" id="sto">
                <a data-toggle="tab" href="#text">申通</a>
            </li>
            <li class="" id="yt">
                <a data-toggle="tab" href="#text">圆通</a>
            </li>
            <li class="" id="yd">
                <a data-toggle="tab" href="#text">韵达</a>
            </li>
            <li class="" id="tt">
                <a data-toggle="tab" href="#text">天天</a>
            </li>
            <li class="" id="ems">
                <a data-toggle="tab" href="#text">EMS</a>
            </li>
            <li class="" id="zto">
                <a data-toggle="tab" href="#text">中通</a>
            </li>
            <li class="" id="ht">
                <a data-toggle="tab" href="#text">汇通</a>
            </li>
            <li class="" id="qf">
                <a data-toggle="tab" href="#text">全峰</a>
            </li>
        </ul>
        <br/>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>
                            <input class="form-control" id="no"  placeholder="粘贴或输入快递单号" style="width:480px;"></input>
                        </td>
                        <td>&nbsp&nbsp&nbsp</td>
                        <td><button class="btn btn-primary" id="query" type="submit">查询</button></td>
                    </tr>
                </tbody>
            </table>
            
        </div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>时间</th>
                            <th>事件</th>
                        </tr>
                    </thead>
                    <tbody id="express_trace">
                        
                    </tbody>
                </table>
            </div>
        </div>
        <font size="1"><a href="http://m.kuaidi100.com" target="_blank">快递查询</a></font>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        
        $("#query").click(function() {
            var input_com = "";
            var input_no = $("#no").val()
            var route = $("#life-express").attr('href')
            var appid = $("#life-express").attr('appid')
            if (input_no == "" || isNaN(input_no)) {
                $("#result").val("");
                alert("请输入正确快递单号");
                return;
            } else {
                if ($("#sf").attr("class") == "active") {
                    input_com = "sf";
                } else if ($("#sto").attr("class") == "active") {
                    input_com = "sto";
                } else if ($("#yt").attr("class") == "active") {
                    input_com = "yt";
                } else if ($("#yd").attr("class") == "active") {
                    input_com = "yd";
                } else if ($("#tt").attr("class") == "active") {
                    input_com = "tt";
                } else if ($("#ems").attr("class") == "active") {
                    input_com = "ems";
                } else if ($("#zto").attr("class") == "active") {
                    input_com = "zto";
                } else if ($("#ht").attr("class") == "active") {
                    input_com = "ht";
                } else if ($("#qf").attr("class") == "active") {
                    input_com = "qf";
                };
            }
            if (input_no != "") {
                $.post(route, {app_id: appid, com: input_com, no: input_no }, function(data){
                    var response = eval('(' + data + ')');
                    // Process the response data and fill the table
                    for (var i = 1; i <= response.list.length; i++) {
                        // alert(response.list[i].datetime);
                        var remark = response.list[i].remark;
                        var date = response.list[i].datetime;
                        $("#express_trace").append("<tr><td>" + i + "</td><td>" + date + "</td><td>" + remark + "</td></tr>");
                    };
                });
            }
        });
        
    });
</script>
{% endblock %}
