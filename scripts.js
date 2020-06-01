document.getElementById("szukaj-producent").addEventListener("keyup", filtrProduktow)
document.getElementById("szukaj-model").addEventListener("keyup", filtrProduktow)
document.getElementById("szukaj-cena").addEventListener("keyup", filtrProduktow)
document.getElementById("wyczysc-filtr-button").addEventListener("click", wyczyscGuzik)
initializeButtons()



function filtrProduktow() {
    var inputProducent = document.getElementById("szukaj-producent");
    var inputModel = document.getElementById("szukaj-model");
    var inputPrice = document.getElementById("szukaj-cena");

    var filtrProducent = inputProducent.value.toLowerCase();
    var filtrModel = inputModel.value.toLowerCase();
    var filtrPrice = inputPrice.value.toLowerCase();

    var Producent = document.getElementsByClassName("producent-w-bazie");
    var Model = document.getElementsByClassName("model-w-bazie");
    var Price = document.getElementsByClassName("cena-w-bazie");

    for (i = 0; i < Producent.length; i++) {
        if (Producent[i].innerText.toLowerCase().includes(filtrProducent)
            && Model[i].innerText.toLowerCase().includes(filtrModel)
            && Price[i].innerText.toLowerCase().includes(filtrPrice)) {
            Producent[i].parentElement.parentElement.style.display = "inline-block";
        } else {
            Producent[i].parentElement.parentElement.style.display = "none";
        }
    }
}



function wyczyscGuzik() {
    document.getElementById("szukaj-producent").value = "";
    document.getElementById("szukaj-model").value = "";
    document.getElementById("szukaj-cena").value = "";
    filtrProduktow();
}

