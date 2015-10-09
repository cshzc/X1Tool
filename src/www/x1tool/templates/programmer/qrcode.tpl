{% extends "base.tpl" %}

{% block content_name %}
QRCode生成器
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <br/>
    <div>
        <textarea class="form-control" id="raw"  placeholder="粘贴或输入字符串" required></textarea>
    </div>
    <br/>
    <div>
        <button class="btn btn-primary" id="gen" type="submit">生成</button>
    </div>
    <div id="qrcode_container"></div>
</div>
{% endblock %}

{% block content_script %}
<script type="text/javascript">
var route = $("#programmer-qrcode").attr('href')
var appid = $("#programmer-qrcode").attr('appid')
$(function(){   
    $("#gen").click(function() {
        $("#qrcode_img").remove()
        var input_raw = $("#raw").val()
        if (input_raw != "") {
            $.post(route, {app_id: appid, raw: input_raw }, function(data){
                var response = eval('(' + data + ')');
                // Process the response data and fill the table
                var path = response.path;
                $("#qrcode_container").append('<img id="qrcode_img" src=' + path + '/>');
            });
        }
    });
    
});
</script>
{% endblock %}