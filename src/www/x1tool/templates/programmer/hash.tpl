{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">Hash计算器</div>
    <div class="panel-body">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="active" id="md5">
                <a data-toggle="tab" href="#text" onclick="clear_result();">MD5</a>
            </li>
            <li class="" id="sha1">
                <a data-toggle="tab" href="#text" onclick="clear_result();">SHA1</a>
            </li>
            <li class="" id="sha256">
                <a data-toggle="tab" href="#text" onclick="clear_result();">SHA256</a>
            </li>
            <li class="" id="sha512">
                <a data-toggle="tab" href="#text" onclick="clear_result();">SHA512</a>
            </li>
            <!-- <li class="" id="hmac-md5">
                <a data-toggle="tab" href="#text" onclick="clear_result();">Hmac-MD5</a>
            </li>
            <li class="" id="hmac-sha1">
                <a data-toggle="tab" href="#text" onclick="clear_result();">Hmac-SHA1</a>
            </li>
            <li class="" id="hmac-sha224">
                <a data-toggle="tab" href="#text" onclick="clear_result();">Hmac-SHA224</a>
            </li>
            <li class="" id="hmac-sha384">
                <a data-toggle="tab" href="#text" onclick="clear_result();">Hmac-SHA384</a>
            </li>
            <li class="" id="hmac-sha512">
                <a data-toggle="tab" href="#text" onclick="clear_result();">Hmac-SHA512</a>
            </li> -->
        </ul>
        <br/>
        <div>
            <textarea class="form-control" id="hash_raw"  placeholder="粘贴或输入字符串" required></textarea>
        </div>
        <br/>
        <div>
            <input class="form-control" id="hash_result" type="text" placeholder="Hash结果" />
        </div>
        <br/>
        <div>
            <button class="btn btn-primary" id="start" type="submit">开始计算</button>
            <button class="btn btn-primary" id="format" type="submit">大小写切换</button>
        </div>
    </div>
    <!-- /.panel-body -->
</div>
  
<script src="/static/js/programmer/md5.js"></script>
<script src="/static/js/programmer/sha1.js"></script>
<script src="/static/js/programmer/sha256.js"></script>
<script src="/static/js/programmer/sha512.js"></script>
<script src="/static/js/programmer/hmac-md5.js"></script>
<script src="/static/js/programmer/hmac-sha1.js"></script>
<script src="/static/js/programmer/hmac-sha224.js"></script>
<script src="/static/js/programmer/hmac-sha384.js"></script>
<script src="/static/js/programmer/hmac-sha512.js"></script>

<script type="text/javascript">
    upper = false;
    $("#start").click(function() {
        upper = false
        if ($("#hash_raw").val() == "") {
            $("#hash_result").val("");
        } else {
            if ($("#md5").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.MD5($("#hash_raw").val()));
            } else if ($("#sha1").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.SHA1($("#hash_raw").val()));
            } else if ($("#sha256").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.SHA256($("#hash_raw").val()));
            } else if ($("#sha512").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.SHA512($("#hash_raw").val()));
            } else if ($("#hmac-md5").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.HmacMD5($("#hash_raw").val(), 'password'));
            } else if ($("#hmac-sha1").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.HmacSHA1($("#hash_raw").val(), 'password'));
            } else if ($("#hmac-sha224").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.HmacSHA224($("#hash_raw").val(), 'password'));
            } else if ($("#hmac-sha384").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.HmacSHA384($("#hash_raw").val(), 'password'));
            } else if ($("#hmac-sha512").attr("class") == "active") {
                $("#hash_result").val(CryptoJS.HmacSHA512($("#hash_raw").val(), 'password'));
            };
        }
    });

    $("#format").click(function() {
        if (upper == false) {
            $("#hash_result").val($("#hash_result").val().toUpperCase());
            upper = true;
        } else {
            $("#hash_result").val($("#hash_result").val().toLowerCase());
            upper = false;
        }
    });

    function clear_result () {
        $("#hash_result").val("");
    }
</script>
{% endblock %}