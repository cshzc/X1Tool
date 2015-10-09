{% extends "base.tpl" %}

{% block content_name %}
代码格式化
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <ul class="nav nav-tabs">
        <li class="active" id="json_lint">
            <a data-toggle="tab" href="#text" onclick="clear_result();">JSON格式化</a>
        </li>
        <!-- <li class="" id="js_lint">
            <a data-toggle="tab" href="#text" onclick="clear_result();">JS格式化</a>
        </li> -->
    </ul>
    <br/>
    <div>
        <textarea class="form-control" id="raw_string" style="height:100px;" placeholder="粘贴或输入字符串" required></textarea>
    </div>
    <br/>
    <div>
        <button class="btn btn-primary" id="start" type="submit">格式化</button>
        <input type="checkbox" id="quote_keys" checked="checked">引号
        <input type="checkbox" id="collapsible_view" checked="checked">控制
    </div>
    <br/>
    <div class="Canvas well resizable processed" id="lint_result" style="height:200px;overflow:auto;margin-bottom:0px;" >
    </div>
</div>
{% endblock %}

{% block content_script %}
<script src="/static/js/programmer/json-lint.js"></script>
<script type="text/javascript">
    var appid = $("#programmer-code_lint").attr('appid')
    $(function(){   
        $("#start").click(function() {
            Process();
        });

        $("#quote_keys").click(function() {
            QuoteKeysClicked();
        });

        $("#collapsible_view").click(function() {
            CollapsibleViewClicked();
        });

    });
</script>
{% endblock %}