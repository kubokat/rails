document.addEventListener('turbolinks:load', function () {
    var confirmation = document.querySelector('#password-confirmation-field');

    if (confirmation) {
        var password = document.querySelector('#password-field');
        var check_fields = document.querySelectorAll('.check');

        check_fields.forEach((elem)=>{
            elem.addEventListener('input', checkValidation)
        });
    }
});

function checkValidation() {
    var icon = document.querySelector('.octicon-check');
    var password = document.querySelector('#password-field').value;
    var confirmation = document.querySelector('#password-confirmation-field').value;

    if (confirmation.length) {
        icon.classList.remove('hide');

        if (password === confirmation) {
            icon.classList.add('green');
            icon.classList.remove('red');
        } else {
            icon.classList.add('red');
            icon.classList.remove('green')
        }
    } else {
        icon.classList.add('hide');
    }
}
