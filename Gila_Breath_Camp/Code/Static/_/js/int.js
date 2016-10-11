 /*-------------------------------------------------*/
 /* =  img to background
 /*-------------------------------------------------*/


 $("#subheader #slider1 img ").each(function(i, elem) {
   var img = $(elem);
   var div = $("<div />").css({
     background: "url(" + img.attr("src") + ") no-repeat",
     width: img.width() + "px",
     height: img.height() + "px"
   });
   img.replaceWith(div);
   $(div).addClass('browse-images')
 });


 var window_height = $(window).height() ;
 $('#subheader, .rslides li').height($(window).height());

 $(window).resize(function(){
     $('#subheader, .rslides li').css('height', $(window).height() );
 });

/*-------------------------------------------------*/
/* =  responsiveSlides 
/*-------------------------------------------------*/

$("#slider1").responsiveSlides({
    nav: true,
    // random:true,
    prevText: "Previous",
    nextText: "Next", 
    pager: true
  });
  // var wraper = '<div><img src="images/22.png" alt=""/></div>';
  var container_wrap = '<div class="container nav-container"></div>';
  // var next = '<span>NEXT SLIDE</span>';
  $('#subheader .rslides_tabs li').append ('<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 16 16"preserveAspectRatio="none"><circle class="outside" cx="7.5" cy="7.8" r="6.6"/><circle class="inside" cx="7.5" cy="7.8" r="3"/></svg>');
  $('#subheader .next').wrap('<div class="nav-circleslide"></div>');
  // $('#subheader .next').append(wraper,next,'NEXT SLIDE');
  $('#subheader .rslides_tabs').wrap(container_wrap);
  // $('#subheader .nav-circleslide').append(next);




 $('.nav-tabs a').click(function (e) {
   e.preventDefault();
   $(this).tab('show');
 })


 $('[data-toggle="popover"]').popover();

 
 function toggleChevron(e) {
     $(e.target)
         .prev('.panel-heading')
         .find("i.fa")
         .toggleClass('fa-angle-right fa-angle-down');
 }
 $('#accordion').on('hidden.bs.collapse', toggleChevron);
 $('#accordion').on('shown.bs.collapse', toggleChevron);



 /*-------------------------------------------------*/
 /* =  FlexSlider
 /*-------------------------------------------------*/
 
  // $window.load(function() {
  //   $('.flexslider').flexslider({
  //     animation: "slide",
  //     animationLoop: true,
  //     itemMargin: 0
  //   });
  // });


/*-------------------------------------------------*/
/* =  Our Offerings Car
/*-------------------------------------------------*/

  $("#offer").height($(window).height());
  $(window).resize(function(){
      $("#offer").height($(window).height());
  });

  // $(document).ready(function() {
  //   $('#offer-car').carousel({
  //     interval: 20000,
  //   })
  //     $('#offer-car').on('slid.bs.carousel', function() {
  //   });
    
  // });


/*-------------------------------------------------*/
/* =  text Circle 
/*-------------------------------------------------*/

 $('.reversed_arc').circleType({radius: 106, dir:-1});

 
/*-------------------------------------------------*/
/* =  SMOOTH SCROLLING BETWEEN SECTIONS
/*-------------------------------------------------*/

 // $(function() {
 //  $('.smoth').click(function() {
 //    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
 //      var target = $(this.hash);
 //      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
 //      if (target.length) {
 //        $('html, body').animate({
 //          scrollTop: target.offset().top
 //        }, 1000);
 //        return false;
 //      }
 //    }
 //  });

 
/*-------------------------------------------------*/
/* =  SMOOTH SCROLLING BETWEEN SECTIONS
/*-------------------------------------------------*/

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
})


$('.nav-tabs a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})


if($(window).width() < 768){
  $('#offer-car .carousel-inner div').removeClass("item");
  $('#offer-car .row div').addClass("item");
}

/*-------------------------------------------------*/
/* =  Clone Input Field by Add button
/*-------------------------------------------------*/

$(function() {
    $("#add").click(function(e) {
        $("#multi").clone() 
            .removeAttr("id")  
            .append('<a class="remover" href="#">Remove</a>')
            .insertAfter("#multi"); 
        e.preventDefault();
    });
    $("body").on("click", ".remover" ,function(e) { 
        $(this).parent().remove(); 
        e.preventDefault();
    });
});

 
/*-------------------------------------------------*/
/* =  Date Time Picker
/*-------------------------------------------------*/

  $(function () {
      $('.datepick').datetimepicker({
        format: 'DD/MM/YYYY'
      });
  });

  $(function () {
      $('.yrpick').datetimepicker({
        viewMode:'years', 
        format: 'YYYY' 
    });
  });

/*-------------------------------------------------*/
/* =  Modal Scroll Fix
/*-------------------------------------------------*/

$(document).on('hidden.bs.modal', '.modal', function () {
    $('.modal:visible').length && $(document.body).addClass('modal-open');
});

/*-------------------------------------------------*/
/* =  Active Class for Dashboard Menus
/*-------------------------------------------------*/

(function( $ ) {
    $.fn.activeNavigation = function(selector) {
        var pathname = window.location.pathname
        var extension_position;
        var href;
        var hrefs = []
        $(selector).find("a").each(function(){
            // Remove href file extension
            extension_position = $(this).attr("href").lastIndexOf('.');
            href = (extension_position >= 0) ? $(this).attr("href").substr(0, extension_position) : $(this).attr("href");

            if (pathname.indexOf(href) > -1) {
                hrefs.push($(this));
            }
        })
        if (hrefs.length) {
            hrefs.sort(function(a,b){
                return b.attr("href").length - a.attr("href").length
            })
            hrefs[0].closest('a').addClass("active")
        }
    };
})(jQuery);

$(document).activeNavigation(".menu-list .nav");






