{% extends "base.tpl" %}
{% block content %}
<br/>
<div class="panel panel-info">
    <div class="panel-heading">汇率转换器</div>
        <div class="panel-body">
            <table>
				<tbody>
                    <tr>
                        <td><strong>兑换金额:</strong></td>
                        <td><span>&nbsp;&nbsp;&nbsp;</span></td>
                        <td><input class="form-control" type="text" id="amount"></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td><strong>持有货币:</strong></td>
                        <td><span>&nbsp;&nbsp;&nbsp;</span></td>
                        <td>
                            <select name="from_tkc" id="from_tkc" class="form-control">
                            <option selected="selected" value="USD">美元(USD)</option>
                            <option value="CNY">人民币(CNY)</option>
                            <option value="otherCode">—其他货币—</option>
                            <option value="EUR">欧元(EUR)</option>
                            <option value="HKD">港元(HKD)</option>
                            <option value="JPY">日元(JPY)</option>
                            <option value="CAD">加元(CAD)</option>
                            <option value="KRW">韩元(KRW)</option>
                            <option value="THB">泰铢(THB)</option>
                            <option value="TWD">台币(TWD)</option>
                            <option value="GBP">英镑(GBP)</option>
                            <option value="NLG">荷兰盾(NLG)</option>
                            <option value="MOP">澳门元(MOP)</option>
                            <option value="NZD">新西兰元(NZD)</option>
                            <option value="SGD">新加坡元(SGD)</option>
                            <option value="CZK">捷克克朗(CZK)</option>
                            <option value="NOK">挪威克郎(NOK)</option>
                            <option value="DKK">丹麦克郎(DKK)</option>
                            <option value="DEM">德国马克(DEM)</option>
                            <option value="SEK">瑞典克朗(SEK)</option>
                            <option value="CHF">瑞士法郎(CHF)</option>
                            <option value="INR">印度卢比(INR)</option>
                            <option value="ITL">意大利里拉(ITL)</option>
                            <option value="AUD">澳大利亚元(AUD)</option>
                            <option value="PHP">菲律宾比索(PHP)</option>
                            <option value="BEF">比利时法郎(BEF)</option>
                            <option value="RUB">俄罗斯卢布(RUB)</option>
                            <option value="otherCode">———</option>
                            <option value="UGX">乌干达先令(UGX)</option>
                            <option value="RON">罗马尼亚新列伊(RON)</option>
                            <option value="TTD">特立尼达多巴哥元(TTD)</option>
                            <option value="SHP">圣赫勒拿群岛磅(SHP)</option>
                            <option value="KGS">吉尔吉斯斯坦索姆(KGS)</option>
                            <option value="DJF">吉布提法郎(DJF)</option>
                            <option value="BTN">不丹努扎姆(BTN)</option>
                            <option value="ZAR">南非兰特(ZAR)</option>
                            <option value="ILS">以色列新锡克尔(ILS)</option>
                            <option value="SYP">叙利亚磅(SYP)</option>
                            <option value="HTG">海地古德(HTG)</option>
                            <option value="YER">也门里亚尔(YER)</option>
                            <option value="UYU">乌拉圭比索(UYU)</option>
                            <option value="BBD">巴巴多斯元(BBD)</option>
                            <option value="XAU">盎司黄金(XAU)</option>
                            <option value="EEK">爱沙尼亚克鲁恩(EEK)</option>
                            <option value="FIM">芬兰马克(FIM)</option>
                            <option value="MWK">马拉维克瓦查(MWK)</option>
                            <option value="IDR">印尼盾(IDR)</option>
                            <option value="ROL">罗马尼亚列伊(ROL)</option>
                            <option value="PGK">巴布亚新几内亚基那(PGK)</option>
                            <option value="SIT">斯洛文尼亚托拉尔(SIT)</option>
                            <option value="XCD">格林纳达东加勒比元(XCD)</option>
                            <option value="RWF">卢旺达法郎(RWF)</option>
                            <option value="NGN">尼日利亚奈拉(NGN)</option>
                            <option value="TMM">土库曼斯坦马纳特(TMM)</option>
                            <option value="BSD">巴哈马元(BSD)</option>
                            <option value="HRK">克罗地亚库纳(HRK)</option>
                            <option value="COP">哥伦比亚比索(COP)</option>
                            <option value="GEL">乔治亚拉里(GEL)</option>
                            <option value="VUV">瓦努阿图瓦图(VUV)</option>
                            <option value="FJD">斐济元(FJD)</option>
                            <option value="MVR">马尔代夫罗非亚(MVR)</option>
                            <option value="AZN">阿塞拜疆曼纳特(AZN)</option>
                            <option value="MNT">蒙古图格里克(MNT)</option>
                            <option value="MGA">马达加斯加阿里亚里(MGA)</option>
                            <option value="IEP">爱尔兰镑(IEP)</option>
                            <option value="SRG">苏里南盾(SRG)</option>
                            <option value="KMF">科摩罗法郎(KMF)</option>
                            <option value="GNF">几内亚法郎(GNF)</option>
                            <option value="SBD">所罗门元(SBD)</option>
                            <option value="KWD">科威特第纳尔(KWD)</option>
                            <option value="BDT">孟加拉塔卡(BDT)</option>
                            <option value="VEB">委内瑞拉博利瓦(VEB)</option>
                            <option value="MMK">缅元(MMK)</option>
                            <option value="TRL">土耳其里拉(TRL)</option>
                            <option value="TJS">塔吉克斯坦索莫尼(TJS)</option>
                            <option value="JOD">约旦第纳尔(JOD)</option>
                            <option value="PAB">巴拿马巴波亚(PAB)</option>
                            <option value="MDL">摩尔多瓦列伊(MDL)</option>
                            <option value="CVE">佛得角埃斯库多(CVE)</option>
                            <option value="CLP">智利比索(CLP)</option>
                            <option value="KES">肯尼亚先令(KES)</option>
                            <option value="SRD">苏里南元(SRD)</option>
                            <option value="MUR">毛里求斯卢比(MUR)</option>
                            <option value="LRD">利比里亚元(LRD)</option>
                            <option value="SAR">沙特阿拉伯里亚尔(SAR)</option>
                            <option value="ARS">阿根廷比索(ARS)</option>
                            <option value="EGP">埃及镑(EGP)</option>
                            <option value="PYG">巴拉圭瓜尼(PYG)</option>
                            <option value="TRY">土耳其新里拉(TRY)</option>
                            <option value="CDF">刚果法郎(CDF)</option>
                            <option value="BMD">百慕大元(BMD)</option>
                            <option value="OMR">阿曼里亚尔(OMR)</option>
                            <option value="CUP">古巴比索(CUP)</option>
                            <option value="NIO">尼加拉瓜科多巴(NIO)</option>
                            <option value="GMD">冈比亚达拉西(GMD)</option>
                            <option value="SKK">斯洛伐克克朗(SKK)</option>
                            <option value="UZS">乌兹别克斯坦苏姆(UZS)</option>
                            <option value="ZMK">赞比亚克瓦查(ZMK)</option>
                            <option value="GTQ">危地马拉格查尔(GTQ)</option>
                            <option value="NPR">尼泊尔卢比(NPR)</option>
                            <option value="NAD">纳米比亚元(NAD)</option>
                            <option value="XEU">欧元（旧）(XEU)</option>
                            <option value="HUF">匈牙利福林(HUF)</option>
                            <option value="LAK">老挝基普(LAK)</option>
                            <option value="SZL">斯威士兰里兰吉尼(SZL)</option>
                            <option value="UDI">沙特阿拉伯里亚尔(UDI)</option>
                            <option value="MTL">马耳他里拉(MTL)</option>
                            <option value="BND">文莱币(BND)</option>
                            <option value="TZS">坦桑尼亚先令(TZS)</option>
                            <option value="SDG">苏丹镑(SDG)</option>
                            <option value="LSL">莱索托洛蒂(LSL)</option>
                            <option value="KYD">开曼群岛币(KYD)</option>
                            <option value="LKR">斯里兰卡卢比(LKR)</option>
                            <option value="MKD">马其顿第纳尔(MKD)</option>
                            <option value="MXN">墨西哥比索(MXN)</option>
                            <option value="GHC">加纳塞第(GHC)</option>
                            <option value="ISK">冰岛克郎(ISK)</option>
                            <option value="LYD">利比亚第纳尔(LYD)</option>
                            <option value="SLL">塞拉里昂利昂(SLL)</option>
                            <option value="PKR">巴基斯坦卢比(PKR)</option>
                            <option value="ANG">安第列斯群岛盾(ANG)</option>
                            <option value="SCR">塞舌尔卢比(SCR)</option>
                            <option value="ATS">奥地利先令(ATS)</option>
                            <option value="LBP">黎巴嫩镑(LBP)</option>
                            <option value="AED">阿联酋迪拉姆(AED)</option>
                            <option value="GHS">新加纳塞第(GHS)</option>
                            <option value="BOB">玻利维亚币(BOB)</option>
                            <option value="ERN">厄立特里亚纳克法(ERN)</option>
                            <option value="GIP">直布罗陀镑(GIP)</option>
                            <option value="QAR">卡塔尔里亚尔(QAR)</option>
                            <option value="BHD">巴林第纳尔(BHD)</option>
                            <option value="IRR">伊朗里亚尔(IRR)</option>
                            <option value="BWP">博茨瓦纳普拉(BWP)</option>
                            <option value="HNL">洪都拉斯伦皮拉(HNL)</option>
                            <option value="ALL">阿尔巴尼亚列克(ALL)</option>
                            <option value="RSD">赛尔维亚第纳尔(RSD)</option>
                            <option value="MYR">马来西亚林吉特(MYR)</option>
                            <option value="ETB">埃塞俄比亚比尔(ETB)</option>
                            <option value="STD">圣多美和普林西比多布拉(STD)</option>
                            <option value="ADP">安道尔西班牙银币(ADP)</option>
                            <option value="BGN">保加利亚列弗(BGN)</option>
                            <option value="DOP">多米尼加比索(DOP)</option>
                            <option value="AMD">亚美尼亚打兰(AMD)</option>
                            <option value="XPF">法国太平洋法郎(XPF)</option>
                            <option value="SDR">特别提款权(SDR)</option>
                            <option value="JMD">牙买加元(JMD)</option>
                            <option value="MRO">毛里塔尼亚乌吉亚(MRO)</option>
                            <option value="ESP">加那利群岛比塞塔(ESP)</option>
                            <option value="ZWD">津巴布韦元(ZWD)</option>
                            <option value="LVL">拉脱维亚拉茨(LVL)</option>
                            <option value="BIF">布隆迪法郎(BIF)</option>
                            <option value="FRF">马提尼克法郎(FRF)</option>
                            <option value="TND">突尼斯第纳尔(TND)</option>
                            <option value="ECS">厄瓜多尔苏克雷(ECS)</option>
                            <option value="VND">越南盾(VND)</option>
                            <option value="GRD">希腊德拉克马(GRD)</option>
                            <option value="PEN">秘鲁新索尔(PEN)</option>
                            <option value="DZD">阿尔及利亚第纳尔(DZD)</option>
                            <option value="MZN">莫桑比克梅蒂卡尔(MZN)</option>
                            <option value="AWG">阿鲁巴弗罗林(AWG)</option>
                            <option value="MZM">莫桑比克美提卡(MZM)</option>
                            <option value="XOF">多哥非共体法郎(XOF)</option>
                            <option value="PTE">葡萄牙埃斯库多(PTE)</option>
                            <option value="KZT">哈萨克斯坦坚戈(KZT)</option>
                            <option value="UAH">乌克兰赫夫米(UAH)</option>
                            <option value="BZD">伯利兹元(BZD)</option>
                            <option value="BAM">波斯尼亚(BAM)</option>
                            <option value="MAD">摩洛哥迪拉姆(MAD)</option>
                            <option value="BYR">白俄罗斯卢布(BYR)</option>
                            <option value="LTL">立陶宛立特(LTL)</option>
                            <option value="KHR">柬埔寨瑞尔(KHR)</option>
                            <option value="XAF">西非法郎(XAF)</option>
                            <option value="CYP">塞浦路斯镑(CYP)</option>
                            <option value="GYD">圭亚那元(GYD)</option>
                            <option value="BRL">巴西雷亚尔(BRL)</option>
                            <option value="AFN">阿富汗尼(AFN)</option>
                            <option value="CRC">哥斯达黎加科朗(CRC)</option>
                            <option value="SVC">萨尔瓦多科朗(SVC)</option>
                            <option value="IQD">伊拉克第纳尔(IQD)</option>
                            <option value="PLN">波兰兹罗提(PLN)</option>
                            <option value="SOS">索马里先令(SOS)</option>
                            <option value="TOP">汤加潘加(TOP)</option>
                            <option value="AOA">安哥拉宽扎(AOA)</option>
                            <option value="LUF">卢森堡法郎(LUF)</option>
                            <option value="KPW">朝鲜元(KPW)</option>
                          </select>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <td><strong>兑换货币:</strong></td>
                        <td><span>&nbsp;&nbsp;&nbsp;</span></td>
                        <td>
                            <select name="to_tkc" id="to_tkc" class="form-control">
                            <option selected="selected" value="CNY">人民币(CNY)</option>
                            <option value="USD">美元(USD)</option>
                            <option value="otherCode">—其他货币—</option>
                            <option value="EUR">欧元(EUR)</option>
                            <option value="HKD">港元(HKD)</option>
                            <option value="JPY">日元(JPY)</option>
                            <option value="CAD">加元(CAD)</option>
                            <option value="KRW">韩元(KRW)</option>
                            <option value="THB">泰铢(THB)</option>
                            <option value="TWD">台币(TWD)</option>
                            <option value="GBP">英镑(GBP)</option>
                            <option value="NLG">荷兰盾(NLG)</option>
                            <option value="MOP">澳门元(MOP)</option>
                            <option value="NZD">新西兰元(NZD)</option>
                            <option value="SGD">新加坡元(SGD)</option>
                            <option value="CZK">捷克克朗(CZK)</option>
                            <option value="NOK">挪威克郎(NOK)</option>
                            <option value="DKK">丹麦克郎(DKK)</option>
                            <option value="DEM">德国马克(DEM)</option>
                            <option value="SEK">瑞典克朗(SEK)</option>
                            <option value="CHF">瑞士法郎(CHF)</option>
                            <option value="INR">印度卢比(INR)</option>
                            <option value="ITL">意大利里拉(ITL)</option>
                            <option value="AUD">澳大利亚元(AUD)</option>
                            <option value="PHP">菲律宾比索(PHP)</option>
                            <option value="BEF">比利时法郎(BEF)</option>
                            <option value="RUB">俄罗斯卢布(RUB)</option>
                            <option value="otherCode">———</option>
                            <option value="UGX">乌干达先令(UGX)</option>
                            <option value="RON">罗马尼亚新列伊(RON)</option>
                            <option value="TTD">特立尼达多巴哥元(TTD)</option>
                            <option value="SHP">圣赫勒拿群岛磅(SHP)</option>
                            <option value="KGS">吉尔吉斯斯坦索姆(KGS)</option>
                            <option value="DJF">吉布提法郎(DJF)</option>
                            <option value="BTN">不丹努扎姆(BTN)</option>
                            <option value="ZAR">南非兰特(ZAR)</option>
                            <option value="ILS">以色列新锡克尔(ILS)</option>
                            <option value="SYP">叙利亚磅(SYP)</option>
                            <option value="HTG">海地古德(HTG)</option>
                            <option value="YER">也门里亚尔(YER)</option>
                            <option value="UYU">乌拉圭比索(UYU)</option>
                            <option value="BBD">巴巴多斯元(BBD)</option>
                            <option value="XAU">盎司黄金(XAU)</option>
                            <option value="EEK">爱沙尼亚克鲁恩(EEK)</option>
                            <option value="FIM">芬兰马克(FIM)</option>
                            <option value="MWK">马拉维克瓦查(MWK)</option>
                            <option value="IDR">印尼盾(IDR)</option>
                            <option value="ROL">罗马尼亚列伊(ROL)</option>
                            <option value="PGK">巴布亚新几内亚基那(PGK)</option>
                            <option value="SIT">斯洛文尼亚托拉尔(SIT)</option>
                            <option value="XCD">格林纳达东加勒比元(XCD)</option>
                            <option value="RWF">卢旺达法郎(RWF)</option>
                            <option value="NGN">尼日利亚奈拉(NGN)</option>
                            <option value="TMM">土库曼斯坦马纳特(TMM)</option>
                            <option value="BSD">巴哈马元(BSD)</option>
                            <option value="HRK">克罗地亚库纳(HRK)</option>
                            <option value="COP">哥伦比亚比索(COP)</option>
                            <option value="GEL">乔治亚拉里(GEL)</option>
                            <option value="VUV">瓦努阿图瓦图(VUV)</option>
                            <option value="FJD">斐济元(FJD)</option>
                            <option value="MVR">马尔代夫罗非亚(MVR)</option>
                            <option value="AZN">阿塞拜疆曼纳特(AZN)</option>
                            <option value="MNT">蒙古图格里克(MNT)</option>
                            <option value="MGA">马达加斯加阿里亚里(MGA)</option>
                            <option value="IEP">爱尔兰镑(IEP)</option>
                            <option value="SRG">苏里南盾(SRG)</option>
                            <option value="KMF">科摩罗法郎(KMF)</option>
                            <option value="GNF">几内亚法郎(GNF)</option>
                            <option value="SBD">所罗门元(SBD)</option>
                            <option value="KWD">科威特第纳尔(KWD)</option>
                            <option value="BDT">孟加拉塔卡(BDT)</option>
                            <option value="VEB">委内瑞拉博利瓦(VEB)</option>
                            <option value="MMK">缅元(MMK)</option>
                            <option value="TRL">土耳其里拉(TRL)</option>
                            <option value="TJS">塔吉克斯坦索莫尼(TJS)</option>
                            <option value="JOD">约旦第纳尔(JOD)</option>
                            <option value="PAB">巴拿马巴波亚(PAB)</option>
                            <option value="MDL">摩尔多瓦列伊(MDL)</option>
                            <option value="CVE">佛得角埃斯库多(CVE)</option>
                            <option value="CLP">智利比索(CLP)</option>
                            <option value="KES">肯尼亚先令(KES)</option>
                            <option value="SRD">苏里南元(SRD)</option>
                            <option value="MUR">毛里求斯卢比(MUR)</option>
                            <option value="LRD">利比里亚元(LRD)</option>
                            <option value="SAR">沙特阿拉伯里亚尔(SAR)</option>
                            <option value="ARS">阿根廷比索(ARS)</option>
                            <option value="EGP">埃及镑(EGP)</option>
                            <option value="PYG">巴拉圭瓜尼(PYG)</option>
                            <option value="TRY">土耳其新里拉(TRY)</option>
                            <option value="CDF">刚果法郎(CDF)</option>
                            <option value="BMD">百慕大元(BMD)</option>
                            <option value="OMR">阿曼里亚尔(OMR)</option>
                            <option value="CUP">古巴比索(CUP)</option>
                            <option value="NIO">尼加拉瓜科多巴(NIO)</option>
                            <option value="GMD">冈比亚达拉西(GMD)</option>
                            <option value="SKK">斯洛伐克克朗(SKK)</option>
                            <option value="UZS">乌兹别克斯坦苏姆(UZS)</option>
                            <option value="ZMK">赞比亚克瓦查(ZMK)</option>
                            <option value="GTQ">危地马拉格查尔(GTQ)</option>
                            <option value="NPR">尼泊尔卢比(NPR)</option>
                            <option value="NAD">纳米比亚元(NAD)</option>
                            <option value="XEU">欧元（旧）(XEU)</option>
                            <option value="HUF">匈牙利福林(HUF)</option>
                            <option value="LAK">老挝基普(LAK)</option>
                            <option value="SZL">斯威士兰里兰吉尼(SZL)</option>
                            <option value="UDI">沙特阿拉伯里亚尔(UDI)</option>
                            <option value="MTL">马耳他里拉(MTL)</option>
                            <option value="BND">文莱币(BND)</option>
                            <option value="TZS">坦桑尼亚先令(TZS)</option>
                            <option value="SDG">苏丹镑(SDG)</option>
                            <option value="LSL">莱索托洛蒂(LSL)</option>
                            <option value="KYD">开曼群岛币(KYD)</option>
                            <option value="LKR">斯里兰卡卢比(LKR)</option>
                            <option value="MKD">马其顿第纳尔(MKD)</option>
                            <option value="MXN">墨西哥比索(MXN)</option>
                            <option value="GHC">加纳塞第(GHC)</option>
                            <option value="ISK">冰岛克郎(ISK)</option>
                            <option value="LYD">利比亚第纳尔(LYD)</option>
                            <option value="SLL">塞拉里昂利昂(SLL)</option>
                            <option value="PKR">巴基斯坦卢比(PKR)</option>
                            <option value="ANG">安第列斯群岛盾(ANG)</option>
                            <option value="SCR">塞舌尔卢比(SCR)</option>
                            <option value="ATS">奥地利先令(ATS)</option>
                            <option value="LBP">黎巴嫩镑(LBP)</option>
                            <option value="AED">阿联酋迪拉姆(AED)</option>
                            <option value="GHS">新加纳塞第(GHS)</option>
                            <option value="BOB">玻利维亚币(BOB)</option>
                            <option value="ERN">厄立特里亚纳克法(ERN)</option>
                            <option value="GIP">直布罗陀镑(GIP)</option>
                            <option value="QAR">卡塔尔里亚尔(QAR)</option>
                            <option value="BHD">巴林第纳尔(BHD)</option>
                            <option value="IRR">伊朗里亚尔(IRR)</option>
                            <option value="BWP">博茨瓦纳普拉(BWP)</option>
                            <option value="HNL">洪都拉斯伦皮拉(HNL)</option>
                            <option value="ALL">阿尔巴尼亚列克(ALL)</option>
                            <option value="RSD">赛尔维亚第纳尔(RSD)</option>
                            <option value="MYR">马来西亚林吉特(MYR)</option>
                            <option value="ETB">埃塞俄比亚比尔(ETB)</option>
                            <option value="STD">圣多美和普林西比多布拉(STD)</option>
                            <option value="ADP">安道尔西班牙银币(ADP)</option>
                            <option value="BGN">保加利亚列弗(BGN)</option>
                            <option value="DOP">多米尼加比索(DOP)</option>
                            <option value="AMD">亚美尼亚打兰(AMD)</option>
                            <option value="XPF">法国太平洋法郎(XPF)</option>
                            <option value="SDR">特别提款权(SDR)</option>
                            <option value="JMD">牙买加元(JMD)</option>
                            <option value="MRO">毛里塔尼亚乌吉亚(MRO)</option>
                            <option value="ESP">加那利群岛比塞塔(ESP)</option>
                            <option value="ZWD">津巴布韦元(ZWD)</option>
                            <option value="LVL">拉脱维亚拉茨(LVL)</option>
                            <option value="BIF">布隆迪法郎(BIF)</option>
                            <option value="FRF">马提尼克法郎(FRF)</option>
                            <option value="TND">突尼斯第纳尔(TND)</option>
                            <option value="ECS">厄瓜多尔苏克雷(ECS)</option>
                            <option value="VND">越南盾(VND)</option>
                            <option value="GRD">希腊德拉克马(GRD)</option>
                            <option value="PEN">秘鲁新索尔(PEN)</option>
                            <option value="DZD">阿尔及利亚第纳尔(DZD)</option>
                            <option value="MZN">莫桑比克梅蒂卡尔(MZN)</option>
                            <option value="AWG">阿鲁巴弗罗林(AWG)</option>
                            <option value="MZM">莫桑比克美提卡(MZM)</option>
                            <option value="XOF">多哥非共体法郎(XOF)</option>
                            <option value="PTE">葡萄牙埃斯库多(PTE)</option>
                            <option value="KZT">哈萨克斯坦坚戈(KZT)</option>
                            <option value="UAH">乌克兰赫夫米(UAH)</option>
                            <option value="BZD">伯利兹元(BZD)</option>
                            <option value="BAM">波斯尼亚(BAM)</option>
                            <option value="MAD">摩洛哥迪拉姆(MAD)</option>
                            <option value="BYR">白俄罗斯卢布(BYR)</option>
                            <option value="LTL">立陶宛立特(LTL)</option>
                            <option value="KHR">柬埔寨瑞尔(KHR)</option>
                            <option value="XAF">西非法郎(XAF)</option>
                            <option value="CYP">塞浦路斯镑(CYP)</option>
                            <option value="GYD">圭亚那元(GYD)</option>
                            <option value="BRL">巴西雷亚尔(BRL)</option>
                            <option value="AFN">阿富汗尼(AFN)</option>
                            <option value="CRC">哥斯达黎加科朗(CRC)</option>
                            <option value="SVC">萨尔瓦多科朗(SVC)</option>
                            <option value="IQD">伊拉克第纳尔(IQD)</option>
                            <option value="PLN">波兰兹罗提(PLN)</option>
                            <option value="SOS">索马里先令(SOS)</option>
                            <option value="TOP">汤加潘加(TOP)</option>
                            <option value="AOA">安哥拉宽扎(AOA)</option>
                            <option value="LUF">卢森堡法郎(LUF)</option>
                            <option value="KPW">朝鲜元(KPW)</option>
                          </select>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr>
                        <td><strong>兑换结果:</strong></td>
                        <td><span>&nbsp;&nbsp;&nbsp;</span></td>
                        <td><h5><input class="form-control" type="text" disabled="disabled" id="result"></h5></td>
                    </tr>
                    <tr>
			<td colspan=2></td>
                        <td><button class="btn btn-primary" id="calculate" type="submit">开始计算</button></td>
                    </tr>
                    <tr><td><p><br></p></td></tr>
                    <tr align='center'>
                        <td colspan=3><h5><label id="rate" style="color:#1C81C7"><h5></label></td>
                    </tr>
                </tbody>
          </table>
    </div>
</div>

<script type="text/javascript">
$(function(){
        $("#calculate").click(function() {
            // alert($("#value").val());
            var amount = $("#amount").val();
            var route = $("#finance-currency_convertor").attr('href');
            var appid = $("#finance-currency_convertor").attr('appid');
            if (amount == "" || isNaN(amount)) {
                alert("请输入正确的数字");
                return;
            } else {

                from_tkc = $("#from_tkc").val()
                to_tkc = $("#to_tkc").val()
				$("#result").val("")
                var post_data = {app_id: appid, amount:amount, from_tkc:from_tkc, to_tkc:to_tkc}
                $("#rate").text("正在查询最新汇率信息...");
		$("#calculate").attr("disabled", "disabled");
		$.post(route, post_data, function(data){
                    var response = eval('(' + data + ')');
                    try
                    {
                        rate = response['rate']
                        time = response['time']
                        rate_des = '1' + $("#from_tkc").find("option:selected").text() + " = " + rate + " " + $("#to_tkc").find("option:selected").text()  + " " + time
                        $("#rate").text(rate_des)
                        $("#result").val(parseFloat(response['result']).toFixed(2));
                    }
                    catch(e)
                    {
                     	//alert(e.name + ": " + e.message);
			$("#rate").text("查询失败，请稍后重新查询")
                    }
                });
	      $("#calculate").removeAttr("disabled");
            }
        });
    });
</script>
{% endblock %}
