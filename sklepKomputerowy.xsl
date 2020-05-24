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
                <h3 class="tytul-produktu">Procesory</h3>
                <div class="produkty">
                    <xsl:for-each select="sklepKomputerowy/produkty">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
                <h3 class="tytul-produktu">Karty Graficzne</h3>
                <div class="produkty">
                    <xsl:for-each select="sklepKomputerowy/produkty">
                        <xsl:apply-templates/>
                    </xsl:for-each>
                </div>
                <h3 class="tytul-produktu">Twarde Dyski</h3>
                <div class="produkty">
                    <xsl:for-each select="sklepKomputerowy/produkty">
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
    </body>
</html>
</xsl:template>

<xsl:template match="procesor">
    <div class="pojedynczy-produkt">
        <div class="producent-model">
            <p>producent: <xsl:value-of select="./producent"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="specyfikacje">
            <p>czestotliwosc: <xsl:value-of select="./specyfikacje/czestotliwosc"/><xsl:value-of select="./specyfikacje/czestotliwosc/@rodzaj"/></p>
            <p>liczba rdzeni: <xsl:value-of select="./specyfikacje/liczbaRdzeni"/></p>
        </div>
        <div class="cena">
            <p>cena: <xsl:value-of select="./cena"/><xsl:value-of select="./cena/@waluta"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="kartaGraficzna">
    <div class="pojedynczy-produkt">
        <div class="producent-model">
            <p>producent: <xsl:value-of select="./producent"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="specyfikacje">
            <p>czestotliwosc: <xsl:value-of select="./specyfikacje/czestotliwosc"/><xsl:value-of select="./specyfikacje/czestotliwosc/@rodzaj"/></p>
            <p>pamiec: <xsl:value-of select="./specyfikacje/pamiec"/><xsl:value-of select="./specyfikacje/pamiec/@ilosc"/></p>
        </div>
        <div class="cena">
            <p>cena: <xsl:value-of select="./cena"/><xsl:value-of select="./cena/@waluta"/></p>
        </div>
    </div>
</xsl:template>

<xsl:template match="twardyDysk">
    <div class="pojedynczy-produkt">
        <div class="producent-model">
            <p>producent: <xsl:value-of select="./producent"/></p>
            <p>model: <xsl:value-of select="./model"/></p>
        </div>
        <div class="specyfikacje">
            <p>pamiec: <xsl:value-of select="./specyfikacje/pamiec"/><xsl:value-of select="./specyfikacje/pamiec/@ilosc"/></p>
            <p>format: <xsl:value-of select="./specyfikacje/format"/></p>
        </div>
        <div class="cena">
            <p>cena: <xsl:value-of select="./cena"/><xsl:value-of select="./cena/@waluta"/></p>
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
