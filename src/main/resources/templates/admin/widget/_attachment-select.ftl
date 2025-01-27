<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/toast/css/jquery.toast.min.css">
    <link rel="stylesheet" href="/static/plugins/fileinput/fileinput.min.css">
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
</head>
<body>
<div class="container-fluid">
    <section class="content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#allAttach" data-toggle="tab">所有附件</a>
                </li>
                <li>
                    <a href="#uploadAttach" data-toggle="tab">选择上传</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="allAttach">
                    <div class="row">
                        <#list attachments.content as attachment>
                            <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 div-thumbnail">
                                <a href="#" class="thumbnail" onclick="doTransport('${attachment.attachPath}')">
                                    <img src="${attachment.attachSmallPath}" class="img-responsive">
                                </a>
                            </div>
                        </#list>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="no-margin pull-left">
                                第${attachments.number+1}/${attachments.totalPages}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a class="btn btn-sm <#if !attachments.hasPrevious()>disabled</#if>" href="/admin/attachments/select" >首页</a> </li>
                                <li><a class="btn btn-sm <#if !attachments.hasPrevious()>disabled</#if>" href="/admin/attachments/select?page=${attachments.number-1}" >上页</a></li>
                                <li><a class="btn btn-sm <#if !attachments.hasNext()>disabled</#if>" href="/admin/attachments/select?page=${attachments.number+1}">下页</a></li>
                                <li><a class="btn btn-sm <#if !attachments.hasNext()>disabled</#if>" href="/admin/attachments/select?page=${attachments.totalPages-1}">尾页</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="uploadAttach">
                    <div class="row" id="uploadForm">
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="file-loading">
                                    <input id="uploadImg" class="file-loading" type="file" multiple name="file">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
<script src="/static/plugins/jquery/jquery.min.js"></script>
<script src="/static/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/plugins/fileinput/fileinput.min.js"></script>
<script src="/static/plugins/fileinput/zh.min.js"></script>
<script>
    $('#uploadImg').fileinput({
        language: 'zh',
        uploadUrl: '/admin/attachments/upload',
        uploadAsync: true,
        allowedFileExtensions: ['jpg','gif','png'],
        maxFileCount: 10,
        enctype : 'multipart/form-data',
        showClose: false
    });
    function doTransport(url) {
        parent.$('.selectData').val(url);
        parent.layer.closeAll();
    }
</script>
</html>