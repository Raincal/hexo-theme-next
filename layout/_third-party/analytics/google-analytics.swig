{% if theme.google_analytics.gtag and theme.google_analytics.tracking_id %}
  <script async src="https://www.googletagmanager.com/gtag/js?id={{ theme.google_analytics.tracking_id }}"></script>
  <script>
    var host = window.location.hostname;
    if (host !== "localhost" || !{{theme.google_analytics.localhost_ignored}}) {
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', '{{ theme.google_analytics.tracking_id }}');
    }
  </script>
  {% elif theme.google_analytics.tracking_id %}
  <script>
    window.ga = window.ga || function () { (ga.q = ga.q || []).push(arguments) }; ga.l = +new Date;
    ga('create', '{{ theme.google_analytics.tracking_id }}', 'auto');
    ga('send', 'pageview');
  </script>
  <script async src='https://www.google-analytics.com/analytics.js'></script>
{% endif %}
