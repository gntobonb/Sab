<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
  
  <xsl:output method="xhtml"/>
  
  
  
  <xsl:template match="/">
    <html>
      <head>
        <script src="https://kit.fontawesome.com/c4698d6243.js" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Source+Serif+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900;display=swap" rel="stylesheet"></link>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,700;1,900;display=swap" rel="stylesheet"></link>
        <link rel="stylesheet" href="css/cap1.css"></link>
        <link rel="shortcut icon" href="img/portada.png" type="image/x-icon"></link>
        <title>
          <xsl:value-of select="/TEI/teiHeader/fileDesc/titleStmt/title"/>
        </title>
        <header>
          <div class="titulo">
            <h1>
              <a href="https://gntobonb.github.io/Sab/index.html">Sab</a>
            </h1>
          </div>
          
          <button class="switch" id="switch" onclick="myFunction()">
            <span class="oscuro">
              <i class="far fa-lightbulb"></i>
            </span>
          </button>
          
          <span class="autor">
            <p>| Gertrudis Gómez de Avellaneda</p>
          </span>
          
          <img class="portada" src="img/portada.png"></img>
          
          <span class="indice">
            <a href="https://gntobonb.github.io/Sab/tabla_de_contenidos.html" class="boton">Índice</a>
          </span>
          
          <span class="repositorio">
            <p>Acceda al respositorio <a href="https://github.com/gntobonb/Sab" class="boton">gntobonb/Sab</a></p>
          </span>
          
        </header>
      </head>
      
      <body>
        <xsl:apply-templates/>
        <br/>
        <a href="https://gntobonb.github.io/Sab/1cap1.html" class="anterior"><xsl:text>Capítulo I</xsl:text></a>
        <a href="https://gntobonb.github.io/Sab/1cap3.html" class="siguiente"><xsl:text>Capítulo III</xsl:text></a>
        <br/>
        
        <script type="text/javascript" src="js/sab.js"></script>
      </body>
    </html>
  </xsl:template>
  
  
  
  
  
  <!--ESTO OCULTA TeiHeader--> 
  <xsl:template match="/TEI/teiHeader[1]">
    <!--no haga nada-->
  </xsl:template>
  
  <xsl:template match="/TEI/text[1]/body[1]/div[1]/p[1]">
    <!--no haga nada-->
  </xsl:template>
  
  <xsl:template match="/TEI/text[1]/body[1]/div[1]/p[2]">
    <!--no haga nada-->
  </xsl:template>
  
  
  
  
  
  
  <!--TÍTULO-->
  <xsl:template match="span[@type='titulo']">
    <h1>
      <xsl:apply-templates/>
    </h1>
  </xsl:template>
  
  
  
  
  
  <!--EPÍGRAFE-->
  <xsl:template match="quote[@type='epigrafe']">
    <div class="epigrafe">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!--<xsl:template match="/TEI/text[1]/body[1]/div[2]/p[1]">
    <div class="epigrafe">
      <xsl:apply-templates/>
    </div>
  </xsl:template>-->
  
  
  
  <!--SALTOS DE LÍNEA-->
  <xsl:template match="l">
    <xsl:apply-templates/>
    <br/>
  </xsl:template>
  
  
  
  <!--ELIMINADO-->
  <xsl:template match="sic">
    <span class="eliminado">
      <sup>^</sup>
      <span class="sic"> (sic)
        <xsl:apply-templates/>
      </span></span>
  </xsl:template>
  
  
  
  
  
  
  <!--CITAS-->
  <xsl:template match="/TEI/text[1]/body[1]/div[7]/quote[1]">
    <div class="quote">
      <xsl:apply-templates/>
    </div>    
  </xsl:template>
  
  <xsl:template match="p">
    <xsl:apply-templates/>
  </xsl:template>
  
  
  
  
  
  <!--AÑADIDURAS-->
  <xsl:template match="corr">
    <span class="agregado">
      <span class="aplicado">(corr.) </span><xsl:apply-templates/>
    </span>
  </xsl:template>
  
  
  <!--ABREVIATURAS-->
  <xsl:template match="abbr">
    <span class="abreviatura"><xsl:text>(abrev.)</xsl:text> <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  
  <!--ORTOGRAFÍA-->
  <xsl:template match="orig">
    <span class="original">
      <xsl:text></xsl:text>
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="choice">
    <span class="regulado">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  
  <!--NOTAS EXPOSITIVAS-->
  <xsl:template match="note[@type='expo']">
    <div class="nota"><input type="checkbox" id="cb"/>
      <label for="cb">
        <sup>*</sup>
      </label>
      <span><div class="regulado"><span class="abreviatura">Nota expositiva</span><xsl:text>N. E. </xsl:text></div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  
  <!--NOTAS CRÍTICAS-->
  <xsl:template match="note[@type='critico']">
    <div class="nota"><input type="checkbox" id="cb"/>
      <label for="cb">
        <sup>*</sup>
      </label>
      <span><div class="regulado"><span class="abreviatura">Nota crítica</span><xsl:text>N. C. </xsl:text></div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  <!--NOTAS DE LA AUTORA-->
  <xsl:template match="note[@type='autora']">
    <div class="nota"><input type="checkbox" id="cd"/>
      <label for="cb">
        <sup>*</sup>
      </label>
      <span><div class="regulado"><span class="abreviatura">Nota de la autora</span><xsl:text>N. A. </xsl:text></div><xsl:apply-templates/></span></div>
  </xsl:template>
  
  
  
  <!--DIÁLOGOS-->  
  <xsl:template match="/TEI/text/body/div/sp/p"><div class="dialogo"><xsl:text>—</xsl:text><xsl:apply-templates/></div></xsl:template>
  
  <!--PÁRRAFOS-->
  <xsl:template match="/TEI/text/body/div/div/p"><p><xsl:apply-templates/></p></xsl:template>
  
  
  <!--CARTAS-->
  
  <xsl:template match="div[@type='carta']"><div class="carta"></div></xsl:template>
  
  
  
  <!--PÁGINAS-->
  <xsl:template match="pb">
    <span class="pagina"><xsl:text>|</xsl:text>
      <span class="numero">p. <xsl:value-of select="@n"/>
        <xsl:apply-templates/>
      </span></span>
  </xsl:template>
  
  
  
  
  
  
  
  
  
  
</xsl:stylesheet>