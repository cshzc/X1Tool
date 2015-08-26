{% extends "base.tpl" %}
{% block content %}
<br/>
<div>
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">精选</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-desktop fa-3x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"></div>
                            <div>二维码生成器</div>
                        </div>
                    </div>
                </div>
                <a href="/programmer/qrcode">
                    <div class="panel-footer">
                        <span class="pull-left">立刻前往</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-coffee fa-3x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"></div>
                            <div>快递查询</div>
                        </div>
                    </div>
                </div>
                <a href="/life/express">
                    <div class="panel-footer">
                        <span class="pull-left">立刻前往</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-bank fa-3x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge"></div>
                            <div>个税计算器</div>
                        </div>
                    </div>
                </div>
                <a href="/finance/income_tax">
                    <div class="panel-footer">
                        <span class="pull-left">立刻前往</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(function(){   
    console.log('联系我们: x1tool@163.com');
});
</script>
{% endblock %}