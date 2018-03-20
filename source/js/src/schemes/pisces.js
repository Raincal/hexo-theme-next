NexT.pisces = {};

NexT.pisces.init = function () {

  initAffix();

  function initAffix () {
    var sidebarInner = $('.sidebar-inner'),
    headerOffset = getHeaderOffset(),
    footerOffset = getFooterOffset(),
    sidebarHeight = $('#sidebar').height() + NexT.utils.getSidebarb2tHeight(),
    contentHeight = $('#content').height();

    resizeListener(sidebarInner);

    window.onpopstate = function(event) {
      recalculateAffixPosition(sidebarInner);

      NexT.utils.registerBackToTop();

      window.location.pathname !== '/' && NexT.postDetails.init();
    };
    // Not affix if sidebar taller then content (to prevent bottom jumping).
    if (headerOffset + sidebarHeight < contentHeight) {
      sidebarInner.affix({
        offset: {
          top: headerOffset - CONFIG.sidebar.offset,
          bottom: footerOffset
        }
      });
    }

    setSidebarMarginTop(headerOffset).css({ 'margin-left': 'initial' });
  }

  function resizeListener (sidebarInner) {
    var mql = window.matchMedia('(min-width: 991px)');
    mql.addListener(function(e){
      if(e.matches){
        recalculateAffixPosition(sidebarInner);
      }
    });
  }

  function getHeaderOffset () {
    return $('.header-inner').height() + CONFIG.sidebar.offset;
  }

  function getFooterOffset () {
    var footerInner = $('.footer-inner'),
        footerMargin = footerInner.outerHeight(true) - footerInner.outerHeight(),
        footerOffset = footerInner.outerHeight(true) + footerMargin;
    return footerOffset;
  }

  function setSidebarMarginTop (headerOffset) {
    return $('#sidebar').css({ 'margin-top': headerOffset });
  }

  function recalculateAffixPosition (sidebarInner) {
    $(window).off('.affix');
    sidebarInner.removeData('bs.affix').removeClass('affix affix-top affix-bottom');
    initAffix();
  }

};
