{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">字符串加密解密</div>
    <div class="panel-body">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="active" id="rc4">
                <a data-toggle="tab" href="#text" onclick="clear_result();">RC4</a>
            </li>
            <li class="" id="aes">
                <a data-toggle="tab" href="#text" onclick="clear_result();">AES</a>
            </li>
            <li class="" id="des">
                <a data-toggle="tab" href="#text" onclick="clear_result();">DES</a>
            </li>
            <li class="" id="rabbit">
                <a data-toggle="tab" href="#text" onclick="clear_result();">Rabbit</a>
            </li>
            <li class="" id="tripledes">
                <a data-toggle="tab" href="#text" onclick="clear_result();">TripleDES</a>
            </li>
        </ul>
        <br/>
        <div>
            <textarea class="form-control" id="crypto_raw"  placeholder="粘贴或输入字符串" required></textarea>
        </div>
        <br/>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>密码:&nbsp;&nbsp;</td>
                        <td><input class="form-control" id="crypto_pwd" type="text" placeholder="输入密码" required/></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br/>
        <div>
            <textarea class="form-control" id="crypto_result" type="text" placeholder="加密/解密结果"></textarea>
        </div>
        <br/>
        <div>
            <button class="btn btn-primary" id="encrypt" type="submit">加密</button>
            <button class="btn btn-primary" id="decrypt" type="submit">解密</button>
        </div>
    </div>
    <!-- /.panel-body -->
</div>
  
<script src="/static/js/programmer/aes.js"></script>
<script src="/static/js/programmer/rabbit.js"></script>
<script src="/static/js/programmer/rc4.js"></script>
<script src="/static/js/programmer/tripledes.js"></script>

<script type="text/javascript">
    $("#encrypt").click(function() {
      if ($("#crypto_raw").val() == "") {
          $("#crypto_result").val("");
      } else {
          if ($("#rc4").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.RC4.encrypt($("#crypto_raw").val(),$("#crypto_pwd").val()));
          } else if ($("#aes").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.AES.encrypt($("#crypto_raw").val(),$("#crypto_pwd").val()));
          } else if ($("#des").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.DES.encrypt($("#crypto_raw").val(),$("#crypto_pwd").val()));
          } else if ($("#rabbit").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.Rabbit.encrypt($("#crypto_raw").val(),$("#crypto_pwd").val()));
          } else if ($("#tripledes").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.TripleDES.encrypt($("#crypto_raw").val(),$("#crypto_pwd").val()));
          }
      }
    });

    $("#decrypt").click(function() {
      clear_result();
      if ($("#crypto_raw").val() == "") {
          $("#crypto_result").val("");
      } else {
          if ($("#rc4").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.RC4.decrypt($("#crypto_raw").val(),$("#crypto_pwd").val()).toString(CryptoJS.enc.Utf8));
          } else if ($("#aes").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.AES.decrypt($("#crypto_raw").val(),$("#crypto_pwd").val()).toString(CryptoJS.enc.Utf8));
          } else if ($("#des").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.DES.decrypt($("#crypto_raw").val(),$("#crypto_pwd").val()).toString(CryptoJS.enc.Utf8));
          } else if ($("#rabbit").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.Rabbit.decrypt($("#crypto_raw").val(),$("#crypto_pwd").val()).toString(CryptoJS.enc.Utf8));
          } else if ($("#tripledes").attr("class") == "active") {
              $("#crypto_result").val(CryptoJS.TripleDES.decrypt($("#crypto_raw").val(),$("#crypto_pwd").val()).toString(CryptoJS.enc.Utf8));
          }
      }
    });

    function clear_result () {
        $("#crypto_result").val("");
    }
</script>
{% endblock %}