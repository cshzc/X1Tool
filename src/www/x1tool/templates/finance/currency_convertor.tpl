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
						<td><input class="form-control" type="text" id="amount" value=1></td>
					</tr>
					<tr><td><br/></td></tr>
					<tr>
						<td><strong>持有货币:</strong></td>
						<td><span>&nbsp;&nbsp;&nbsp;</span></td>
						<td>
							<select name="from_tkc" id="from_tkc" class="form-control">
							<optgroup style="color:#000;background-color:#fff" label=常用货币>
								<option value=CNY>人民币 Chinese Yuan Renminbi . CNY</option>
								<option value=HKD>港元 Hong Kong Dollar . HKD</option>
								<option value=TWD>台币 Taiwan Dollar . TWD</option>
								<option value=EUR>欧元 Euro . EUR</option>
								<option value=USD selected="selected" >美元 US Dollar . USD</option>
								<option value=GBP>英镑 British Pound . GBP</option>
								<option value=AUD>澳元 Australian Dollar . AUD</option>
								<option value=KRW>韩元 South-Korean Won . KRW</option>
								<option value=JPY>日元 Japanese Yen . JPY</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=A>
								<option value=ALL>阿尔巴尼亚列克 Albanian Lek . ALL</option>
								<option value=DZD>阿尔及利亚第纳尔 Algerian Dinar . DZD</option>
								<option value=ARS>阿根廷比索 Argentine Peso . ARS</option>
								<option value=AWG>阿鲁巴岛弗罗林 Aruba Florin . AWG</option>
								<option value=AUD>澳元 Australian Dollar . AUD</option>
								<option value=EGP>埃及镑 Egyptian Pound . EGP</option>
								<option value=ETB>埃塞俄比亚比尔 Ethiopian Birr . ETB</option>
								<option value=MOP>澳门元 Macau Pataca . MOP</option>
								<option value=OMR>阿曼里亚尔 Omani Rial . OMR</option>
								<option value=AED>阿联酋迪拉姆 UAE Dirham . AED</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=B>
								<option value=BSD>巴哈马元 Bahamian Dollar . BSD</option>
								<option value=BHD>巴林第纳尔 Bahraini Dinar . BHD</option>
								<option value=BBD>巴巴多斯元 Barbados Dollar . BBD</option>
								<option value=BYR>白俄罗斯卢布 Belarus Ruble . BYR</option>
								<option value=BZD>伯利兹元 Belize Dollar . BZD</option>
								<option value=BMD>百慕大元 Bermuda Dollar . BMD</option>
								<option value=BTN>不丹卢比 Bhutan Ngultrum . BTN</option>
								<option value=BOB>玻利维亚诺 Bolivian Boliviano . BOB</option>
								<option value=BWP>博茨瓦纳普拉 Botswana Pula . BWP</option>
								<option value=BRL>巴西里亚伊 Brazilian Real . BRL</option>
								<option value=BGN>保加利亚列瓦 Bulgarian Lev . BGN</option>
								<option value=BIF>布隆迪法郎 Burundi Franc . BIF</option>
								<option value=ISK>冰岛克朗 Iceland Krona . ISK</option>
								<option value=PKR>巴基斯坦卢比 Pakistani Rupee . PKR</option>
								<option value=PAB>巴拿马巴尔博亚 Panama Balboa . PAB</option>
								<option value=PGK>巴布亚新几内亚基那 Papua New Guinea Kina . PGK</option>
								<option value=PYG>巴拉圭瓜拉尼 Paraguayan Guarani . PYG</option>
								<option value=PLN>波兰兹罗提 Polish Zloty . PLN</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=C>
								<option value=KPW>朝鲜圆 North Korean Won . KPW</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=D>
								<option value=XOF>多哥非洲共同体法郎 CFA Franc BCEAO . XOF</option>
								<option value=DKK>丹麦克朗 Danish Krone . DKK</option>
								<option value=DOP>多米尼加比索 Dominican Peso . DOP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=E>
								<option value=RUB>俄罗斯卢布 Russian Rouble . RUB</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=F>
								<option value=CVE>佛得角埃斯库多 Cape Verde Escudo . CVE</option>
								<option value=FKP>福克兰群岛镑 Falkland Islands Pound . FKP</option>
								<option value=FJD>斐济元 Fiji Dollar . FJD</option>
								<option value=PHP>菲律宾比索 Philippine Peso . PHP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=G>
								<option value=XAF>刚果中非共同体法郎 CFA Franc BEAC . XAF</option>
								<option value=COP>哥伦比亚比索 Colombian Peso . COP</option>
								<option value=CRC>哥斯达黎加科朗 Costa Rica Colon . CRC</option>
								<option value=CUP>古巴比索 Cuban Peso . CUP</option>
								<option value=XCD>格林纳达东加勒比元 East Caribbean Dollar . XCD</option>
								<option value=GMD>冈比亚达拉西 Gambian Dalasi . GMD</option>
								<option value=GYD>圭亚那元 Guyana Dollar . GYD</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=H>
								<option value=HTG>海地古德 Haiti Gourde . HTG</option>
								<option value=HNL>洪都拉斯伦皮拉 Honduras Lempira . HNL</option>
								<option value=KZT>哈萨克斯坦腾格 Kazakhstan Tenge . KZT</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=J>
								<option value=KHR>柬埔寨利尔斯 Cambodia Riel . KHR</option>
								<option value=CAD>加拿大元 Canadian Dollar . CAD</option>
								<option value=CZK>捷克克朗 Czech Koruna . CZK</option>
								<option value=DJF>吉布提法郎 Dijibouti Franc . DJF</option>
								<option value=GNF>几内亚法郎 Guinea Franc . GNF</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=K>
								<option value=KMF>科摩罗法郎 Comoros Franc . KMF</option>
								<option value=HRK>克罗地亚库纳 Croatian Kuna . HRK</option>
								<option value=KES>肯尼亚先令 Kenyan Shilling . KES</option>
								<option value=KWD>科威特第纳尔 Kuwaiti Dinar . KWD</option>
								<option value=QAR>卡塔尔利尔 Qatar Rial . QAR</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=L>
								<option value=LAK>老挝基普 Lao Kip . LAK</option>
								<option value=LVL>拉脱维亚拉图 Latvian Lats . LVL</option>
								<option value=LBP>黎巴嫩镑 Lebanese Pound . LBP</option>
								<option value=LSL>莱索托洛提 Lesotho Loti . LSL</option>
								<option value=LRD>利比里亚元 Liberian Dollar . LRD</option>
								<option value=LYD>利比亚第纳尔 Libyan Dinar . LYD</option>
								<option value=LTL>立陶宛里塔斯 Lithuanian Litas . LTL</option>
								<option value=ANG>列斯荷兰盾 Neth Antilles Guilder . ANG</option>
								<option value=RON>罗马尼亚新列伊 Romanian New Leu . RON</option>
								<option value=RWF>卢旺达法郎 Rwanda Franc . RWF</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=M>
								<option value=BDT>孟加拉塔卡 Bangladesh Taka . BDT</option>
								<option value=MKD>马其顿第纳尔 Macedonian Denar . MKD</option>
								<option value=MWK>马拉维克瓦查 Malawi Kwacha . MWK</option>
								<option value=MYR>马来西亚林吉特 Malaysian Ringgit . MYR</option>
								<option value=MVR>马尔代夫卢非亚 Maldives Rufiyaa . MVR</option>
								<option value=MRO>毛里塔尼亚乌吉亚 Mauritania Ougulya . MRO</option>
								<option value=MUR>毛里求斯卢比 Mauritius Rupee . MUR</option>
								<option value=MXN>墨西哥比索 Mexican Peso . MXN</option>
								<option value=MDL>摩尔多瓦列伊 Moldovan Leu . MDL</option>
								<option value=MNT>蒙古图格里克 Mongolian Tugrik . MNT</option>
								<option value=MAD>摩洛哥道拉姆 Moroccan Dirham . MAD</option>
								<option value=MMK>缅甸元 Myanmar Kyat . MMK</option>
								<option value=PEN>秘鲁索尔 Peruvian Nuevo Sol . PEN</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=N>
								<option value=NAD>纳米比亚元 Namibian Dollar . NAD</option>
								<option value=NPR>尼泊尔卢比 Nepalese Rupee . NPR</option>
								<option value=NIO>尼加拉瓜科多巴 Nicaragua Cordoba . NIO</option>
								<option value=NGN>尼日利亚奈拉 Nigerian Naira . NGN</option>
								<option value=NOK>挪威克朗 Norwegian Kroner . NOK</option>
								<option value=ZAR>南非兰特 South African Rand . ZAR</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=R>
								<option value=SEK>瑞典克朗 Swedish Krona . SEK</option>
								<option value=CHF>瑞士法郎 Swiss Franc . CHF</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=S>
								<option value=SVC>萨尔瓦多科朗 El Salvador Colon . SVC</option>
								<option value=WST>萨摩亚塔拉 Samoa Tala . WST</option>
								<option value=STD>圣多美多布拉 Sao Tome Dobra . STD</option>
								<option value=SAR>沙特阿拉伯里亚尔 Saudi Arabian Riyal . SAR</option>
								<option value=SCR>塞舌尔法郎 Seychelles Rupee . SCR</option>
								<option value=SLL>塞拉利昂利昂 Sierra Leone Leone . SLL</option>
								<option value=SBD>所罗门群岛元 Solomon Islands Dollar . SBD</option>
								<option value=SOS>索马里先令 Somali Shilling . SOS</option>
								<option value=LKR>斯里兰卡卢比 Sri Lanka Rupee . LKR</option>
								<option value=SHP>圣赫勒拿群岛磅 St Helena Pound . SHP</option>
								<option value=SZL>斯威士兰里兰吉尼 Swaziland Lilageni . SZL</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=T>
								<option value=TRY>土耳其新里拉 New Turkish Lira . TRY</option>
								<option value=XPF>太平洋法郎 Pacific Franc . XPF</option>
								<option value=TZS>坦桑尼亚先令 Tanzanian Shilling . TZS</option>
								<option value=THB>泰国铢 Thai Baht . THB</option>
								<option value=TOP>汤加潘加 Tonga Pa'anga . TOP</option>
								<option value=TTD>特立尼达和多巴哥元 Trinidad&Tobago Dollar . TTD</option>
								<option value=TND>突尼斯第纳尔 Tunisian Dinar . TND</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=W>
								<option value=BND>文莱元 Brunei Dollar . BND</option>
								<option value=GTQ>危地马拉格查尔 Guatemala Quetzal . GTQ</option>
								<option value=UAH>乌克兰赫夫米 Ukraine Hryvnia . UAH</option>
								<option value=UYU>乌拉圭新比索 Uruguayan New Peso . UYU</option>
								<option value=VUV>瓦努阿图瓦图 Vanuatu Vatu . VUV</option>
								<option value=VND>越南盾 Vietnam Dong . VND</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=X>
								<option value=HUF>匈牙利福林 Hungarian Forint . HUF</option>
								<option value=NZD>新西兰元 New Zealand Dollar . NZD</option>
								<option value=SGD>新加坡元 Singapore Dollar . SGD</option>
								<option value=SYP>叙利亚镑 Syrian Pound . SYP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=Y>
								<option value=INR>印度卢比 Indian Rupee . INR</option>
								<option value=IDR>印度尼西亚卢比(盾) Indonesian Rupiah . IDR</option>
								<option value=IRR>伊朗里亚尔 Iran Rial . IRR</option>
								<option value=IQD>伊拉克第纳尔 Iraqi Dinar . IQD</option>
								<option value=ILS>以色列镑 Israeli Shekel . ILS</option>
								<option value=JMD>牙买加元 Jamaican Dollar . JMD</option>
								<option value=JOD>约旦第纳尔 Jordanian Dinar . JOD</option>
								<option value=YER>也门里亚尔 Yemen Riyal . YER</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=Z>
								<option value=CLP>智利比索 Chilean Peso . CLP</option>
								<option value=GIP>直布罗陀镑 Gibraltar Pound . GIP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=贵金属>
								<option value=XCP>铜价盎司 Copper Ounces . XCP</option>
								<option value=XAU>金价盎司 Gold Ounces . XAU</option>
								<option value=XPD>钯价盎司 Palladium Ounces . XPD</option>
								<option value=XPT>铂价盎司 Platinum Ounces . XPT</option>
								<option value=XAG>银价盎司 Silver Ounces . XAG</option>
							</optgroup>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan=3></td>
						<td align='center'>
							<p class="fa fa-exchange" onclick="switchQ()"></p>
						</td>
					</tr>
					<tr>
						<td><strong>兑换货币:</strong></td>
						<td><span>&nbsp;&nbsp;&nbsp;</span></td>
						<td>
							<select name="to_tkc" id="to_tkc" class="form-control">
							<optgroup style="color:#000;background-color:#fff" label=常用货币>
								<option value=CNY selected="selected">人民币 Chinese Yuan Renminbi . CNY</option>
								<option value=HKD>港元 Hong Kong Dollar . HKD</option>
								<option value=TWD>台币 Taiwan Dollar . TWD</option>
								<option value=EUR>欧元 Euro . EUR</option>
								<option value=USD>美元 US Dollar . USD</option>
								<option value=GBP>英镑 British Pound . GBP</option>
								<option value=AUD>澳元 Australian Dollar . AUD</option>
								<option value=KRW>韩元 South-Korean Won . KRW</option>
								<option value=JPY>日元 Japanese Yen . JPY</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=A>
								<option value=ALL>阿尔巴尼亚列克 Albanian Lek . ALL</option>
								<option value=DZD>阿尔及利亚第纳尔 Algerian Dinar . DZD</option>
								<option value=ARS>阿根廷比索 Argentine Peso . ARS</option>
								<option value=AWG>阿鲁巴岛弗罗林 Aruba Florin . AWG</option>
								<option value=AUD>澳元 Australian Dollar . AUD</option>
								<option value=EGP>埃及镑 Egyptian Pound . EGP</option>
								<option value=ETB>埃塞俄比亚比尔 Ethiopian Birr . ETB</option>
								<option value=MOP>澳门元 Macau Pataca . MOP</option>
								<option value=OMR>阿曼里亚尔 Omani Rial . OMR</option>
								<option value=AED>阿联酋迪拉姆 UAE Dirham . AED</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=B>
								<option value=BSD>巴哈马元 Bahamian Dollar . BSD</option>
								<option value=BHD>巴林第纳尔 Bahraini Dinar . BHD</option>
								<option value=BBD>巴巴多斯元 Barbados Dollar . BBD</option>
								<option value=BYR>白俄罗斯卢布 Belarus Ruble . BYR</option>
								<option value=BZD>伯利兹元 Belize Dollar . BZD</option>
								<option value=BMD>百慕大元 Bermuda Dollar . BMD</option>
								<option value=BTN>不丹卢比 Bhutan Ngultrum . BTN</option>
								<option value=BOB>玻利维亚诺 Bolivian Boliviano . BOB</option>
								<option value=BWP>博茨瓦纳普拉 Botswana Pula . BWP</option>
								<option value=BRL>巴西里亚伊 Brazilian Real . BRL</option>
								<option value=BGN>保加利亚列瓦 Bulgarian Lev . BGN</option>
								<option value=BIF>布隆迪法郎 Burundi Franc . BIF</option>
								<option value=ISK>冰岛克朗 Iceland Krona . ISK</option>
								<option value=PKR>巴基斯坦卢比 Pakistani Rupee . PKR</option>
								<option value=PAB>巴拿马巴尔博亚 Panama Balboa . PAB</option>
								<option value=PGK>巴布亚新几内亚基那 Papua New Guinea Kina . PGK</option>
								<option value=PYG>巴拉圭瓜拉尼 Paraguayan Guarani . PYG</option>
								<option value=PLN>波兰兹罗提 Polish Zloty . PLN</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=C>
								<option value=KPW>朝鲜圆 North Korean Won . KPW</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=D>
								<option value=XOF>多哥非洲共同体法郎 CFA Franc BCEAO . XOF</option>
								<option value=DKK>丹麦克朗 Danish Krone . DKK</option>
								<option value=DOP>多米尼加比索 Dominican Peso . DOP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=E>
								<option value=RUB>俄罗斯卢布 Russian Rouble . RUB</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=F>
								<option value=CVE>佛得角埃斯库多 Cape Verde Escudo . CVE</option>
								<option value=FKP>福克兰群岛镑 Falkland Islands Pound . FKP</option>
								<option value=FJD>斐济元 Fiji Dollar . FJD</option>
								<option value=PHP>菲律宾比索 Philippine Peso . PHP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=G>
								<option value=XAF>刚果中非共同体法郎 CFA Franc BEAC . XAF</option>
								<option value=COP>哥伦比亚比索 Colombian Peso . COP</option>
								<option value=CRC>哥斯达黎加科朗 Costa Rica Colon . CRC</option>
								<option value=CUP>古巴比索 Cuban Peso . CUP</option>
								<option value=XCD>格林纳达东加勒比元 East Caribbean Dollar . XCD</option>
								<option value=GMD>冈比亚达拉西 Gambian Dalasi . GMD</option>
								<option value=GYD>圭亚那元 Guyana Dollar . GYD</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=H>
								<option value=HTG>海地古德 Haiti Gourde . HTG</option>
								<option value=HNL>洪都拉斯伦皮拉 Honduras Lempira . HNL</option>
								<option value=KZT>哈萨克斯坦腾格 Kazakhstan Tenge . KZT</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=J>
								<option value=KHR>柬埔寨利尔斯 Cambodia Riel . KHR</option>
								<option value=CAD>加拿大元 Canadian Dollar . CAD</option>
								<option value=CZK>捷克克朗 Czech Koruna . CZK</option>
								<option value=DJF>吉布提法郎 Dijibouti Franc . DJF</option>
								<option value=GNF>几内亚法郎 Guinea Franc . GNF</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=K>
								<option value=KMF>科摩罗法郎 Comoros Franc . KMF</option>
								<option value=HRK>克罗地亚库纳 Croatian Kuna . HRK</option>
								<option value=KES>肯尼亚先令 Kenyan Shilling . KES</option>
								<option value=KWD>科威特第纳尔 Kuwaiti Dinar . KWD</option>
								<option value=QAR>卡塔尔利尔 Qatar Rial . QAR</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=L>
								<option value=LAK>老挝基普 Lao Kip . LAK</option>
								<option value=LVL>拉脱维亚拉图 Latvian Lats . LVL</option>
								<option value=LBP>黎巴嫩镑 Lebanese Pound . LBP</option>
								<option value=LSL>莱索托洛提 Lesotho Loti . LSL</option>
								<option value=LRD>利比里亚元 Liberian Dollar . LRD</option>
								<option value=LYD>利比亚第纳尔 Libyan Dinar . LYD</option>
								<option value=LTL>立陶宛里塔斯 Lithuanian Litas . LTL</option>
								<option value=ANG>列斯荷兰盾 Neth Antilles Guilder . ANG</option>
								<option value=RON>罗马尼亚新列伊 Romanian New Leu . RON</option>
								<option value=RWF>卢旺达法郎 Rwanda Franc . RWF</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=M>
								<option value=BDT>孟加拉塔卡 Bangladesh Taka . BDT</option>
								<option value=MKD>马其顿第纳尔 Macedonian Denar . MKD</option>
								<option value=MWK>马拉维克瓦查 Malawi Kwacha . MWK</option>
								<option value=MYR>马来西亚林吉特 Malaysian Ringgit . MYR</option>
								<option value=MVR>马尔代夫卢非亚 Maldives Rufiyaa . MVR</option>
								<option value=MRO>毛里塔尼亚乌吉亚 Mauritania Ougulya . MRO</option>
								<option value=MUR>毛里求斯卢比 Mauritius Rupee . MUR</option>
								<option value=MXN>墨西哥比索 Mexican Peso . MXN</option>
								<option value=MDL>摩尔多瓦列伊 Moldovan Leu . MDL</option>
								<option value=MNT>蒙古图格里克 Mongolian Tugrik . MNT</option>
								<option value=MAD>摩洛哥道拉姆 Moroccan Dirham . MAD</option>
								<option value=MMK>缅甸元 Myanmar Kyat . MMK</option>
								<option value=PEN>秘鲁索尔 Peruvian Nuevo Sol . PEN</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=N>
								<option value=NAD>纳米比亚元 Namibian Dollar . NAD</option>
								<option value=NPR>尼泊尔卢比 Nepalese Rupee . NPR</option>
								<option value=NIO>尼加拉瓜科多巴 Nicaragua Cordoba . NIO</option>
								<option value=NGN>尼日利亚奈拉 Nigerian Naira . NGN</option>
								<option value=NOK>挪威克朗 Norwegian Kroner . NOK</option>
								<option value=ZAR>南非兰特 South African Rand . ZAR</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=R>
								<option value=SEK>瑞典克朗 Swedish Krona . SEK</option>
								<option value=CHF>瑞士法郎 Swiss Franc . CHF</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=S>
								<option value=SVC>萨尔瓦多科朗 El Salvador Colon . SVC</option>
								<option value=WST>萨摩亚塔拉 Samoa Tala . WST</option>
								<option value=STD>圣多美多布拉 Sao Tome Dobra . STD</option>
								<option value=SAR>沙特阿拉伯里亚尔 Saudi Arabian Riyal . SAR</option>
								<option value=SCR>塞舌尔法郎 Seychelles Rupee . SCR</option>
								<option value=SLL>塞拉利昂利昂 Sierra Leone Leone . SLL</option>
								<option value=SBD>所罗门群岛元 Solomon Islands Dollar . SBD</option>
								<option value=SOS>索马里先令 Somali Shilling . SOS</option>
								<option value=LKR>斯里兰卡卢比 Sri Lanka Rupee . LKR</option>
								<option value=SHP>圣赫勒拿群岛磅 St Helena Pound . SHP</option>
								<option value=SZL>斯威士兰里兰吉尼 Swaziland Lilageni . SZL</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=T>
								<option value=TRY>土耳其新里拉 New Turkish Lira . TRY</option>
								<option value=XPF>太平洋法郎 Pacific Franc . XPF</option>
								<option value=TZS>坦桑尼亚先令 Tanzanian Shilling . TZS</option>
								<option value=THB>泰国铢 Thai Baht . THB</option>
								<option value=TOP>汤加潘加 Tonga Pa'anga . TOP</option>
								<option value=TTD>特立尼达和多巴哥元 Trinidad&Tobago Dollar . TTD</option>
								<option value=TND>突尼斯第纳尔 Tunisian Dinar . TND</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=W>
								<option value=BND>文莱元 Brunei Dollar . BND</option>
								<option value=GTQ>危地马拉格查尔 Guatemala Quetzal . GTQ</option>
								<option value=UAH>乌克兰赫夫米 Ukraine Hryvnia . UAH</option>
								<option value=UYU>乌拉圭新比索 Uruguayan New Peso . UYU</option>
								<option value=VUV>瓦努阿图瓦图 Vanuatu Vatu . VUV</option>
								<option value=VND>越南盾 Vietnam Dong . VND</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=X>
								<option value=HUF>匈牙利福林 Hungarian Forint . HUF</option>
								<option value=NZD>新西兰元 New Zealand Dollar . NZD</option>
								<option value=SGD>新加坡元 Singapore Dollar . SGD</option>
								<option value=SYP>叙利亚镑 Syrian Pound . SYP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=Y>
								<option value=INR>印度卢比 Indian Rupee . INR</option>
								<option value=IDR>印度尼西亚卢比(盾) Indonesian Rupiah . IDR</option>
								<option value=IRR>伊朗里亚尔 Iran Rial . IRR</option>
								<option value=IQD>伊拉克第纳尔 Iraqi Dinar . IQD</option>
								<option value=ILS>以色列镑 Israeli Shekel . ILS</option>
								<option value=JMD>牙买加元 Jamaican Dollar . JMD</option>
								<option value=JOD>约旦第纳尔 Jordanian Dinar . JOD</option>
								<option value=YER>也门里亚尔 Yemen Riyal . YER</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=Z>
								<option value=CLP>智利比索 Chilean Peso . CLP</option>
								<option value=GIP>直布罗陀镑 Gibraltar Pound . GIP</option>
							</optgroup>
							<optgroup style="color:#000;background-color:#fff" label=贵金属>
								<option value=XCP>铜价盎司 Copper Ounces . XCP</option>
								<option value=XAU>金价盎司 Gold Ounces . XAU</option>
								<option value=XPD>钯价盎司 Palladium Ounces . XPD</option>
								<option value=XPT>铂价盎司 Platinum Ounces . XPT</option>
								<option value=XAG>银价盎司 Silver Ounces . XAG</option>
							</optgroup>
							</select>
						</td>
					</tr>
					<tr><td><br/></td></tr>
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
						<td colspan=4><h5><label id="rate" style="color:#1C81C7"></label><br/><small><label id="update_time"></label></small><h5></td>
					</tr>
					<tr><td><p><br></p></td></tr>
					<tr align='center'>
						<td colspan=4><strong><span id="trend_title"></span></strong></td>
					</tr>
					<tr align='right'>
						<td colspan=4><img src="" id="trend_img" style="display:none;"/></td>
					</tr>
				</tbody>
		  </table>
    </div>
</div>

<script type="text/javascript">
function switchQ(){
	var i = document.getElementById("from_tkc").selectedIndex;
	var j = document.getElementById("to_tkc").selectedIndex;

	document.getElementById("from_tkc").selectedIndex = j;
	document.getElementById("to_tkc").selectedIndex = i;

}

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
				$("#update_time").text("");
				$("#trend_img").attr("style", "display:none;");
				$("#trend_title").text("");
				$("#calculate").attr("disabled", "disabled");
				$.post(route, post_data, function(data){
					rate = null;
					time = null;
					try
					{
						var response = eval('(' + data + ')');
						rate = response['rate'];
						time = Date(response['time']);
					}
					catch(e)
					{
						//alert(e.name + ": " + e.message);
					}
					
					if (rate)
					{
						var from = $("#from_tkc").find("option:selected").text().split(".")[0];
						var to = $("#to_tkc").find("option:selected").text().split(".")[0];
						var rate_des = '1' + from + " = " + rate + " " + to;
						$("#rate").text(rate_des)
						if (time){
							$("#update_time").text(time.toLocaleString())
						}
						$("#result").val(parseFloat(response['result']).toFixed(2));
						
						var trend_title = "年度汇率走势图";
						$("#trend_title").text(trend_title);
						var img_src = "http://ichart.finance.yahoo.com/1y?" + from_tkc + to_tkc + "=x&lang=zh-Hant-HK";
						$("#trend_img").attr("src", img_src);
						$("#trend_img").removeAttr("style");
					}
					else
					{
						$("#rate").text("查询失败，请稍后重新查询")
						$("#update_time").text(Date().toLocaleString())
					}
					
					$("#calculate").removeAttr("disabled");
				});
            }
        });
    });
</script>
{% endblock %}
