{% extends "base.tpl" %}

{% block content_name %}
五险一金计算器
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <table>
        <tbody>
            <tr>
                <td><label>月基本工资</label></td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td><input class="form-control" id="salary" type="text" placeholder="收入额" required/></td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td><button class="btn btn-primary" id="calculate" type="submit">开始计算</button></td>
            </tr>
            <tr><td><p><br/></p></td></tr>
        </tbody>
    </table>
    <table class="table table-striped table-bordered table-hover" id="social_insurance">
        <thead>
            <tr>
                <th>缴费项目</th>
                <th>
                    个人缴费明细
                </th>
                <th>
                    单位缴费明细
                    <span style="font-size:12px;font-weight: normal;color:#1C81C7;padding-right:10px;">(单位：元)</span>
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>养老</td>
                <td>
                    <span>
                        <input id="pension_rate" type="text" value="8">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="pension_fee" style="color:#1C81C7"></span>
                </td>
                <td>
                    <span>
                        <input id="company_pension_rate" type="text" value="20">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_pension_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td>医疗</td>
                <td>
                    <span>
                        <input id="medical_rate" type="text" value="2">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="medical_fee" style="color:#1C81C7"></span>
                </td>
                <td>
                    <span>
                        <input id="company_medical_rate" type="text" value="10">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_medical_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td>失业</td>
                <td>
                    <span>
                        <input id="unemployment_rate"type="text" value="1">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="unemployment_fee" style="color:#1C81C7"></span>
                </td>
                <td>
                    <span>
                        <input id="company_unemployment_rate"type="text" value="1">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_unemployment_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td>工伤</td>
                <td>
                    <div style="visibility: hidden;">
                        <span>
                            <input id="occupational_rate" class="ipt ime" type="text" value="0">
                            <label>%</label>
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="occupational_fee" style="color:#1C81C7"></span>
                    </div>
                </td>
                <td>
                    <span>
                        <input id="company_occupational_rate" class="ipt ime" type="text" value="0.5">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_occupational_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td>生育</td>
                <td>
                    <div style="visibility: hidden;">
                        <span>
                            <input id="maternity_rate" type="text" disabled="disabled" value="0">
                            <label>%</label>
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="maternity_fee" style="color:#1C81C7"></span>
                    </div>
                </td>
                <td>
                    <span>
                        <input id="company_maternity_rate" type="text" value="0.8">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_maternity_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td>公积金</td>
                <td>
                    <span>
                        <input id="housing_rate" type="text" value="12">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="housing_fee" style="color:#1C81C7"></span>
                </td>
                 <td>
                    <span>
                        <input id="company_housing_rate" type="text" value="12">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_housing_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td colspan=3>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span><p><input type="checkbox" id="more"><label>机关、事业单位等住房补贴</label></p></span>
                </td>
            </tr>
            <tr id="subsidy" style="display: none;">
                <td>住房补贴</td>
                <td>
                    <span>
                        <input id="subsidy_rate" type="text" value="0">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="subsidy_fee" style="color:#1C81C7"></span>
                </td>
                <td>
                    <span>
                        <input id="company_subsidy_rate" type="text" value="0">
                        <label>%</label>
                    </span>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                    <span id="company_subsidy_fee" style="color:#1C81C7"></span>
                </td>
            </tr>
            <tr>
                <td><h4>合计</h4></td>
                <td>个人缴纳:<b id="total_fee" style="text-decoration:underline;color:#1C81C7"></b></td>
                <td>公司缴纳:<b id="company_total_fee" style="text-decoration:underline;color:#1C81C7"></b></td>
            </tr>
        </tbody>
    </table>
</div>
{% endblock %}

{% block content_script %}
<script type="text/javascript">
    var route = $("#finance-social_insurance").attr('href');
    var appid = $("#finance-social_insurance").attr('appid');
    $("#more").click(function () {
        if ($("#subsidy").attr("style") == "display: none;") {
            $("#subsidy").attr("style", "");
            $("#subsidy input").val(9)
        } else {
            $("#subsidy").attr("style", "display: none;");
            $("#subsidy input").val(0)
        }
    });

    $(function(){
        $("#calculate").click(function() {
            // alert($("#value").val());
            var salary = $("#salary").val();
            
            if (salary == "" || isNaN(salary)) {
                alert("请输入正确的数字");
                return;
            } else {
                var rate_table = {};
                var inputs = $("#social_insurance input")
                for (var i = 0; i < inputs.length; i++) {
                    var input = inputs[i];
                    if (input.type == 'text')
                    {
                        name = input.id.replace(/_rate/, '')
                        rate_table[name] = parseFloat(input.value)/100
                    }
                }


                var post_data = {app_id:appid, salary:salary, rate_table:JSON.stringify(rate_table)}
                $.post(route, post_data, function(data){
                    var response = eval('(' + data + ')');
                    for (var key in response){
                        id = key + '_fee'
                        try
                        {
                            $("#" + id).text(response[key].toFixed(1))
                        }
                        catch(e)
                        {
                             //alert(e.name + ": " + e.message);
                        }
                    }

                });
            }
        });
    });
</script>
{% endblock %}
