{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">五险一金计算器</div>
    <div class="panel-body">
        <table>
            <tbody>
                <tr>
                    <td><label>月基本工资</label><td>
                    <td>&nbsp&nbsp&nbsp</td>
                    <td><input class="form-control" id="salary" type="text" placeholder="收入额" required/></td>
                    <td>&nbsp&nbsp&nbsp</td>
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
                        <span style="font-size:12px;font-weight: normal;color:#1C81C7;padding-right:10px;">(单位：元)</span>
                    </th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>养老</td>
                    <td>
                        <span>
                            <input id="pension_rate" type="text" disabled="disabled" value="8">
                            <label>%</label>
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="pension_fee" style="color:#1C81C7"></span>
                    </td>
                </tr>
                <tr>
                    <td>医疗</td>
                    <td>
                        <span>
                            <input id="medical_rate" type="text" disabled="disabled" value="2">
                            <label>%</label>
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="medical_fee" style="color:#1C81C7"></span>
                    </td>
                </tr>
                <tr>
                    <td>失业</td>
                    <td>
                        <span>
                            <input id="unemployment_rate"type="text" disabled="disabled" value="1">
                            <label>%</label>
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="unemployment_fee" style="color:#1C81C7"></span>
                    </td>
                </tr>
                <tr>
                    <td>工伤</td>
                    <td>
                        <div style="visibility: hidden;">
                            <span>
                                <input id="occupational_rate" class="ipt ime" type="text" disabled="disabled" value="0">
                                <label>%</label>
                            </span>
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            <span id="occupational_fee" style="color:#1C81C7"></span>
                        </div>
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
                </tr>
                <tr>
                    <td>住房补贴</td>
                    <td>
                        <span>
                            <input id="subsidy_rate" type="text" value="9">
                            <label>%</label>
                        </span>
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span id="subsidy_fee" style="color:#1C81C7"></span>
                    </td>
                </tr>
                <tr>
                    <td><h4>合计</h4></td>
                    <td> 个人缴纳：<b id="total_fee" style="text-decoration:underline;color:#1C81C7"></b>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $("#calculate").click(function() {
            // alert($("#value").val());
            var salary = $("#salary").val();
            var route = $("#finance-social_insurance").attr('href');
            var appid = $("#finance-social_insurance").attr('appid');
            
            if (salary == "" || isNaN(salary)) {
                alert("请输入正确的数字");
                return;
            } else {
                var rate_table = {};
                var inputs = $("#social_insurance input")
                for (var i = 0; i < inputs.length; i++) {
                    var input = inputs[i];
                    name = input.id.replace(/_.*/, '')
                    rate_table[name] = parseInt(input.value)/100
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
