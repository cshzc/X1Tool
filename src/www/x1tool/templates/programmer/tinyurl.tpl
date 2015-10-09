{% extends "base.tpl" %}

{% block content_name %}
短地址生成器
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <ul class="nav nav-tabs">
        <li class="active" id="baidu">
            <a data-toggle="tab" href="#text" onclick="clear_result();">Baidu短地址</a>
        </li>
    </ul>
    <br/>
    <div>
        <table style="width: 80%;">
            <tbody>
                <tr>
                    <td><input class="form-control" id="raw_url" placeholder="粘贴或输入原网址" required></input></td>
                    <td>&nbsp;&nbsp;</td>
                    <td><button class="btn btn-primary" id="start" style="width: 100%;" type="submit">转换</button></td>
                    <td>&nbsp;&nbsp;</td>
                    <td><input class="form-control" id="result" style="width: 60%;" type="text" placeholder="生成结果"></input></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
{% endblock %}

{% block content_script %}
<script type="text/javascript">
    var route = $("#programmer-tinyurl").attr('href')
    var appid = $("#programmer-tinyurl").attr('appid')
    $(function(){   
        $("#start").click(function() {
            clear_result();
            var input_raw = $("#raw_url").val();
            if (input_raw != "") {
                $.post(route, {app_id: appid, type: 'baidu', raw_url: input_raw }, function(data){
                    var response = eval('(' + data + ')');
                    // Process the response data and fill the table
                    var tinyurl = response.tinyurl;
                    $("#result").val(tinyurl);
                });
            }
        });
        
    });

    function clear_result () {
        $("#result").val("");
    }
</script>
{% endblock %}