/* global hexo */

'use strict';

const path = require('path');
const {iconText} = require('./common');

// Add comment
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.disqusapi.enable || !theme.disqusapi.forum) return;

  injects.comment.raw('disqusapi', `
  <div class="comments" id="comments">
    <div id="comment"></div>
  </div>
  `, {}, {cache: true});

  injects.bodyEnd.file('disqusapi', path.join(hexo.theme_dir, 'layout/_third-party/comments/disqusapi.swig'));

});

// Add post_meta
hexo.extend.filter.register('theme_inject', injects => {
  let theme = hexo.theme.config;
  if (!theme.disqusapi.enable || !theme.disqusapi.forum || !theme.disqusapi.count) return;

  injects.postMeta.raw('disqusapi', `
  {% if post.comments %}
  <span class="post-meta-item">
    ${iconText('comment-o', 'disqus')}
    <a title="disqus" data-disqus-url="{{ url_for(post.path) }}" href="{{ url_for(post.path) }}#comments" itemprop="discussionUrl">{#
      #}<span class="post-comments-count disqus-comment-count" data-disqus-identifier="{{ post.path }}" itemprop="commentCount"></span>{#
    #}</a>
  </span>
  {% endif %}
  `, {}, {}, theme.disqusapi.post_meta_order);

});
