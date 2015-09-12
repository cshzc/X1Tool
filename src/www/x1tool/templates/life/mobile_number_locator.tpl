{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">手机号码归属地查询</div>
    <div class="panel-body">
        <table>
            <tbody>
                <tr>
                    <td><input class="form-control" id="mobile_number" placeholder="手机号码" required></input></td>
                    <td>&nbsp;&nbsp;</td>
                    <td><button class="btn btn-primary" id="query" type="submit">查询</button></td>
                    <td>&nbsp;&nbsp;</td>
                    <td><h5 id="carrier"></h5></td>
                </tr>
            </tbody>
        </table>
        <br/>
        <div id="baidu_map" style="height:240px;"></div>
    </div>
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OcWADy9kpT34drNH4A76bFpW"></script>
<script type="text/javascript">
    $(function(){
        var map = new BMap.Map("baidu_map");
        var myGeo = new BMap.Geocoder();
        var marker;
        function myFun(result){
            var cityName = result.name;
            var cityCenter = result.center
            map.centerAndZoom(cityCenter, 9);
            marker = new BMap.Marker(cityCenter);
            map.addOverlay(marker);
            marker.setAnimation(BMAP_ANIMATION_BOUNCE);
        }

        var myCity = new BMap.LocalCity();
        myCity.get(myFun);

        $("#query").click(function() {
            map.removeOverlay(marker);
            $("#carrier").val("");
            var input_num = $("#mobile_number").val();
            if (input_num == "" || isNaN(input_num)) {
                alert("请输入正确的手机号码");
            } else {
                var route = $("#life-mobile_number_locator").attr('href');
                var appid = $("#life-mobile_number_locator").attr('appid');
                $.post(route, {app_id: appid, mobile_number: input_num }, function(data){
                    var response = eval('(' + data + ')');
                    // Process the response data and fill the table
                    $("#carrier").text(response.province + response.cityname + ' ' + response.isp);
                    myGeo.getPoint(response.cityname, function(point){
                        if (point) {
                            map.centerAndZoom(point, 9);
                            marker = new BMap.Marker(point)
                            map.addOverlay(marker);
                            marker.setAnimation(BMAP_ANIMATION_BOUNCE);
                        }
                    }, "北京市");
                });
            }
        });
        
    });
</script>
{% endblock %}
