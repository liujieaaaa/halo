<#list posts.content as post>
<!-- Paradox Thumbnail -->
<div class="post_entry-module mdl-card mdl-shadow--2dp mdl-cell mdl-cell--12-col fade out">
    <!-- Post Thumbnail -->
    <!-- Random Thumbnail -->
    <div class="post_thumbnail-random mdl-card__media mdl-color-text--grey-50">
        <!-- Post Title -->
        <p class="article-headline-p"><a href="/article/${post.postUrl}">${post.postTitle?if_exists}</a></p>
    </div>
    <!-- Post Excerpt -->
    <div class="mdl-color-text--grey-600 mdl-card__supporting-text post_entry-content">
        ${post.postSummary?if_exists}
        &nbsp;&nbsp;&nbsp;
        <span>
            <a href="/article/${post.postUrl}" target="_self">阅读全文</a>
        </span>
    </div>
    <!-- Post_entry Info-->
    <div id="post_entry-info">
        <div id="post_entry-left-info" class="mdl-card__supporting-text meta mdl-color-text--grey-600 ">
            <!-- Author Avatar -->
            <div id="author-avatar">
                <img src="/material/source/img/avatar.png" width="44px" height="44px"
                     alt="RYAN0UP's avatar">
            </div>
            <div>
                <strong>RYAN0UP</strong>
                <span>${post.postDate?string("MM月 dd,yyyy")}</span>
            </div>
        </div>
        <div id="post_entry-right-info">
            <!-- Category -->
            <#if post.categories??>
            <#list post.categories as cate>
                <span class="post_entry-category">
                  <a class="post_category-link" href="/categories/学习笔记/">${cate.cateName}</a>
                </span>
            </#list>
            </#if>
            <!-- Post Views -->
            <span class="post_entry-views"></span>
        </div>
    </div>
</div>
</#list>