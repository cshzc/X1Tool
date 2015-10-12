{% extends "base.tpl" %}

{% block content_name %}
购车费用计算器
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <div style="display: none;" id="total">
        <table class="table">
            <tbody>
                <tr>
                    <h3 style="text-align:center">
                        <strong>全款购车预计花费总额:</strong>
                        <span>&nbsp;&nbsp;</span>
                        <span id="total_fee" style="color:#1C81C7">0</span>
                        <small>
                            <p>(此结果仅供参考，实际费用以当地缴费为准)</p>
                        </small>
                    </h3>
                </tr>
                <tr><td><p><br/></p></td></tr>
            </tbody>
        </table>
    </div>
    <table>
        <thead>
            <tr>
                <td>
                    <h5><strong>裸车价格:</strong></h5>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <input class="form-control" id="car_price" type="text" value="0" required="">
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <button class="btn btn-primary" id="calculate" type="submit">开始计算</button>
                </td>
              <td>&nbsp;&nbsp;&nbsp;</td>
              <td>
                    <label class="radio-inline">
                        <input type="radio" name="seat_count_radio" id="below_6_seats" value="5" checked="checked" onclick="choose_seat_count()">家用6座以下
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="seat_count_radio" id="above_6_seats" value="7" onclick="choose_seat_count()">家用6座以上
                    </label>
                      <label class="radio-inline">
                        <input type="radio" name="seat_count_radio" id="self_define_seat" value="0" onclick="choose_seat_count()">自定义
                    </label>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                  <input class="form-control" id="seat_count" type="text" value="0" required="" style="display:none">
                </td>
            </tr>
            <tr><td><p><br></p></td></tr>
        </thead>
    </table>
    <div>
        <table class="table table-bordered table-hover">
            <tbody>
                <tr>
                    <td class="info"><h5 style="text-align:center"><strong>基本费用</strong></h5></td>
                    <td class="info">
                            <h5>
                                <strong>
                                    <span>小计:</span>
                                    <span id="total_basic_fee" style="color:#1C81C7">0</span>
                                    <small style="color:#1C81C7">(单位:元)</small>
                                </strong>
                            </h5>
                        
                    </td>
                </tr>
                <tr>
                    <td>购置税</td>
                    <td>
                        <span id="purchase_tax_fee" style="color:#1C81C7">0</span>
                    </td>
                </tr>
                <tr>
                    <td>上牌费</td>
                    <td>
                        <span>
                            <input id="lpr_installation_fee" type="text" value="500">
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>车船税</td>
                    <td>
                        <span>
                            <input id="vehicle_vessel_tax_fee" type="text" value="0">
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;</span>
                        <select id="displacement_choice">
                            <option value="1.0">1.0L(含)以下</option>
                            <option value="1.6" selected="selected">1.0-1.6L(含)</option>
                            <option value="2.0">1.6-2.0L(含)</option>
                            <option value="2.5">2.0-2.5L(含)</option>
                            <option value="3.0">2.5-3.0L(含)</option>
                            <option value="4.0">3.0-4.0L(含)</option>
                            <option value="5.0">4.0L以上</option>
                        </select>
                        <label>排量</label>
                    </td>
                </tr>
                <tr>
                    <td>交强险</td>
                    <td>
                       <span id="compulsory_insurance_fee" style="color:#1C81C7">0</span>
                    </td>
                </tr>
                <tr>
                    <td class="info"><h5 style="text-align:center"><strong>商业保险</strong></h5></td>
                    <td class="info">
                        <h5>
                            <strong>
                                <span>小计:</span>
                                <span id="total_commercial_fee" style="color:#1C81C7">0</span>
                                <span>(折后:<span id="total_commercial_discount_fee" style="color:#1C81C7">0</span>)</span>
                                <small style="color:#1C81C7">(单位:元)</small>
                            </strong>
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td align="center" >
                        <a href="javascript:void(0);" onclick="basic_plan()">基本保障</a>
                        <span>&nbsp;&nbsp;&nbsp;</span>
                        <a href="javascript:void(0);" onclick="overall_plan()">全面保障</a>
                        <span>&nbsp;&nbsp;&nbsp;</span>
                        <a href="javascript:void(0);" onclick="cost_efficient_plan()">高性价比投保</a>
                    </td>
                    <td>
                        <input id="discount" type="text" value="95" required="">
                        <label>%<span>&nbsp;&nbsp;&nbsp;</span>折扣</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="tpl_enable" checked="checked">
                        第三责任险
                    </td>
                    <td>
                        <span id="tpl_fee" style="color:#1C81C7">0</span>
                        <span>&nbsp;&nbsp;&nbsp;</span>
                        <select id="tpl_choice">
                            <option value="50000">5万</option>
                            <option value="100000">10万</option>
                            <option value="200000">20万</option>
                            <option value="500000" selected="selected">50万</option>
                            <option value="1000000">100万</option>
                        </select>
                        <label>赔付额度</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="car_damage_enable" checked="checked" onclick="mark_related_checkbox()">
                        车辆损失险
                    </td>
                    <td>
                        <span id="car_damage_fee" style="color:#1C81C7">0</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="iop_enable" checked="checked">
                        不计免赔特约险
                    </td>
                    <td>
                        <span id="iop_fee" style="color:#1C81C7">0</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="car_theft_enable" checked="checked">
                        全车盗抢险
                    </td>
                    <td>
                        <span id="car_theft_fee" style="color:#1C81C7">0</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="glass_breakage_enable" checked="checked">
                        玻璃单独破碎险
                    </td>
                    <td>
                        <span id="glass_breakage_fee" style="color:#1C81C7">0</span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <select id="glass_breakage_choice">
                            <option value="1">进口</option>
                            <option value="0" selected="selected">国产</option>
                        </select>
                        <label>产地</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox" id="car_damage_dw_enable" checked="checked">
                        车身划痕险
                    </td>
                    <td>
                        <span id="car_damage_dw_fee" style="color:#1C81C7">0</span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <select id="car_damage_dw_choice">
                            <option value="2000" selected="selected">2千</option>
                            <option value="5000">5千</option>
                            <option value="10000">1万</option>
                            <option value="20000">2万</option>
                        </select>
                        <label>赔付额度</label>
                    </td>
                </tr>
                <tr>
                <td>
                    <input type="checkbox" id="engine_damage_enable" checked="checked">
                    涉水险/发动机特别损失险
                </td>
                <td>
                    <span id="engine_damage_fee" style="color:#1C81C7">0</span>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="combustion_enable" checked="checked">
                    自燃损失险
                </td>
                <td>
                    <span id="combustion_fee" style="color:#1C81C7">0</span>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="passenger_enable" checked="checked">
                    乘客座位险
                </td>
                <td>
                    <span id="passenger_fee" style="color:#1C81C7">0</span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <select id="passenger_choice">
                        <option value="10000" selected="selected">1万</option>
                        <option value="20000">2万</option>
                        <option value="30000">3万</option>
                        <option value="40000">4万</option>
                        <option value="50000">5万</option>
                    </select>
                    <label>赔付额度</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" id="driver_enable" checked="checked">
                    司机座位险
                </td>
                <td>
                    <span id="driver_fee" style="color:#1C81C7">0</span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <select id="driver_choice">
                        <option value="10000" selected="selected">1万</option>
                        <option value="20000">2万</option>
                        <option value="30000">3万</option>
                        <option value="40000">4万</option>
                        <option value="50000">5万</option>
                    </select>
                    <label>赔付额度</label>
                </td>
            </tr>
         </tbody>
    </table>
    </div>
</div>
{% endblock %}

{% block content_script %}
<script type="text/javascript">
    var route = $("#finance-car_purchase").attr('href');
    var appid = $("#finance-car_purchase").attr('appid');
    function basic_plan() {
                            $('#tpl_enable').prop("checked", true);
                            $('#car_damage_enable').prop("checked", true);
                            $('#iop_enable').prop("checked", true);

                            $('#car_theft_enable').prop("checked", false);
                            $('#glass_breakage_enable').prop("checked", false);
                            $('#car_damage_dw_enable').prop("checked", false);
                            $('#engine_damage_enable').prop("checked", false);
                            $('#combustion_enable').prop("checked", false);
                            $('#passenger_enable').prop("checked", false);
                            $('#driver_enable').prop("checked", false);
                          }

    function overall_plan() {
                            $('#tpl_enable').prop("checked", true);
                            $('#car_damage_enable').prop("checked", true);
                            $('#iop_enable').prop("checked", true);

                            $('#car_theft_enable').prop("checked", true);
                            $('#glass_breakage_enable').prop("checked", true);
                            $('#car_damage_dw_enable').prop("checked", true);
                            $('#engine_damage_enable').prop("checked", true);
                            $('#combustion_enable').prop("checked", true);
                            $('#passenger_enable').prop("checked", true);
                            $('#driver_enable').prop("checked", true);
                          }

    function cost_efficient_plan() {
                            $('#tpl_enable').prop("checked", true);
                            $('#car_damage_enable').prop("checked", true);
                            $('#iop_enable').prop("checked", true);
                            $('#passenger_enable').prop("checked", true);
                            $('#driver_enable').prop("checked", true);

                            $('#car_theft_enable').prop("checked", false);
                            $('#glass_breakage_enable').prop("checked", false);
                            $('#car_damage_dw_enable').prop("checked", false);
                            $('#engine_damage_enable').prop("checked", false);
                            $('#combustion_enable').prop("checked", false);

                          }

    function mark_related_checkbox(){
                            if ($('#car_damage_enable').prop("checked") != true)
                            {
                                $('#iop_enable').prop("checked", false);
                                $('#iop_enable').prop("disabled", true);

                                $('#car_theft_enable').prop("checked", false);
                                $('#car_theft_enable').prop("disabled", true);

                                $('#engine_damage_enable').prop("checked", false);
                                $('#engine_damage_enable').prop("disabled", true);

                                $('#car_damage_dw_enable').prop("checked", false);
                                $('#car_damage_dw_enable').prop("disabled", true);

                                $('#glass_breakage_enable').prop("checked", false);
                                $('#glass_breakage_enable').prop("disabled", true);
                            }
                            else
                            {
                                $('#iop_enable').prop("disabled", false);
                                $('#car_theft_enable').prop("disabled", false);
                                $('#engine_damage_enable').prop("disabled", false);
                                $('#car_damage_dw_enable').prop("disabled", false);
                                $('#glass_breakage_enable').prop("disabled", false);
                            }
                          }

   function choose_seat_count(){
                if ($('input:radio[name="seat_count_radio"]:checked').val() == 0)
                {
                    $('#seat_count').attr("style", "")
                 }
                else
                {
                    $('#seat_count').attr("style", "display:none")
                    $('#seat_count').val(0)
                }

              }

    $(function(){
        $("#calculate").click(function() {
            
        var car_price = $("#car_price").val()
            if (car_price == "" || isNaN(car_price)) {
                alert("请输入正确的数字");
                return;
            } else {
                
                
        var displacement = $("#displacement_choice").val();
        var seat_count = $('input:radio[name="seat_count_radio"]:checked').val();
        if (seat_count  == 0)
            seat_count = $('#seat_count').val()
        
        var lpr_installation = $("#lpr_installation").val()
        var vehicle_vessel_tax = $("#vehicle_vessel_tax_fee").val()
        var post_data = {app_id:appid, car_price:car_price, displacement:displacement, seat_count:seat_count, lpr_installation:lpr_installation, vehicle_vessel_tax:vehicle_vessel_tax}
    
        var checkboxes = $(":checkbox")
        for (var i = 0; i < checkboxes .length; i++)
        {
            var checkbox = checkboxes[i];
            name = checkbox.id.replace(/_enable/, '')
            if (checkbox.checked == true)
            {
                var selection_name = name + "_choice"
                var selection = $("#" + selection_name)
                if (selection.length == 1)
                {
                    post_data[name] = selection.val()
                }
                else
                {
                    post_data[name] = 0
                }
            }
        }

        $.post(route, post_data, function(data){
                    var response = eval('(' + data + ')');
                    for (var key in response)
                    {
                        id = key + '_fee'
                        try
                        {
                            if ($("#" + id).attr('type') == 'text')
                                $("#" + id).val(response[key].toFixed(1))
                            else
                                $("#" + id).text(response[key].toFixed(1))
                        }
                        catch(e)
                        {

                        }
                    }

                    var discount = $("#discount").val()/100
                    total_commercial_discount_fee = parseFloat($("#total_commercial_fee").text())
                    if (discount > 0 && discount <= 1)
                        total_commercial_discount_fee = (total_commercial_discount_fee * discount)

                    $("#total_commercial_discount_fee").text(total_commercial_discount_fee.toFixed(1))
                    total_fee = parseFloat($("#total_basic_fee").text()) + total_commercial_discount_fee + parseFloat(car_price)
                    $("#total_fee").text(total_fee.toFixed(1))
                    $("#total").attr("style", "");

                });
            }
        });
    });
</script>
{% endblock %}
