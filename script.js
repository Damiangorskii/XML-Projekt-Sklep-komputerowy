document.getElementById("szukaj-producent").addEventListener("keyup", filtrProduktow)
document.getElementById("szukaj-model").addEventListener("keyup", filtrProduktow)
document.getElementById("szukaj-cena").addEventListener("keyup", filtrProduktow)
document.getElementById("wyczysc-filtr-button").addEventListener("click", wyczyscFiltr)
ButtonsInit()



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



function wyczyscFiltr() {
    document.getElementById("szukaj-producent").value = "";
    document.getElementById("szukaj-model").value = "";
    document.getElementById("szukaj-cena").value = "";
    filtrProduktow();
}

function ButtonsInit() {
    var edytujButtons = document.getElementsByClassName("edytuj-button");
    for (var i = 0; i < edytujButtons.length; i++) {
        edytujButtons[i].addEventListener("click", edytuj, false)
    }

    var usunButtons = document.getElementsByClassName("usun-button");
    for (var i = 0; i < usunButtons.length; i++) {
        usunButtons[i].addEventListener("click", usun, false)
    }
}

var dodajButtons = document.getElementsByClassName("dodaj-button");
for (var i = 0; i < dodajButtons.length; i++) {
    dodajButtons[i].addEventListener("click", dodaj, false)
}

function usun() {
    event.currentTarget.parentElement.parentElement.parentElement.remove();
}

function dodaj() {
    var buttonId = event.currentTarget.id;
    var specyfikacje
    var idProduktu
    var typ

    if(buttonId == "dodaj-procesor") {
        specyfikacje = '<div class="specyfikacje">czestotliwosc: <p class="specyfikacje-modyfikacja1">...</p><br/>liczba rdzeni:<p class="specyfikacje-modyfikacja2">...</p></div>'
        typ="procesory"
    } else if(buttonId == "dodaj-karteGraficzna") {
        specyfikacje = '<div class="specyfikacje">czestotliwosc: <p class="specyfikacje-modyfikacja1">...</p><br/>pamiec:<p class="specyfikacje-modyfikacja2">...</p></div>'
        typ="kartaGraficzna"
    } else if (buttonId == "dodaj-twardyDysk") {
        specyfikacje = '<div class="specyfikacje">pamiec: <p class="specyfikacje-modyfikacja1">...</p><br/>format:<p class="specyfikacje-modyfikacja2">...</p></div>'
        typ="twardyDysk"
    }


    // product card
    var pojedynczyProdukt = document.createElement("div")
    pojedynczyProdukt.classList.add("pojedynczy-produkt")

    // title div  
    pojedynczyProdukt.innerHTML += '<div class="producent-model"> producent: <p class="producent-w-bazie">...</p> model: <p class="model-w-bazie">...</p></div>'
    // detailed info
    pojedynczyProdukt.innerHTML += specyfikacje
    // price
    pojedynczyProdukt.innerHTML += '<div class="cena">cena: <p class="cena-w-bazie" type="number"/>0</p></div>'
    // buttons 
    pojedynczyProdukt.innerHTML += '<div class="produkt-buttons"><p class="img-paragraph"><button class="produkt-button edytuj-button"><img src="https://img.icons8.com/fluent/48/000000/edit.png"/></button></p><p class="img-paragraph"><button class="product-button usun-button"><img src="https://img.icons8.com/fluent/48/000000/delete-sign.png"/></button></p></div>'

    var produkty = document.getElementById(typ);
    produkty.appendChild(pojedynczyProdukt);

    // buttons to update
    var helper = pojedynczyProdukt.childNodes
    var newButtons = helper[helper.length - 1].childNodes
    var new1 = newButtons[0].childNodes
    var new2 = newButtons[1].childNodes
    new1[0].addEventListener("click", edytuj, false)
    new2[0].addEventListener("click", usun, false)



}

function edytuj() {
    var producent1 = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("producent-w-bazie");
    var model1 = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("model-w-bazie");
    var specyfikacje11 = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("specyfikacje-modyfikacja1");
    var specyfikacje12 = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("specyfikacje-modyfikacja2");
    var cena1 = event.currentTarget.parentElement.parentElement.parentElement.getElementsByClassName("cena-w-bazie");

    producent = producent1[0];
    model = model1[0];
    specyfikacje1 = specyfikacje11[0];
    specyfikacje2 = specyfikacje12[0];
    var cena = cena1[0];

    if (producent.contentEditable == "true") {
        producent.contentEditable = "false";
        model.contentEditable = "false";
        specyfikacje1.contentEditable = "false";
        specyfikacje2.contentEditable = "false";
        cena.contentEditable = "false";
    } else {
        producent.contentEditable = "true";
        model.contentEditable = "true";
        specyfikacje1.contentEditable = "true";
        specyfikacje2.contentEditable = "true";
        cena.contentEditable = "true";
    }
}


