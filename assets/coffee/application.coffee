class App
  init: =>
    ###**************** Waypoints *****************###
    $('.wp1').waypoint (->
      $('.wp1').addClass 'animated fadeInUp'
      return
    ), offset: '75%'
    $('.wp2').waypoint (->
      $('.wp2').addClass 'animated fadeInUp'
      return
    ), offset: '75%'
    $('.wp3').waypoint (->
      $('.wp3').addClass 'animated fadeInRight'
      return
    ), offset: '75%'

    ###**************** Initiate Flexslider *****************###

    $('.flexslider').flexslider animation: 'slide'

    ###**************** Initiate Fancybox *****************###

    $('.single_image').fancybox padding: 4

    ###**************** Tooltips *****************###

    $('[data-toggle="tooltip"]').tooltip()

    ###**************** Nav Transformicon *****************###

    ###When user clicks the Icon ###

    $('.nav-toggle').click ->
      $(this).toggleClass 'active'
      $('.header-nav').toggleClass 'open'
      event.preventDefault()
      return

    ###When user clicks a link ###

    $('.header-nav li a').click ->
      $('.nav-toggle').toggleClass 'active'
      $('.header-nav').toggleClass 'open'
      return

    ###**************** Header BG Scroll *****************###

    $ ->
      $(window).scroll ->
        scroll = $(window).scrollTop()
        if scroll >= 20
          $('section.navigation').addClass 'fixed'
          $('header').css
            'border-bottom': 'none'
            'padding': '35px 0'
          $('header .member-actions').css 'top': '26px'
          $('header .navicon').css 'top': '34px'
        else
          $('section.navigation').removeClass 'fixed'
          $('header').css
            'border-bottom': 'solid 1px rgba(255, 255, 255, 0.2)'
            'padding': '50px 0'
          $('header .member-actions').css 'top': '41px'
          $('header .navicon').css 'top': '48px'
        return
      return

    ###**************** Smooth Scrolling *****************###

    $ ->
      $('a[href*=#]:not([href=#])').click ->
        if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
          target = $(@hash)
          target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
          if target.length
            $('html,body').animate { scrollTop: target.offset().top }, 2000
            return false
        return
      return
    return

$ ->
  Application = new App()
  Application.init()