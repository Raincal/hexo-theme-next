{% include 'vendors.swig' %}

{% if url_for(path) == "/photos/index.html" %}
  {{- next_js('photoswipe.min.js') }}
  {{- next_js('photoswipe-ui-default.min.js') }}
{% endif %}

<!-- build:js /js/bundle.js -->
{{- next_js('utils.js') }}
{%- if theme.motion.enable %}
  {{- next_js('motion.js') }}
{%- endif %}

{%- set scheme_script = 'schemes/' + theme.scheme | lower + '.swig' %}
{% include scheme_script %}

{{- next_js('next-boot.js') }}
<!-- endbuild -->

{%- if theme.bookmark.enable %}
  {{- next_js('bookmark.js') }}
{%- endif %}
{%- if theme.pjax %}
  {% include 'pjax.swig' %}
{%- endif %}
{% include 'three.swig' %}
