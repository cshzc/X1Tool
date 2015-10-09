{% extends "base.tpl" %}

{% block content_name %}
Base64编解码
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <br/>
    <div class="tab-content">
        <div class="tab-pane active" id="text">
            <textarea class="form-control" id="string_raw" height="100px" placeholder="粘贴或输入字符串" required></textarea>
      </div>
    </div>
    <br/>
    <div>
        <textarea class="form-control" id="string_result"  placeholder="编/解码结果" required></textarea>
    </div>
    <br/>
    <div>
        <button class="btn btn-primary" id="encode" type="submit">编码</button>
        <button class="btn btn-primary" id="decode" type="submit">解码</button>
    </div>
</div>
{% endblock %}

{% block content_script %}
<script src="/static/js/programmer/base64.js"></script>
<script type="text/javascript">
    var appid = $("#programmer-base64").attr('appid')
    $("#encode").click(function() {
      if ($("#string_raw").val() == "") {
          $("#string_result").val("");
      } else {
          $("#string_result").val(base64encode(utf16to8($("#string_raw").val())))
      }
    });

    $("#decode").click(function() {
      if ($("#string_raw").val() == "") {
          $("#string_result").val("");
      } else {
          $("#string_result").val(utf8to16(base64decode($("#string_raw").val())))
      }
    });

    function clear_result () {
        $("#hash_result").val("");
    }
</script>
{% endblock %}