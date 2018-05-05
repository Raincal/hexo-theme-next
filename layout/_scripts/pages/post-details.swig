<script type="text/javascript" src="{{ url_for(theme.js) }}/src/scrollspy.js?v={{ version }}"></script>
<script type="text/javascript" src="{{ url_for(theme.js) }}/src/post-details.js?v={{ version }}"></script>
{% if url_for(path) == "/photos/index.html" %}
<script src="{{ url_for(theme.js) }}/src/photoswipe.min.js?v={{ version }}"></script>
<script src="{{ url_for(theme.js) }}/src/photoswipe-ui-default.min.js?v={{ version }}"></script>
{% endif %}
