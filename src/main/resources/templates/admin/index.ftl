<#include "module/_macro.ftl">
<@head title="Halo后台管理"></@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <link rel="stylesheet" href="/static/plugins/toast/css/jquery.toast.min.css">
        <style type="text/css" rel="stylesheet">
            #btnWidgetsOption{margin-left:4px;padding:3px 6px;position:relative;top:-4px;border:1px solid #ccc;border-radius:2px;background:#fff;text-shadow:none;font-weight:600;font-size:12px;line-height:normal;color:#3c8dbc;cursor:pointer;transition:all .2s ease-in-out}
            #btnWidgetsOption:hover{background:#3c8dbc;color:#fff}
            .form-horizontal .control-label{
                text-align: left;
            }
        </style>
        <section class="content-header">
            <h1 style="display: inline-block;">仪表盘</h1>
            <a id="btnWidgetsOption" href="#">
                部件选项
            </a>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li class="active">仪表盘</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-12 col-xs-12" id="widgetOptionsPanel" style="display: none">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">部件选项</h3>
                        </div>
                        <form class="form-horizontal" id="widgetsOption">
                            <div class="box-body">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="widgetPostCount" class="col-sm-4 control-label">文章总数：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_postcount" id="widgetPostCount" value="true" ${((options.widget_postcount?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_postcount" id="widgetPostCount" value="false" ${((options.widget_postcount?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetCommentCount" class="col-sm-4 control-label">评论总数：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_commentcount" id="widgetCommentCount" value="true" ${((options.widget_commentcount?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_commentcount" id="widgetCommentCount" value="false" ${((options.widget_commentcount?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetAttachmentCount" class="col-sm-4 control-label">附件总数：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_attachmentcount" id="widgetAttachmentCount" value="true" ${((options.widget_attachmentcount?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_attachmentcount" id="widgetAttachmentCount" value="false" ${((options.widget_attachmentcount?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetVisitorCount" class="col-sm-4 control-label">访客总数：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_visitorcount" id="widgetVisitorCount" value="true" ${((options.widget_visitorcount?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_visitorcount" id="widgetVisitorCount" value="false" ${((options.widget_visitorcount?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="widgetPostLastest" class="col-sm-4 control-label">最新文章：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_postlastest" id="widgetPostLastest" value="true" ${((options.widget_postlastest?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_postlastest" id="widgetPostLastest" value="false" ${((options.widget_postlastest?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetCommentLastest" class="col-sm-4 control-label">最新评论：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_commentlastest" id="widgetCommentLastest" value="true" ${((options.widget_commentlastest?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_commentlastest" id="widgetCommentLastest" value="false" ${((options.widget_commentlastest?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="widgetLogsLastest" class="col-sm-4 control-label">最新日志：</label>
                                        <div class="col-sm-8">
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_logslastest" id="widgetLogsLastest" value="true" ${((options.widget_logslastest?if_exists)=='true')?string('checked','')}> 显示
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="widget_logslastest" id="widgetLogsLastest" value="false" ${((options.widget_logslastest?if_exists)=='false')?string('checked','')}> 隐藏
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-info pull-right" onclick="saveOptions('widgetsOption')">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
                <#if options.widget_postcount?default("true")=="true">
                <div class="col-lg-3 col-xs-6" id="widgetPostCountBody">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner"><h3>${postCount?default(0)}</h3><p>文章</p></div>
                        <div class="icon"><i class="ion ion-bag"></i></div>
                        <a href="/admin/posts" class="small-box-footer">查看所有 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                </#if>
                <#if options.widget_commentcount?default("true")=="true">
                <div class="col-lg-3 col-xs-6" id="widgetCommentCountBody">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner"><h3>53</h3><p>评论</p></div>
                        <div class="icon"><i class="ion ion-stats-bars"></i></div>
                        <a href="#" class="small-box-footer">查看所有 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                </#if>
                <!-- ./col -->
                <#if options.widget_attachmentcount?default("true")=="true">
                <div class="col-lg-3 col-xs-6" id="widgetAttachmentCountBody">
                    <!-- small box -->
                    <div class="small-box bg-yellow">
                        <div class="inner"><h3>${mediaCount?default(0)}</h3><p>媒体库</p></div>
                        <div class="icon"><i class="ion ion-person-add"></i></div>
                        <a href="/admin/attachments" class="small-box-footer">上传图片<i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                </#if>
                <!-- ./col -->
                <#if options.widget_visitorcount?default("true")=="true">
                <div class="col-lg-3 col-xs-6" id="widgetVisitorCountBody">
                    <!-- small box -->
                    <div class="small-box bg-red">
                        <div class="inner"><h3>65</h3><p>今日访客</p></div>
                        <div class="icon"><i class="ion ion-pie-graph"></i></div>
                        <a href="#" class="small-box-footer">清空数据 <i class="fa fa-arrow-circle-right"></i></a>
                    </div>
                </div>
                </#if>
                <!-- ./col -->
            </div>

            <div class="row">
                <#if options.widget_postlastest?default("true")=="true">
                <div class="col-lg-6 col-xs-12" id="widgetPostLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新文章</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <tbody>
                                    <#if postTopFive??>
                                        <tr>
                                            <#list postTopFive as post>
                                                <tr>
                                                    <td><a target="_blank" href="/admin/posts/view?postId=${post.postId}">${post.postTitle}</a></td>
                                                    <td class="text-center">
                                                        <#if post.postStatus==0>
                                                            <span class="label bg-green">已发布</span>
                                                        <#elseif post.postStatus==1>
                                                            <span class="label bg-yellow">草&emsp;稿</span>
                                                        <#else>
                                                            <span class="label bg-red">回收站</span>
                                                        </#if>
                                                    </td>
                                                    <td>${post.postDate?if_exists?string("yyyy-MM-dd HH:mm")}</td>
                                                </tr>
                                            </#list>
                                        </tr>
                                    <#else>
                                        <tr><td>暂无数据</td></tr>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </#if>
                <#if options.widget_commentlastest?default("true")=="true">
                <div class="col-lg-6 col-xs-12" id="widgetCommentLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新评论</h3>
                            <div class="box-tools">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <tbody>
                                <tr><th>暂无数据</th></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </#if>
                <#if options.widget_logslastest?default("true")=="true">
                <div class="col-lg-6 col-xs-12" id="widgetLogsLastestBody">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">最新日志</h3>
                            <div class="box-tools">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-bars"></i></button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#" onclick="openAllLogs()">查看所有</a></li>
                                        <li><a href="/admin/logs/clear">清空日志</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <th>事件</th>
                                    <th>结果</th>
                                    <th>IP</th>
                                    <th>时间</th>
                                </thead>
                                <tbody>
                                    <#if logs??>
                                    <tr>
                                        <#list logs as log>
                                            <tr>
                                                <td>${log.logTitle}</td>
                                                <td>${log.logContent}</td>
                                                <td>${log.logIp}</td>
                                                <td>${log.logCreated}</td>
                                            </tr>
                                        </#list>
                                    </tr>
                                    <#else>
                                        <tr><td>暂无数据</td></tr>
                                    </#if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </#if>
            </div>
        </section>
        <script src="/static/plugins/toast/js/jquery.toast.min.js"></script>
        <script src="/static/plugins/layer/layer.js"></script>
        <script type="application/javascript">
            function openAllLogs() {
                layer.open({
                    type: 2,
                    title: '所有日志',
                    shadeClose: true,
                    shade: 0.5,
                    area: ['66%', '66%'],
                    content: '/admin/logs',
                    scrollbar: false
                });
            }
            $('#btnWidgetsOption').click(function () {
                $('#widgetOptionsPanel').slideToggle(400);
            });
            function saveOptions(option) {
                var param = $('#'+option).serialize();
                $.ajax({
                    type: 'post',
                    url: '/admin/option/save',
                    data: param,
                    success: function (result) {
                        $.toast({
                            text: '保存成功',
                            heading: '提示',
                            icon: 'success',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 1000,
                            stack: 5,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#ffffff',
                            afterHidden: function () {
                                window.location.reload();
                            }
                        });
                    }
                });
            }
        </script>
    </div>
    <#include "module/_footer.ftl">
    <div class="control-sidebar-bg"></div>
</div>
<@footer></@footer>