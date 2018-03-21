<script src="//cdn.jsdelivr.net/npm/jquery-pjax@2.0.1/jquery.pjax.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/nprogress@0.2.0/nprogress.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        NProgress.configure({showSpinner: false, easing: 'ease-out', speed: 500});

        $(document).on('pjax:start', NProgress.start).on('pjax:end', NProgress.done);
        $(document).pjax('a[target!=".fancybox"]', '#pjax-container', {
            timeout: 8000,
            fragment: '#pjax-container'
        });
        $(document).on('pjax:complete', function () {
            NexT.motion.integrator.cursor = -1;

            $(document).trigger('bootstrap:before');

            NexT.utils.isMobile() && window.FastClick.attach(document.body);

            NexT.utils.lazyLoadPostsImages();

            NexT.utils.registerBackToTop();

            $('.site-nav-toggle button').on('click', function () {
                var $siteNav = $('.site-nav');
                var ON_CLASS_NAME = 'site-nav-on';
                var isSiteNavOn = $siteNav.hasClass(ON_CLASS_NAME);
                var animateAction = isSiteNavOn ? 'slideUp' : 'slideDown';
                var animateCallback = isSiteNavOn ? 'removeClass' : 'addClass';

                $siteNav.stop()[animateAction]('fast', function () {
                    $siteNav[animateCallback](ON_CLASS_NAME);
                });
            });

            CONFIG.fancybox && NexT.utils.wrapImageWithFancyBox();
            NexT.utils.embeddedVideoTransformer();
            NexT.utils.addActiveClassToMenuItem();

            CONFIG.leancloud.enable && NexT.AV.init();

            $(document).trigger('motion:before');

            if (CONFIG.motion.enable) {
                NexT.utils.needAffix() ? NexT.pisces.init() : NexT.motion.init();
                NexT.motion.integrator.bootstrap();
            } else {
                NexT.utils.needAffix() && NexT.pisces.init();
            }

            NexT.postDetails.init();

            $(document).trigger('bootstrap:after');

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
        });
    })
</script>
