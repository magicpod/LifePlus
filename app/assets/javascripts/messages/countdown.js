jQuery(document).ready(function() {
    $('#countdown_dashboard').countDown({
        targetOffset: {
           'day':      0,
           'month':    0,
           'year':     2013,
           'hour':     0,
            'min':      0,
            'sec':      10
        }
    });



    // $('#countdown_dashboard').countDown({
    //     targetDate: {
    //         'day':      0,
    //         'month':    0,
    //         'year':     2100,
    //         'hour':     0,
    //         'min':      0,
    //         'sec':      0
    //     }
    // });

    $('#countdown_dashboard').stopCountDown();
    $('#countdown_dashboard').setCountDown({
      targetOffset: {
          'day':      1,
          'month':    1,
          'year':     0,
          'hour':     1,
          'min':      1,
          'sec':      10
      }
    });
    $('#countdown_dashboard').startCountDown();

    setTimeout("fadeoutCountdown()", 8*1000);

});

function fadeoutCountdown()  {
    $('body').fadeOut(3000);
    setTimeout("fadeinTimecapsule()", 3*1000);
}

function fadeinTimecapsule() {
    $('body').show();
    $('#countdown_dashboard').stopCountDown();
}
