{% extends "base.tpl" %}

{% block content_name %}
国内 IP 定位
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <div>
        <table>
            <tbody>
                <tr>
                    <td><input class="form-control" id="ip_address" placeholder="IP 地址" required></input></td>
                    <td>&nbsp;&nbsp;</td>
                    <td><button class="btn btn-primary" id="locate" type="submit">定位</button></td>
                    <td>&nbsp;&nbsp;</td>
                    <td><h5 id="location"></h5></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br/>
    <div id="baidu_map" style="height:240px;"></div>
</div>
{% endblock %}

{% block content_script %}
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=OcWADy9kpT34drNH4A76bFpW"></script>
<script type="text/javascript">
    var route = $("#programmer-ip_locator").attr('href')
    var appid = $("#programmer-ip_locator").attr('appid')
    $(function(){   
        var map = new BMap.Map("baidu_map");
        var myGeo = new BMap.Geocoder();
        var marker;
        function myFun(result){
            var cityName = result.name;
            var cityCenter = result.center
            map.centerAndZoom(cityCenter, 10);
            marker = new BMap.Marker(cityCenter);
            map.addOverlay(marker);
            marker.setAnimation(BMAP_ANIMATION_BOUNCE);
        }
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);
        
        $("#locate").click(function() {
            map.removeOverlay(marker);
            $("#location").text("");
            var ip_address = $("#ip_address").val();
            if (ip_address != "") {
                $.post(route, {app_id: appid, ip: ip_address }, function(data){
                    var response = eval('(' + data + ')');
                    // Process the response data and fill the table
                    var city = response.data.city;
                    if (city == "") {
                        $("#location").text("无法显示该地点");
                    }
                    myGeo.getPoint(city, function(point){
                        if (point) {
                            map.centerAndZoom(point, 10);
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