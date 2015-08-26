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
                        <td>&nbsp:&nbsp&nbsp</td>
                        <td><input class="form-control" id="value" type="text" placeholder="收入额" required/></td>
                        <td>&nbsp&nbsp</td>
                        <td><button class="btn btn-primary" id="calculate" type="submit">开始计算</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div>
            <div class="panel-body">
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
                            <!-- <tr>
                                <td>全国均值</td>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <td>当地均值</td>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr> -->
                            <tr>
                                <!-- <td>我的收入</td> -->
                                <td id="pre_tax_income_value">-</td>
                                <td id="income_tax_value">-</td>
                                <td id="after_tax_income_value">-</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        $("#calculate").click(function() {
            // alert($("#value").val());
            var input_value = $("#value").val();
            var input_type = $("#type").val();
            var route = $("#finance-income_tax").attr('href')
            var appid = $("#finance-income_tax").attr('appid')

            if (input_type == "税前收入") {
                input_type = 'pre_tax_income';
            } else if (input_type == "税后收入") {
                input_type = 'after_tax_income';
            } else if (input_type == "纳税额") {
                input_type = 'income_tax';
            } else {
                return
            }
            
            if (input_value == "" || isNaN(input_value)) {
                alert("请输入正确的数字");
                return;
            } else {
                $.post(route, {app_id: appid, type: input_type, value: input_value }, function(data){
                    var response = eval('(' + data + ')');
                    $("#pre_tax_income_value").text(response.pre_tax_income.toFixed(2));
                    $("#income_tax_value").text(response.income_tax.toFixed(2));
                    $("#after_tax_income_value").text(response.after_tax_income.toFixed(2));
                });
            }
        });
    });
</script>
{% endblock %}
