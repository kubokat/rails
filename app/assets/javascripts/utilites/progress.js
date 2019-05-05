document.addEventListener('turbolinks:load', function () {
    var control = document.getElementById('progress');
    var timer = document.getElementById('timer');

    if (control) {
        var total = control.dataset.total;
        var number = control.dataset.number;

        control.style.width = (number / total) * 100 + '%';
    }

    if (timer) {
        var currentTime = timer.dataset.time;
        var currentUrl = window.location.href;

        setInterval(function(){

            if (currentTime <= 0) {
                window.location.href = currentUrl + '/result'
            }

            timer.innerHTML = currentTime;
            currentTime--;
        },1000);
    }
});
