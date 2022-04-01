<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">

  <xsl:output method="xhtml"/>
  
  

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="cap1.css"/>
        <title>
          <xsl:value-of select="/TEI/teiHeader/fileDesc/titleStmt/title"/>
        </title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  
  
  
  
  
  <!--ESTO OCULTA TeiHeader--> 
  <xsl:template match="/TEI/teiHeader">
    <!--no haga nada-->
  </xsl:template>

  
  
  
  
  
  
  <!--TÍTULO-->
  <xsl:template match="div[@type='titulo']">
    <h1>
      <xsl:apply-templates/>
    </h1>
  </xsl:template>
  
  
  
  
  
<!--<!-\-EPÍGRAFE-\->
  <xsl:template match="/TEI/text[1]/body[1]/div[2]/quote[1]">
        <div class="epigrafe">
        <xsl:apply-templates/>
        </div>
  </xsl:template>
  
  <xsl:template match="/TEI/text[1]/body[1]/div[2]/p[1]">
    <div class="epigrafe">
      <xsl:apply-templates/>
    </div>
  </xsl:template>-->
  
  
  
<!--SALTOS DE LÍNEA-->
  <xsl:template match="l">
    <br>
      <xsl:apply-templates/>
      </br>
  </xsl:template>
  
  
  
<!--ELIMINADO-->
  <xsl:template match="sic">
    <div class="eliminado">
      <sup>^</sup>
      <span class="sic"> (sic)
        <xsl:apply-templates/>
    </span></div>
  </xsl:template>
  
  
  
  
  
  
<!--<!-\-CITAS-\->
  <xsl:template match="/TEI/text[1]/body[1]/div[7]/quote[1]">
    <div class="quote">
      <xsl:apply-templates/>
    </div>    
  </xsl:template>
  
  <xsl:template match="p">
      <xsl:apply-templates/>
  </xsl:template>-->
  
  
  
  
  
  <!--AÑADIDURAS-->
  <xsl:template match="corr">
    <div class="agregado">
      <span class="aplicado">(corr.) </span><xsl:apply-templates/>
    </div>
  </xsl:template>
  
  
  
  
  
<!--ORTOGRAFÍA-->
  <xsl:template match="orig">
    <span class="original">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  <xsl:template match="choice">
    <div class="regulado">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  
  
  
  
  
  <!--NOTAS EXPOSITIVAS-->
  <xsl:template match="note[@type='expo']">
    <div class="nota"><input type="checkbox" id="cb"/>
    <label for="cb">
      <sup>*</sup>
    </label>
      <span><div class="regulado"><span class="abreviatura">Nota expositiva</span>N. E. </div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  
  <!--NOTAS CRÍTICAS-->
  <xsl:template match="note[@type='critico']">
    <div class="nota"><input type="checkbox" id="cb"/>
    <label for="cb">
      <sup>*</sup>
    </label>
      <span><div class="regulado"><span class="abreviatura">Nota crítica</span>N. C. </div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  <!--NOTAS DE LA AUTORA-->
  <xsl:template match="note[@type='autora']">
    <div class="nota"><input type="checkbox" id="cb"/>
    <label for="cb">
      <sup>*</sup>
    </label>
    <span><div class="regulado"><span class="abreviatura">Nota de la autora</span>N. A. </div><xsl:apply-templates/></span></div>
  </xsl:template>
  
  
  
  <!--DIALOGOS-->  
  <xsl:template match="/TEI/text/body/div/sp/p">
    <div class="dialogo">
      <xsl:text>—</xsl:text>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
<!--PÁRRAFOS-->
  <xsl:template match="/TEI/text/body/div">
    <div><xsl:text/>
    <xsl:apply-templates/></div>
  </xsl:template>
  
  <xsl:template match="/TEI/text/body/div/p">
      <p>
        <xsl:apply-templates/>
      </p>
  </xsl:template>
  
  
  <!--ABREVIATURAS-->
  <xsl:template match="abbr">
    <span class="abreviatura">(abrev.) <xsl:apply-templates/>
    </span>
  </xsl:template>
  
  
  
<!--PÁGINAS-->
  <xsl:template match="pb">
    <div class="pagina">|
      <span class="numero">p. <xsl:value-of select="@n"/>
    <xsl:apply-templates/>
    </span></div>
  </xsl:template>
  
  
  
  
  
  
  
  
  
  
</xsl:stylesheet>