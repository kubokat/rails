document.addEventListener('turbolinks:load', function () {
    var control = document.getElementById('progress');

    if (control) {
        var total = control.dataset.total;
        var number = control.dataset.number;

        control.style.width = (number / total) * 100 + '%';
    }
});
