{% extends "base.tpl" %}
{% block content %}
</br>
<div class="panel panel-info">
    <div class="panel-heading">Unix时间戳</div>
    <div class="panel-body">
        <form role="form">
            <div class="form-group">
                当前时间戳: <label id="current_timestamp"></label>
            </div>
        </form>
        <div>
            <input class=" form-control" id="input" type="text" placeholder="示例: 2014-06-10 22:20:00 或者 1437658880" />
        </div>
        <br/>
        <div>
            <input class=" form-control" id="result" type="text" placeholder="结果" />
        </div>
        <br/>
        <div>
            <button class="btn btn-primary" id="trans" type="submit">转换</button>
        </div>
    </div>
    <!-- /.panel-body -->
</div>
  
<script type="text/javascript">
    $(function(){
        setNow();
        setInterval('setNow()' , 1000);
    });

    $("#trans").click(function() {
        $("#result").val("");
        var t = $.trim($("#input").val());
        // alert(t);
        if(t.length == 0) {
            return false;
        }

        if( $.isNumeric(t) ) {
            // Convert timestamp to date and time
            var timestamp = parseInt($("#input").val());
            var unixTimestamp = new Date(timestamp * 1000);
            $("#result").val(unixTimestamp.toLocaleString());
        } else {
            // Convert date and time to timestamp
            var timestamp = str2Timestamp(t);
            $("#result").val(timestamp);
        }
    });

    function setNow() {
        $("#current_timestamp").text(getNowUnix() + '    [' + getNowLocal() + ']');
    }
  
    function getNowUnix() {
        return Math.round(new Date().getTime()/1000);
    }
  
    function getNowLocal(timestamp) {
        var myDate ;
        if(timestamp != undefined)
            myDate = new Date(parseInt(timestamp + "000"));
        else
            myDate = new Date();
        var m = (myDate.getMonth()+1);
        if(m.toString().length == 1)
            m= "0"+m;
  
        var d =myDate.getDate();
        if(d.toString().length == 1)
            d= "0"+d;
  
        var h =myDate.getHours();
        if(h.toString().length == 1)
            h= "0" + h;
  
        var min =myDate.getMinutes();
        if(min.toString().length == 1)
            min= "0" + min;
  
        var s =myDate.getSeconds();
        if(s.toString().length == 1)
            s= "0" + s;
  
        return myDate.getFullYear() + "年" + m + "月" +  d + "日 " +
            h + ":" + min + ":" + s ;
    }

    function str2Timestamp(datestr) {
        var new_str = datestr.replace(/:/g,"-");
        new_str = new_str.replace(/ /g,"-");
        var arr = new_str.split("-");
        var datum = new Date(Date.UTC(arr[0],arr[1]-1,arr[2],arr[3],arr[4],arr[5]));
        return (datum.getTime()/1000);
      }

</script>
{% endblock %}