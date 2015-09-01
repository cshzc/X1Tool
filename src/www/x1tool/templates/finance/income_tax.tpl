{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">个税计算器</div>
    <div class="panel-body">
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>
                            <select class="form-control" id="type">
                                <option>税前收入</option>
                                <option>税后收入</option>
                                <option>纳税额</option>
                            </select>
                        </td>
                        <td>&nbsp&nbsp;&nbsp;</td>
                        <td><input class="form-control" id="value" type="text" placeholder="收入额" required/></td>
                        <td>&nbsp;&nbsp;</td>
                        <td><button class="btn btn-primary" id="calculate" type="submit">开始计算</button></td>
                        <td>&nbsp;&nbsp;&nbsp;</td>
                        <td><input type="checkbox" id="enable_social_insurance"><label>五险一金</label></td>
                    </tr>
                    <tr><td><p><br/></p></td></tr>
                </tbody>
            </table>
        </div>
        <div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <!-- <th></th> -->
                            <th>税前收入</th>
                            <th>应纳税额</th>
                            <th>税后收入</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="pre_tax_income_value">-</td>
                            <td id="income_tax_value">-</td>
                            <td id="after_tax_income_value">-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-lg-6" id="social_insurance" style="display: none;">
            <div style="text-align:center;"><h4><b>五险一金缴费明细<small>(可调整参数)</small></b></h4></div>
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>缴费项目</th>
                        <th>
                            个人缴费明细
                            <small style="color:#1C81C7">(单位：元)</small>
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
                    <tr id="subsidy" style="display: none;">
                        <td>住房补贴</td>
                        <td>
                            <!--<div style="visibility: hidden;">-->
                                <span>
                                    <input id="subsidy_rate" type="text" value="9">
                                    <label>%</label>
                                </span>
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <span id="subsidy_fee" style="color:#1C81C7"></span>
                            <!--</div>-->
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
</div>

<script type="text/javascript">
    $(function(){
        $("#enable_social_insurance").click(function () {
            if ($("#social_insurance").attr("style") == "display: none;") {
                $("#social_insurance").attr("style", "");
            } else {
                $("#social_insurance").attr("style", "display: none;");
            }
            
        });

        $("#more").click(function () {
            if ($("#subsidy").attr("style") == "display: none;") {
                $("#subsidy").attr("style", "");
            } else {
                $("#subsidy").attr("style", "display: none;");
            }
            
        });

        $("#calculate").click(function() {
            // alert($("#value").val());
            var input_value = $("#value").val();
            var input_type = $("#type").val();
            var route = $("#finance-income_tax").attr('href')
            var appid = $("#finance-income_tax").attr('appid')
            
            if (input_value == "" || isNaN(input_value)) {
                alert("请输入正确的数字");
                return;
            } else {
                if (input_type == "税前收入") {
                    var post_data = {app_id: appid, pre_tax_income: input_value}
                } else if (input_type == "税后收入") {
                    var post_data = {app_id: appid, after_tax_income: input_value}
                } else if (input_type == "纳税额") {
                    var post_data = {app_id: appid, income_tax: input_value}
                } else {
                    return
                }

                if ($("#social_insurance").attr("style") != "display: none;"){
                    var rate_table = {};
                    var inputs = $("#social_insurance input")
                    for (var i = 0; i < inputs.length; i++) {
                        var input = inputs[i];
                        name = input.id.replace(/_.*/, '')
                        rate_table[name] = parseInt(input.value)/100
                    }

                    post_data.rate_table = JSON.stringify(rate_table)
                    post_data.include_social_insurance = 1
                }

                $.post(route, post_data, function(data){
                    var result = eval('(' + data + ')');
                    var response = result[0]
                    $("#pre_tax_income_value").text(response.pre_tax_income.toFixed(2));
                    $("#income_tax_value").text(response.income_tax.toFixed(2));
                    $("#after_tax_income_value").text(response.after_tax_income.toFixed(2));

                    if ($("#social_insurance").attr("style") != "display: none;")
                    {
                        try
                        {
                            insurance = result[1]
                            for (var key in insurance){

                                id = key + '_fee'
                                try
                                {
                                    $("#" + id).text(insurance[key].toFixed(1))
                                }
                                catch(e)
                                {
                                     //alert(e.name + ": " + e.message);
                                }
                            }
                        }
                        catch(e)
                        {

                        }
                    }
                });
            }
        });
    });
</script>
{% endblock %}
