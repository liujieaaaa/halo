<#compress >
<#include "module/_macro.ftl">
<@head title="Halo后台管理-文章">
</@head>
<div class="wrapper">
    <!-- 顶部栏模块 -->
    <#include "module/_header.ftl">
    <!-- 菜单栏模块 -->
    <#include "module/_sidebar.ftl">
    <div class="content-wrapper">
        <style type="text/css" rel="stylesheet">
            .draft,.publish,.trash{list-style:none;float:left;margin:0;padding-bottom:10px}
            #btnNewPost{margin-left:4px;padding:3px 6px;position:relative;top:-4px;border:1px solid #ccc;border-radius:2px;background:#fff;text-shadow:none;font-weight:600;font-size:12px;line-height:normal;color:#3c8dbc;cursor:pointer;transition:all .2s ease-in-out}
            #btnNewPost:hover{background:#3c8dbc;color:#fff}
        </style>
        <section class="content-header">
            <h1 style="display: inline-block;">文章</h1>
            <a id="btnNewPost" href="/admin/posts/new">
                写文章
            </a>
            <ol class="breadcrumb">
                <li>
                    <a href="/admin">
                        <i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li class="active">文章</li>
            </ol>
        </section>
        <section class="content container-fluid">
            <ul style="list-style: none;padding-left: 0">
                <li class="publish">
                    <a href="/admin/posts">已发布<span class="count">(${publishCount})</span></a>&nbsp;|&nbsp;
                </li>
                <li class="draft">
                    <a href="/admin/posts?status=1">草稿<span class="count">(${draftCount})</span></a>&nbsp;|&nbsp;
                </li>
                <li class="trash">
                    <a href="/admin/posts?status=2">回收站<span class="count">(${trashCount})</span></a>
                </li>
            </ul>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <!--
                        <div class="box-header">
                            <div class="box-tools">
                                <form action="/admin/posts/search" method="post">
                                    <div class="input-group input-group-sm" style="width: 200px;">
                                        <input type="text" name="keyword" class="form-control pull-right">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        -->
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th width="40%">标题</th>
                                    <th>分类目录</th>
                                    <th>标签</th>
                                    <th>评论</th>
                                    <th>日期</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <#list posts.content as post>
                                    <tr>
                                        <td>${post.postTitle}</td>
                                        <td>
                                            <#if post.categories??>
                                                <#list post.categories as cate>
                                                    ${cate.cateName}
                                                </#list>
                                            </#if>
                                        </td>
                                        <td>无标签</td>
                                        <td>0</td>
                                        <td>${post.postDate?if_exists?string("yyyy-MM-dd HH:mm")}</td>
                                        <td>
                                            <#switch post.postStatus>
                                                <#case 0>
                                                    <a href="/admin/posts/view?postId=${post.postId}" class="btn btn-info btn-sm" target="_blank">预览</a>
                                                    <a href="/admin/posts/edit?postId=${post.postId}" class="btn btn-primary btn-sm">修改</a>
                                                    <button class="btn btn-danger btn-sm" onclick="modelShow('/admin/posts/throw?postId=${post.postId}','确定移到回收站？')">丢弃</button>
                                                    <#break >
                                                <#case 1>
                                                    <a href="/admin/posts/view?postId=${post.postId}" class="btn btn-info btn-sm" target="_blank">预览</a>
                                                    <a href="/admin/posts/edit?postId=${post.postId}" class="btn btn-primary btn-sm">修改</a>
                                                    <button class="btn btn-danger btn-sm" onclick="modelShow('/admin/posts/revert?postId=${post.postId}&status=1','确定发布该文章？')">发布</button>
                                                    <#break >
                                                <#case 2>
                                                    <a href="/admin/posts/revert?postId=${post.postId}&status=2" class="btn btn-info btn-sm">还原</a>
                                                    <button class="btn btn-danger btn-sm" onclick="modelShow('/admin/posts/remove?postId=${post.postId}','确定永久删除？(不可逆)')">永久删除</button>
                                                    <#break >
                                            </#switch>
                                        </td>
                                    </tr>
                                    </#list>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第${posts.number+1}/${posts.totalPages}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a class="btn btn-sm <#if !posts.hasPrevious()>disabled</#if>" href="/admin/posts?status=${status}">首页</a> </li>
                                <li><a class="btn btn-sm <#if !posts.hasPrevious()>disabled</#if>" href="/admin/posts?status=${status}&page=${posts.number-1}">上页</a></li>
                                <li><a class="btn btn-sm <#if !posts.hasNext()>disabled</#if>" href="/admin/posts?status=${status}&page=${posts.number+1}">下页</a></li>
                                <li><a class="btn btn-sm <#if !posts.hasNext()>disabled</#if>" href="/admin/posts?page=${posts.totalPages-1}&status=${status}">尾页</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 删除确认弹出层 -->
        <div class="modal fade" id="removePostModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <p id="message"></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="url"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a onclick="removeIt()" class="btn btn-danger" data-dismiss="modal">确定</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function modelShow(url,message) {
                $('#url').val(url);
                $('#message').html(message);
                $('#removePostModal').modal();
            }
            function removeIt(){
                var url=$.trim($("#url").val());
                window.location.href=url;
            }
        </script>
    </div>
    <#include "module/_footer.ftl">
    <div class="control-sidebar-bg"></div>
</div>
<@footer></@footer>
</#compress>