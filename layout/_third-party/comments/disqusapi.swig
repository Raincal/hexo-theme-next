{% if theme.disqusapi.enable %}
    {% set iDisqus_css_uri = url_for(theme.vendors._internal + '/disqus/dist/iDisqus.min.css?v=1.0.0') %}
    {% if theme.vendors.iDisqus_css %}
      {% set iDisqus_css_uri = theme.vendors.iDisqus_css %}
    {% endif %}

    {% set iDisqus_js_uri = url_for(theme.vendors._internal + '/disqus/dist/iDisqus.min.js?v=1.0.0') %}
    {% if theme.vendors.iDisqus_js %}
      {% set iDisqus_js_uri = theme.vendors.iDisqus_js %}
    {% endif %}
    <link rel="stylesheet" href="{{ iDisqus_css_uri }}" type="text/css" />
    <script preload src="{{ iDisqus_js_uri }}"></script>
    <script>
        var disq = new iDisqus('comment', {
            forum: '{{ theme.disqusapi.forum }}',
            site: '{{ theme.disqusapi.site }}',
            api: '{{ theme.disqusapi.api }}',
            mode: {{ theme.disqusapi.mode }},
            badge: '{{ theme.disqusapi.badge }}',
            timeout: {{ theme.disqusapi.timeout }},
            init: true,
            url: location.pathname
        });
        disq.count();
    </script>
{% endif %}
