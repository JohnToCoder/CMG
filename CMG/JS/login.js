
window.onload = function () {

    document.onkeydown = getKey;
}

function getKey(e) {
    e = e || window.event;
    var keycode = e.which ? e.which : e.keyCode;

    // alert(keycode);

    if (keycode == 13) {
        $('#Login').trigger('click');
    }
}