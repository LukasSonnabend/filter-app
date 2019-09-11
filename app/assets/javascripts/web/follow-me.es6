var stickyHeaders = (function() {
  var $window = $(window),
    $stickies;
    var load = function(stickies) {
      if (typeof stickies === "object" && stickies instanceof jQuery && stickies.length > 0) {
        $stickies = stickies.each(function() {
          var $thisSticky = $(this).wrap('<div class="followWrap" />');
          $thisSticky
          .data('originalPosition', $thisSticky.offset().top)
          .data('originalHeight', $thisSticky.outerHeight())
          .parent()
          .height($thisSticky.outerHeight());
        });
        $window.off("scroll.stickies").on("scroll.stickies", function() {
          _whenScrolling();
        });
      }
    };
    var _whenScrolling = function() {
      $stickies.each(function(i) {
        var $thisSticky = $(this),
          $stickyPosition = $thisSticky.data('originalPosition');
          if ($stickyPosition <= $window.scrollTop()) {
            var $nextSticky = $stickies.eq(i + 1),
              $nextStickyPosition = $nextSticky.data('originalPosition') - $thisSticky.data('originalHeight');
              $thisSticky.addClass("fixed");
              if ($nextSticky.length > 0 && $thisSticky.offset().top >= $nextStickyPosition) {
                $thisSticky.addClass("absolute").css("top", $nextStickyPosition);
              }
          } else {
            var $prevSticky = $stickies.eq(i - 1);
            $thisSticky.removeClass("fixed");
            if ($prevSticky.length > 0 && $window.scrollTop() <= $thisSticky.data('originalPosition') - $thisSticky.data('originalHeight')) {
              $prevSticky.removeClass("absolute").removeAttr("style");
            }
          }
      });
    };
    return {
      load: load
    };
})();


jQuery(function() {
  var el = $('.js-follow-me');
  if (el.length > 0) {
    stickyHeaders.load(el);
    el.removeClass('js-follow-me').addClass('follow-me')
  }
});


const observer = new IntersectionObserver(
  ([e]) => e.target.toggleAttribute('stuck', e.intersectionRatio < 1),
  {threshold: [1]}
);

jQuery(function() {
  Array.from(document.querySelector('.day-title')).forEach(function(el) {
    observer.observe(el);
  })
})
