let btnSuamar = document.querySelector("#btnSumar");
let btnRestar = document.querySelector("#btnRestar");
let detalleCantidad = document.querySelector("#detalleCantidad");

btnSuamar.addEventListener('click', function (e) {
    if (detalleCantidad.value < 50) {
        detalleCantidad.value++;
    }
})


btnRestar.addEventListener('click', function (e) {
    if (detalleCantidad.value > 0) {
        detalleCantidad.value--;
    }
})