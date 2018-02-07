{% if theme.busuanzi_count.enable %}
<div class="busuanzi-count">
  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
  <script src="//cdn.jsdelivr.net/npm/jquery@3.3.1/dist/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
      var int = setInterval(fixCount, 50);
      var uvOffset = {{ theme.busuanzi_count.uv_offset }};
      var pvOffset = {{ theme.busuanzi_count.pv_offset }};
      function fixCount() {
        var siteUv = +$("#busuanzi_value_site_uv").html();
        var sitePv = +$("#busuanzi_value_site_pv").html();
        if (siteUv != 0 && sitePv != 0){
          $("#busuanzi_value_site_uv").html(siteUv + uvOffset);
          $("#busuanzi_value_site_pv").html(sitePv + pvOffset);
          clearInterval(int);
        }
      }
    });
  </script>

  {% if theme.busuanzi_count.site_uv %}
    <span class="site-uv">
      {{ theme.busuanzi_count.site_uv_header }}
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
      {{ theme.busuanzi_count.site_uv_footer }}
    </span>
  {% endif %}

  {% if theme.busuanzi_count.site_pv %}
    <span class="site-pv">
      {{ theme.busuanzi_count.site_pv_header }}
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
      {{ theme.busuanzi_count.site_pv_footer }}
    </span>
  {% endif %}
</div>
{% endif %}
