{% extends "base.tpl" %}

{% block content_name %}
房贷计算器
{% endblock %}

{% block content_main %}
<div class="panel-body">
    <!-- Nav tabs -->
    <ul class="nav nav-pills">
        <li class="active" id="commercial"><a href="#calculator" data-toggle="tab" onclick="choose_loan('commercial')" value="0">商业贷款</a>
            </li>
        <li id="housing"><a href="#calculator" data-toggle="tab" onclick="choose_loan('housing')" value="1">公积金贷款</a>
        </li>
        <li id="combined"><a href="#calculator" data-toggle="tab" onclick="choose_loan('combined')" value="2">组合贷款</a>
        </li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content" id="calculator">
        <table>
            <tbody>
                <tr><td><br/></td></tr>
                <tr id="calc_way_choice">
                    <td colspan=2>
                        <label class="radio-inline"><input type='radio' name="calc_way" value="0" onclick="choose_calc_way();" checked="checked">根据面积、单价计算</label>
                        <label class="radio-inline"><input type='radio' name="calc_way" value="1" onclick="choose_calc_way();">根据贷款总额计算</label>
                    </td>
                </tr>

                <tr><td><br/></td></tr>

                 <tr id="calc_number_commercial" style="display:none;">
                     <td><strong>商业贷款：</strong></td>
                     <td>
                        <div class="form-group input-group">
                            <input class="form-control" type="text" id="commercial_loan" value="0">
                            <span class="input-group-addon">万元</span>
                        </div>
                    </td>
                </tr>

                <tr id="calc_number_housing_fund" style="display:none;">
                     <td><strong>公积金贷款：</strong></td>
                     <td>
                        <div class="form-group input-group">
                            <input class="form-control" type="text" id="housing_loan" value="0">
                            <span class="input-group-addon">万元</span>
                        </div>
                    </td>
                </tr>

                <tr style="" id="calc_price_detail">
                    <td><strong>单价：</strong></td>
                    <td>
                        <div class="form-group input-group">
                            <input type="text" id="price" class="form-control" value="0">
                            <span class="input-group-addon">元/平米</span>
                        </div>
                    </td>
                </tr>

                <tr style="" id="calc_area_detail">
                    <td><strong>面积：</strong></td>
                    <td>
                        <div class="form-group input-group">
                            <input type="text" id="sqm" class="form-control" value="0">
                            <span class="input-group-addon">平米</span>
                        </div>
                    </td>
                </tr>

                <tr id="percentage" >
                    <td><strong>按揭成数：</strong></td>
                    <td>
                        <select class="form-control" id="percentage_choice">
                            <option value="2">2成</option>
                            <option value="3">3成</option>
                            <option value="4">4成</option>
                            <option value="5">5成</option>
                            <option value="6">6成</option>
                            <option value="7" selected="">7成</option>
                            <option value="8">8成</option>
                            <option value="9">9成</option>
                        </select>
                    </td>
                </tr>

                <tr><td><br/></td></tr>

                <tr>
                    <td><strong>贷款期限：</strong></td>
                    <td>
                        <select id="year_choice" name="years" class="form-control" onChange="update_rate()">
                            <option value="1">1年（12期）</option>
                            <option value="2">2年（24期）</option>
                            <option value="3">3年（36期）</option>
                            <option value="4">4年（48期）</option>
                            <option value="5">5年（60期）</option>
                            <option value="6">6年（72期）</option>
                            <option value="7">7年（84期）</option>
                            <option value="8">8年（96期）</option>
                            <option value="9">9年（108期）</option>
                            <option value="10">10年（120期）</option>
                            <option value="11">11年（132期）</option>
                            <option value="12">12年（144期）</option>
                            <option value="13">13年（156期）</option>
                            <option value="14">14年（168期）</option>
                            <option value="15">15年（180期）</option>
                            <option value="16">16年（192期）</option>
                            <option value="17">17年（204期）</option>
                            <option value="18">18年（216期）</option>
                            <option value="19">19年（228期）</option>
                            <option value="20" selected="selected">20年（240期）</option>
                            <option value="25">25年（300期）</option>
                            <option value="30">30年（360期）</option>
                        </select>
                    </td>
                </tr>

                <tr><td><br/></td></tr>

                <tr>
                    <td><strong>年利率：</strong></td>
                    <td>
                        <select id="rate_choice" name="rate_choice" onChange="update_rate()" class="form-control">
                            <option value="0" selected="selected">最新基准利率</option>
                            <option value="2015.08.26">2015年08月26日新利率基准</option>
                            <option value="2012.07.06">2012年07月06日新利率基准</option>
                            <option value="2010.10.20">2010年10月20日利率基准</option>
                            <option value="2008.12.23">2008年12月23日利率基准</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td align="right" colspan=2>
                        <h6 id="commercial_rate_visual"><small>商业贷款利率&nbsp
                            <input type="text" id="commercial_rate" class="input-sm" value="">
                            %</small>
                        </h6>
                         <h6 id="housing_rate_visual" style="display:none;"><small>公积金贷款利率
                            <input type="text" id="housing_rate" class="input-sm" value="">
                            %</small>
                        </h6>
                      </div>
                    </td>
                </tr>

                <tr><td><br/></td></tr>

                <tr>
                    <td/>
                    <td><button class="btn btn-primary" id="calculate" type="submit">开始计算</button></td>
                </tr>

                    <tr><td><br/></td></tr>

            </tbody>
        </table>
    </div>

    <div>
        <div class="col-xs-6" id="average_capital_interest" style="display:none;">
            <h4 align = "center"><strong>等额本息还款</strong><span>&nbsp;&nbsp;&nbsp;</span><small style="color:#1C81C7">(每月等额还款)</small></h4>
            <table class="table table-striped table-bordered table-hover" id="result">
                <tbody>
                    <tr>
                        <td>贷款总额</td>
                        <td>
                            <span id="average_total_capital_loan" style="color:#1C81C7">0</span>元
                        </td>
                    </tr>
                    <tr>
                        <td>还款月数</td>
                        <td>
                            <span id="average_total_month_loan" style="color:#1C81C7">0</span>月
                        </td>
                    </tr>
                    <tr>
                        <td>每月还款</td>
                        <td>
                            <h5><span id="average_first_month_loan" style="color:#1C81C7">0</span>元</h5>
                        </td>
                    </tr>
                    <tr>
                        <td>总支付利息</td>
                        <td>
                            <span id="average_total_interest_loan" style="color:#1C81C7">0</span>元
                        </td>
                    </tr>
                    <tr>
                        <td>本息合计</td>
                        <td>
                            <span id="average_total_loan" style="color:#1C81C7">0</span>元
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

    <div class = "col-xs-6" id="average_capital" style="display:none;">
        <h4 align = "center"><strong>等额本金还款</strong><span>&nbsp;&nbsp;&nbsp;</span><small style="color:#1C81C7">(逐月递减还款)</small></h4>
        <table class="table table-striped table-bordered table-hover" id="result">
            <tbody>
                <tr>
                    <td>贷款总额</td>
                    <td>
                        <span id="total_capital_loan" style="color:#1C81C7">0</span>元
                    </td>
                </tr>
                <tr>
                    <td>还款月数</td>
                    <td>
                        <span id="total_month_loan" style="color:#1C81C7">0</span>月
                    </td>
                </tr>
                <tr>
                    <td>首月还款</td>
                    <td>
                        <h5><span id="first_month_loan" style="color:#1C81C7">0</span>
                            元<small>(逐月递减<span id="diff" style="color:#1C81C7">0</span>元)<small>
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td>总支付利息</td>
                    <td>
                        <span id="total_interest_loan" style="color:#1C81C7">0</span>元
                    </td>
                </tr>
                <tr>
                    <td>本息合计</td>
                    <td>
                        <span id="total_loan" style="color:#1C81C7">0</span>元
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
{% endblock %}

{% block content_script %}
<script type="text/javascript">
    var route = $("#finance-housing_loan").attr('href');
    var appid = $("#finance-housing_loan").attr('appid');
    function update_rate()
    {
        var commercial_rate_table = {};
        var housing_rate_table = {};

        commercial_rate_table["2015.08.26"] =  [4.6, 5, 5.15];
        housing_rate_table["2015.08.26"] =  [2.75, 2.75, 3.25];

        commercial_rate_table["2012.07.06"] =  [6.31, 6.40, 6.65];
        housing_rate_table["2012.07.06"] =  [4.2, 4.2, 4.7];

        commercial_rate_table["2010.10.20"] =  [5.96, 5.96, 6.14];
        housing_rate_table["2010.10.20"] =  [3.50, 3.50, 4.05];

        commercial_rate_table["2008.12.23"] =  [5.76, 5.76, 5.94];
        housing_rate_table["2008.12.23"] =  [3.33, 3.33, 3.87];

        var year_choice = $('#year_choice').val()
        var rate_choice = $('#rate_choice').val()

        var commercial_rate = "";
        var housing_rate = "";

        if (rate_choice == "0")
        {
            commercial_rate = "";
            housing_rate = "";
        }
        else if (year_choice <= "1")
        {
            commercial_rate = commercial_rate_table[rate_choice][0];
            housing_rate = housing_rate_table[rate_choice][0];
        }
        else if (year_choice <= "5")
        {
            commercial_rate = commercial_rate_table[rate_choice][1];
            housing_rate = housing_rate_table[rate_choice][1];
        }
        else
        {
            commercial_rate = commercial_rate_table[rate_choice][2];
            housing_rate = housing_rate_table[rate_choice][2];
        }

        $("#commercial_rate").val(commercial_rate);
        $("#housing_rate").val(housing_rate);
    }


    function choose_loan(type)
    {
        update_rate();

        if (type == "combined")
        {
            $('#calc_price_detail').attr("style", "display:none");
            $('#calc_area_detail').attr("style", "display:none");
            $('#calc_way_choice').attr("style", "display:none");
            $('#percentage').attr("style", "display:none");

            $('#calc_number_commercial').attr("style", "");
            $('#calc_number_housing_fund').attr("style", "");

            $('#commercial_rate_visual').attr("style", "");
            $('#housing_rate_visual').attr("style", "");
        }
        else
        {
            $('#calc_way_choice').attr("style", "")
            if (type == "housing")
            {
                $('#commercial_rate_visual').attr("style", "display:none;");
                $('#housing_rate_visual').attr("style", "");
            }
            else
            {
                $('#commercial_rate_visual').attr("style", "");
                $('#housing_rate_visual').attr("style", "display:none;");
            }

            if ($('input:radio[name="calc_way"]:checked').val() == 0)
            {
                $('#calc_area_detail').attr("style", "");
                $('#calc_price_detail').attr("style", "");
                $('#percentage').attr("style", "");

                $('#calc_number_commercial').attr("style", "display:none;");
                $('#calc_number_housing_fund').attr("style", "display:none;");
            }
            else
            {
                $('#calc_area_detail').attr("style", "display:none;");
                $('#calc_price_detail').attr("style", "display:none;");
                $('#percentage').attr("style", "display:none;");

                if (type == "housing")
                {
                    $('#calc_number_housing_fund').attr("style", "");
                    $('#calc_number_commercial').attr("style", "display:none;");
                }
                else
                {
                    $('#calc_number_commercial').attr("style", "");
                    $('#calc_number_housing_fund').attr("style", "display:none;");
                }
            }
        }
    }

    function choose_calc_way()
    {
        if ($('input:radio[name="calc_way"]:checked').val() == 0)
        {
            $('#calc_price_detail').attr("style", "");
            $('#calc_area_detail').attr("style", "");
            $('#percentage').attr("style", "");

            $('#calc_number_commercial').attr("style", "display:none");
            $('#calc_number_housing_fund').attr("style", "display:none");
        }
        else
        {
            $('#calc_price_detail').attr("style", "display:none")
            $('#calc_area_detail').attr("style", "display:none")
            $('#percentage').attr("style", "display:none")

            if ($("#housing").attr("class") == "active")
            {
                $('#calc_number_housing_fund').attr("style", "");
                $('#calc_number_commercial').attr("style", "display:none");
            }
            else
            {
                $('#calc_number_commercial').attr("style", "");
                $('#calc_number_housing_fund').attr("style", "display:none");
            }
        }
    }

    $(function()
    {
        $("#calculate").click(function()
        {
        $('#average_capital').attr('style', 'display:none;');
        $('#average_capital_interest').attr('style', 'display:none;');
            // alert($("#value").val());

            var commercial_loan = 0;
            var housing_loan = 0;

            if ($("#combined").attr("class") == "active")
            {
                commercial_loan = parseFloat($("#commercial_loan").val()) * 10000;
                housing_loan = parseFloat($("#housing_loan").val()) * 10000;
            }
            else
            {
                if ($("#housing").attr("class") == "active")
                {
                    housing_loan = parseFloat($("#housing_loan").val()) * 10000;
                    if ($('input:radio[name="calc_way"]:checked').val() == 0)
                    {
                        var area = $('#sqm').val();
                        if (area == "" || isNaN(area)) {
                            alert("请输入正确的数字");
                            return;
                        }
                        var price = $('#price').val();
                        if (price == "" || isNaN(price)) {
                            alert("请输入正确的数字");
                            return;
                        }

                        percentage = $('#percentage_choice').val()/10;
                        housing_loan = area * price * percentage;
                    }
                }
                else
                {
                    commercial_loan = parseFloat($("#commercial_loan").val()) * 10000;
                    if ($('input:radio[name="calc_way"]:checked').val() == 0)
                    {
                        var area = $('#sqm').val();
                        if (area == "" || isNaN(area)) {
                            alert("请输入正确的数字");
                            return;
                        }
                        var price = $('#price').val();
                        if (price == "" || isNaN(price)) {
                            alert("请输入正确的数字");
                            return;
                        }

                        percentage = $('#percentage_choice').val()/10;
                        commercial_loan = area * price * percentage;
                    }
                }
            }

            if (isNaN(commercial_loan) && isNaN(housing_loan)) {
                alert("请输入正确的数字");
                return;
            }


            var commercial_rate = $("#commercial_rate").val();
            var housing_rate = $("#housing_rate").val();
            var years = $('#year_choice').val();

            if (commercial_rate == "" || isNaN(commercial_rate)) {
               commercial_rate = 0;
            }

            if (housing_rate == "" || isNaN(housing_rate)) {
               housing_rate = 0;
            }

            var post_data = {app_id:appid, commercial_loan:commercial_loan, commercial_rate:commercial_rate, housing_loan:housing_loan, housing_rate:housing_rate, years:years};
            $.post(route, post_data, function(data){
                var response = eval('(' + data + ')');
                var average_capital_insterest_result = response[0];
        var average_capital_result = response[1];
        
        var total_loan = commercial_loan + housing_loan;
                $('#total_capital_loan').text(total_loan.toFixed(2));
        $('#average_total_capital_loan').text(total_loan.toFixed(2));

        var total_months = years * 12;
        $('#total_month_loan').text(total_months);
        $('#average_total_month_loan').text(total_months);

        $('#average_first_month_loan').text(parseFloat(average_capital_insterest_result['first_month']).toFixed(2));
        $('#first_month_loan').text(parseFloat(average_capital_result['first_month']).toFixed(2));
        $('#diff').text(parseFloat(average_capital_result['diff']).toFixed(2));
                
        var total = parseFloat(average_capital_result['total']);
        $('#total_loan').text(total.toFixed(2));
        $('#total_interest_loan').text((total - total_loan).toFixed(2));

        var average_total = parseFloat(average_capital_insterest_result['total']);
        $('#average_total_loan').text(average_total.toFixed(2));
        $('#average_total_interest_loan').text((average_total - total_loan).toFixed(2));

        $('#average_capital').attr('style', '');
            $('#average_capital_interest').attr('style', '');

            });
        });
    });
</script>
{% endblock %}