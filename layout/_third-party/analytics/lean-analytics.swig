{% if theme.leancloud_visitors.enable %}
<script>
  function showTime(headers, baseUrl) {
    var entries = [];
    var $visitors = $('.leancloud_visitors');

    $visitors.each(function () {
      entries.push( $(this).attr('id').trim() );
    });

    // Get Counters in current page
    $.ajax({
      url: baseUrl,
      method: 'POST',
      headers: headers,
      data: {'where':{'url':{'$in':entries}},'_method':'GET'}
    })
    .done(function(data) {
      var COUNT_CONTAINER_REF = '.leancloud-visitors-count';
      var results = data.results

      if (results.length === 0) {
        $visitors.find(COUNT_CONTAINER_REF).text(0);
        return;
      }

      for (var i = 0; i < results.length; i++) {
        var item = results[i];
        var url = item['url'];
        var time = item['time'];
        var element = document.getElementById(url);

        $(element).find(COUNT_CONTAINER_REF).text(time);
      }

      for(var i = 0; i < entries.length; i++) {
        var url = entries[i];
        var element = document.getElementById(url);
        var countSpan = $(element).find(COUNT_CONTAINER_REF);
        if( countSpan.text() == '') {
          countSpan.text(0);
        }
      }
    })
    .fail(function(error) {
      handleError(error);
    })
  }

  function addCount(headers, baseUrl) {
    var $visitors = $('.leancloud_visitors');
    var url = $visitors.attr('id').trim();
    var title = $visitors.attr('data-flag-title').trim();

    // Get current Counter Object
    $.ajax({
        url: baseUrl,
        method: 'POST',
        headers: headers,
        data: {'where':{'url':url},'_method':'GET'}
    })
    .done(function(data) {
      var results = data.results;
      if (results.length > 0) {
        var id = results[0]['objectId'];

        // Increment
        $.ajax({
          url: baseUrl + '/' + id + '?fetchWhenSave=true',
          method: 'PUT',
          headers: headers,
          contentType: 'application/json',
          data: JSON.stringify({time:{__op:'Increment',amount:1}})
        })
        .done(function(data) {
          var $element = $(document.getElementById(url));
          $element.find('.leancloud-visitors-count').text(data['time']);
        })
        .fail(function(error) {
          handleError(error);
        })
      } else {
        // Create Counter
        $.ajax({
          url: baseUrl + '?fetchWhenSave=true',
          method: 'POST',
          headers: headers,
          contentType: 'application/json',
          data: JSON.stringify({title: title,url: url,time: 1})
        })
        .done(function(newcounter) {
          var $element = $(document.getElementById(url));
          $element.find('.leancloud-visitors-count').text(newcounter['time']);
        })
        .fail(function(error) {
          handleError(error);
        })
      }
    })
    .fail(function(error) {
      handleError(error);
    })
  }

  function handleError(error) {
    var resp = error.responseJSON;
    console.log('Error: ' + resp.code + ' ' + resp.error);
  }

  $(function() {
    var appId       = '{{theme.leancloud_visitors.app_id}}',
        appKey      = '{{theme.leancloud_visitors.app_key}}',
        prefix      = appId.slice(0, 8).toLowerCase(),
        BASE_URL    = 'https://' + prefix + '.api.lncld.net/1.1/classes/Counter',
        headers     = {
          'X-LC-Id':  appId,
          'X-LC-Key': appKey
        };

    if ($('.leancloud_visitors').length == 1) {
      addCount(headers, BASE_URL);
    } else if ($('.post-title-link').length > 1) {
      showTime(headers, BASE_URL);
    }
  });
</script>
{% endif %}
