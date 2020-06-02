<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:exsl="http://exslt.org/common"
                extension-element-prefixes="exsl"
                version="1.0">
<xsl:output method="html"/>


<xsl:template match="/">

<html>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <head>
        <title>Sklep Komputerowy</title>
    </head>
    <body>
        <div class="kontenerGlowny">
            <h1 id="tytul">Sklep Komputerowy</h1>
            <div>
                <h2 class="temat">Produkty</h2>
                <div class="search-boxes-wrapper">
                    <h4>Filtry</h4>
                    <div class="filtr-pole-tekstowe">producent: <input type="text" id="szukaj-producent" placeholder="Wpisz nazwe producenta" title="szukaj w produktach"/></div>
                    <div class="filtr-pole-tekstowe">model: <input type="text" id="szukaj-model" placeholder="Wpisz nazwe modelu" title="szukaj w produktach"/></div>
                    <div class="filtr-pole-tekstowe">cena: <input type="text" id="szukaj-cena" placeholder="Wpisz cene" title="szukaj w produktach"/></div>
                    <div class="szukaj-button-div"><button type="button" class="szukaj-button" id="wyczysc-filtr-button">Wyczysc</button></div>
                </div>
                <h3 class="tytul-produktu">Procesory</h3>
                <div class="dodaj-produkt-button">
                    <button class="dodaj-button" id="dodaj-procesor">
                        <img src="https://img.icons8.com/cute-clipart/64/000000/add.png"/>
                    </button>
                </div>
                <div class="produkty" id="procesory">
                    <xsl:for-each select="sklepKomputerowy/produkty/procesory">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
                <h3 class="tytul-produktu">Karty Graficzne</h3>
                <div class="dodaj-produkt-button">
                    <button class="dodaj-button" id="dodaj-karteGraficzna">
                        <img src="https://img.icons8.com/cute-clipart/64/000000/add.png"/>
                    </button>
                </div>
                <div class="produkty" id="kartaGraficzna">
                    <xsl:for-each select="sklepKomputerowy/produkty/kartyGraficzne">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
                <h3 class="tytul-produktu">Twarde Dyski</h3>
                <div class="dodaj-produkt-button">
                    <button class="dodaj-button" id="dodaj-twardyDysk">
                        <img src="https://img.icons8.com/cute-clipart/64/000000/add.png"/>
                    </button>
                </div>
                <div class="produkty" id="twardyDysk">
                    <xsl:for-each select="sklepKomputerowy/produkty/twardeDyski">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
            </div>
            <div>
                <h2 class="temat">Zamowienia</h2>
                <div class="zamowienia">
                    <xsl:for-each select="sklepKomputerowy/zamowienia">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
            </div>
        </div>
        <a href="https://icons8.com/icon/FLAhbNWR0src/add">Add icon by Icons8</a>
        <a href="https://icons8.com/icon/OWRPl8fxkRvG/edit">Edit icon by Icons8</a>
        <a href="https://icons8.com/icon/OZuepOQd0omj/delete">Delete icon by Icons8</a>
        <script src="script.js"><br/>
        </script>
    </body>
</html>
</xsl:template>

<xsl:template match="procesor">
    <div class="pojedynczy-produkt">
        <div class="producent-model">
            producent: <p  class="producent-w-bazie"><xsl:value-of select="./producent"/></p>
            model: <p class="model-w-bazie"><xsl:value-of select="./model"/></p>
        </div>
        <div class="specyfikacje">
            czestotliwosc: <p class="specyfikacje-modyfikacja1"><xsl:value-of select="./specyfikacje/czestotliwosc"/><xsl:value-of select="./specyfikacje/czestotliwosc/@rodzaj"/></p>
            liczba rdzeni: <p class="specyfikacje-modyfikacja2"><xsl:value-of select="./specyfikacje/liczbaRdzeni"/></p>
        </div>
        <div class="cena">
            cena: <p class="cena-w-bazie"><xsl:value-of select="./cena"/><xsl:value-of select="./cena/@waluta"/></p>
        </div>
        <div class="produkt-buttons">
            <p><button class="produkt-button edytuj-button"><img src="https://img.icons8.com/fluent/48/000000/edit.png"/></button></p>
            <p><button class="produkt-button usun-button"><img src="https://img.icons8.com/fluent/48/000000/delete-sign.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="kartaGraficzna">
    <div class="pojedynczy-produkt">
        <div class="producent-model">
            producent: <p  class="producent-w-bazie"><xsl:value-of select="./producent"/></p>
            model: <p class="model-w-bazie"><xsl:value-of select="./model"/></p>
        </div>
        <div class="specyfikacje">
            czestotliwosc: <p class="specyfikacje-modyfikacja1"><xsl:value-of select="./specyfikacje/czestotliwosc"/><xsl:value-of select="./specyfikacje/czestotliwosc/@rodzaj"/></p>
            pamiec: <p class="specyfikacje-modyfikacja2"><xsl:value-of select="./specyfikacje/pamiec"/><xsl:value-of select="./specyfikacje/pamiec/@ilosc"/></p>
        </div>
        <div class="cena">
            cena: <p class="cena-w-bazie"><xsl:value-of select="./cena"/><xsl:value-of select="./cena/@waluta"/></p>
        </div>
        <div class="produkt-buttons">
            <p><button class="produkt-button edytuj-button"><img src="https://img.icons8.com/fluent/48/000000/edit.png"/></button></p>
            <p><button class="produkt-button usun-button"><img src="https://img.icons8.com/fluent/48/000000/delete-sign.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="twardyDysk">
    <div class="pojedynczy-produkt">
        <div class="producent-model">
            producent: <p  class="producent-w-bazie"><xsl:value-of select="./producent"/></p>
            model: <p class="model-w-bazie"><xsl:value-of select="./model"/></p>
        </div>
        <div class="specyfikacje">
            pamiec: <p class="specyfikacje-modyfikacja1"><xsl:value-of select="./specyfikacje/pamiec"/><xsl:value-of select="./specyfikacje/pamiec/@ilosc"/></p>
            format: <p class="specyfikacje-modyfikacja2"><xsl:value-of select="./specyfikacje/format"/></p>
        </div>
        <div class="cena">
            cena: <p class="cena-w-bazie"><xsl:value-of select="./cena"/><xsl:value-of select="./cena/@waluta"/></p>
        </div>
        <div class="produkt-buttons">
            <p><button class="produkt-button edytuj-button"><img src="https://img.icons8.com/fluent/48/000000/edit.png"/></button></p>
            <p><button class="produkt-button usun-button"><img src="https://img.icons8.com/fluent/48/000000/delete-sign.png"/></button></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="zamowienie">
    <div class="zamowienie-kontener">
        <div class="numer-zamowienia">
            <p>numer zamowienia: <xsl:value-of select="./@idZamowienia"/></p>
        </div>
        <div class="zamowiony-przedmiot">
            <xsl:apply-templates select="idZakupionego"/>
        </div>
        <div class="daneOsobowe">
            <p>imie: <xsl:value-of select="./daneOsobowe/imie"/></p>
            <p>nazwisko: <xsl:value-of select="./daneOsobowe/nazwisko"/></p>
            <p>numer telefonu: <xsl:value-of select="./daneOsobowe/nrTelefonu"/></p>
            <p>miasto: <xsl:value-of select="./daneOsobowe/miasto"/></p>
            <p>ulica: <xsl:value-of select="./daneOsobowe/ulica"/></p>
            <p>numer domu: <xsl:value-of select="./daneOsobowe/numerDomu"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="idZakupionego">
        <xsl:for-each select="./@idref">
            <p>id zamowionego przedmiotu: <xsl:value-of select="."/></p>
        </xsl:for-each>
</xsl:template>
</xsl:stylesheet>
