<div class="dropdown pull-right">
    <a id="comments" class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="true" style="color:#F0AD4E">
        <i class="fa fa-send-o fa-fw"></i> <b>神回复</b> <i class="fa fa-caret-down"></i>
    </a>
    <ul class="dropdown-menu" style="width:360px; max-height:360px; overflow-y:scroll">
        <div class="panel-heading">
            <div class="input-group">
                <input id="btn-input" type="text" class="form-control input-sm" placeholder="说说您的看法">
                <span class="input-group-btn">
                    <button class="btn btn-warning btn-sm" id="btn-submit">发布</button>
                </span>
            </div>
        </div>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".dropdown-menu").click(function(e) {
            e.stopPropagation();
        });

        $("#comments").click(function() {
            // Load comments
            $(".dropdown-menu").append('<div id="loading_progress"><img src="/static/img/loading.gif" width="5%" style="clear:both;display:block;margin:auto"><p style="text-align:center">拼命加载...</p></div>')
            // POST
            $.post("/comments/get/", {app_id: appid}, function(data){
                var response = eval('(' + data + ')');
                // Process the response data and fill the table
                // Remove progress circle
                $("#loading_progress").remove();
                $(".dropdown-menu li").remove();
                $(".dropdown-menu p").remove();
                if (data == '{}') {
                    $(".dropdown-menu").append('<p style="text-align:center">少年，沙发就在你眼前。</p>')
                } else {
                    $.each(response, function (index, item) {
                        $(".dropdown-menu").append('\
                            <li class="divider"></li>\
                            <li>\
                                <a href="#">\
                                    <div>\
                                        <strong>' + item[0] + '</strong>\
                                        <small class="pull-right text-muted">\
                                            <i class="fa fa-clock-o fa-fw"></i> ' + item[1] + '\
                                        </small>\
                                    </div>\
                                    <div>' + item[2] + '</div>\
                                </a>\
                            </li>');
                    });
                }
                
            });
        });

        $("#btn-submit").click(function () {
            // Submit comment
            comment_input = $("#btn-input").val();
            $(".dropdown-menu").append('<div id="loading_progress"><img src="/static/img/loading.gif" width="5%" style="clear:both;display:block;margin:auto"><p style="text-align:center">发布中...</p></div>')
            $.post("/comments/add/", {app_id: appid, comment: comment_input}, function(data){
                var response = eval('(' + data + ')');
                // Process the response data and fill the table
                // Remove progress circle
                $("#loading_progress").remove();
                $(".dropdown-menu li").remove();
                $(".dropdown-menu p").remove();
                if (data == '{}') {
                    $(".dropdown-menu").append('<p style="text-align:center">Oops，没提交成功。再试试？</p>')
                } else {
                    $.each(response, function (index, item) {
                        $(".dropdown-menu").append('\
                            <li class="divider"></li>\
                            <li>\
                                <a href="#">\
                                    <div>\
                                        <strong>' + item[0] + '</strong>\
                                        <small class="pull-right text-muted">\
                                            <i class="fa fa-clock-o fa-fw"></i> ' + item[1] + '\
                                        </small>\
                                    </div>\
                                    <div>' + item[2] + '</div>\
                                </a>\
                            </li>');
                    });
                    $("#btn-input").val("");
                }
                
            });
        });

    });
    
</script>

