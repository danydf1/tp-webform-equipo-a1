let imgDetallePrimcipal = document.querySelector("#imgDetallePrincipal");

const cambiarImagen = (e) => {
    
    let imgSeleccion = e.target.src;

    imgDetallePrimcipal.src = imgSeleccion;
}