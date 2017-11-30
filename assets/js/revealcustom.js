function fadeImage($el) {
    // Get image DOM element
    $img = $el.parent().siblings('img');

    // Fade the image out, change source and fade in again
    $img.fadeOut(100, function() {
        $img.attr('src', $el.data('src'));
        $img.fadeIn(500);
    });
}

Reveal.addEventListener('fragmentshown', function(event) {
    // Get DOM element of current fragment
    var $el = $(event.fragment);

    // Check if current fragment is of 'type' imgsrc
    // If yes: fade image with source of current element
    if($el.hasClass('imgsrc'))
        fadeImage($el);
});

Reveal.addEventListener('fragmenthidden', function(event) {
    // Get DOM element of current fragment
    var $el = $(event.fragment);

    // Check if current fragment is of 'type' imgsrc
    // If yes: fade image with source of previous element
    if($el.hasClass('imgsrc')) {
        fadeImage($el.prev());
    }
});

