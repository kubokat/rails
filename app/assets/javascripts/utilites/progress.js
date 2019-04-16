document.addEventListener('turbolinks:load', function () {
    var control = document.getElementById('progress');

    if (control) {
        var total = control.dataset.total;
        var number = control.dataset.number;

        console.log((number / total) * 100)

        control.style.width = (number / total) * 100 + '%';
    }
});
