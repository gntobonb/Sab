<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl">
  <xsl:output method="xhtml"/>
  
<!--VARIABLES-->
  <xsl:variable name="anterior">
    <xsl:value-of select="//body/@prev"/>
  </xsl:variable>
  
  <xsl:variable name="siguiente">
    <xsl:value-of select="//body/@next"/>
  </xsl:variable>
  
  
  <xsl:variable name="numcap" as="xs:integer">
    <xsl:value-of select="//body/@n" />
  </xsl:variable>
  
  <xsl:variable name="anteriorromano" as="xs:string">
    <xsl:number value="$numcap - 1" format="I"/>
  </xsl:variable>
  
  
  <xsl:variable name="siguienteromano" as="xs:string">
    <xsl:number value="$numcap + 1" format="I"/>
  </xsl:variable>
  
  <xsl:template match="/">
    <html>
      <head>
        <script src="https://kit.fontawesome.com/c4698d6243.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato|Source+Serif+Pro"></link>
        <link rel="stylesheet" href="css/estilo.css"></link>
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
        
        
        
        
<!--BOTONES-->
        <br/>
        <xsl:if test="//body/@prev">
          <a class="anterior">
            <xsl:attribute name="href">
              <xsl:value-of select="concat('https://gntobonb.github.io/Sab/', $anterior, '.html')"/>
            </xsl:attribute>
            
            <xsl:text>Capítulo </xsl:text>
            <xsl:value-of select="$anteriorromano"/>
            
          </a> 
        </xsl:if>
        
        
        <xsl:if test="//body/@next">
          <a class="siguiente">
            <xsl:attribute name="href">
              <xsl:value-of select="concat('https://gntobonb.github.io/Sab/', $siguiente, '.html')"/>
            </xsl:attribute>
            <xsl:text>Capítulo </xsl:text>
            <xsl:value-of select="$siguienteromano"/>
          </a>
        </xsl:if>
        <br/>
        
        <script type="text/javascript" src="js/sab.js"></script>
      </body>
    </html>
  </xsl:template>
  
  
  
  
  
  <!--ESTO OCULTA TeiHeader--> 
  <xsl:template match="/TEI/teiHeader">
    <!--no haga nada-->
  </xsl:template>
  
  
  
  
  
  <!--TÍTULO-->
  <xsl:template match="div[@type='titulo']/p">
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
  <xsl:template match="quote[@type='cita']">
    <div class="quote">
      <xsl:apply-templates/>
    </div>    
  </xsl:template>
  
  
  
  
  
  
  <!--AÑADIDURAS-->
  <xsl:template match="corr">
    <span class="agregado">
      <span class="aplicado">(corr.) </span><xsl:apply-templates/>
    </span>
  </xsl:template>
  
  
  <!--ABREVIATURAS-->
  <xsl:template match="abbr">
    <span class="abreviatura"><xsl:text>(abrev.) </xsl:text> <xsl:apply-templates/>
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
    <xsl:variable name="idnota">
      <xsl:value-of select="generate-id()"/>
    </xsl:variable>
    <div class="nota">
      <input type="checkbox">
        <xsl:attribute name="id">
          <xsl:value-of select="$idnota"/>
        </xsl:attribute>
      </input>
      <label>
        <xsl:attribute name="for">
          <xsl:value-of select="$idnota"/>
        </xsl:attribute>
        <sup>*</sup>
      </label>
      <span><div class="regulado"><span class="abreviatura">Nota expositiva</span><xsl:text>N. E. </xsl:text></div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  
  
  <!--NOTAS CRÍTICAS-->
  <xsl:template match="note[@type='critico']">
    <xsl:variable name="idnota">
      <xsl:value-of select="generate-id()"/>
    </xsl:variable>
    <div class="nota">
      <input type="checkbox">
        <xsl:attribute name="id">
          <xsl:value-of select="$idnota"/>
        </xsl:attribute>
      </input>
      <label>
        <xsl:attribute name="for">
          <xsl:value-of select="$idnota"/>
        </xsl:attribute>
        <sup>*</sup>
      </label>
      <span><div class="regulado"><span class="abreviatura">Nota crítica</span><xsl:text>N. C. </xsl:text></div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  
  <!--NOTAS DE LA AUTORA-->
  <xsl:template match="note[@type='autora']">
    <xsl:variable name="idnota">
      <xsl:value-of select="generate-id()"/>
    </xsl:variable>
    <div class="nota">
      <input type="checkbox">
        <xsl:attribute name="id">
          <xsl:value-of select="$idnota"/>
        </xsl:attribute>
      </input>
      <label>
        <xsl:attribute name="for">
          <xsl:value-of select="$idnota"/>
        </xsl:attribute>
        <sup>*</sup>
      </label>
      <span><div class="regulado"><span class="abreviatura">Nota de la autora</span><xsl:text>N. A. </xsl:text></div>
        <xsl:apply-templates/></span>
    </div>
  </xsl:template>
  
  
  
  
  <!--DIÁLOGOS-->  
  <xsl:template match="/TEI/text/body/div/sp/p"><div class="dialogo"><xsl:text>—</xsl:text><xsl:apply-templates/></div></xsl:template>
  
  <!--PÁRRAFOS-->
  <xsl:template match="p"><div><xsl:apply-templates/></div></xsl:template>
  
  
  
  <!--CARTAS-->
  <xsl:template match="div[@type='carta']"><div class="carta"><xsl:apply-templates/></div></xsl:template>
  
  
  
  <!--PÁGINAS-->
  <xsl:template match="pb">
    <span class="pagina"><xsl:text>|</xsl:text>
      <span class="numero">p. <xsl:value-of select="@n"/>
        <xsl:apply-templates/>
      </span></span>
  </xsl:template>
  
 
  
  
  
  
  
  
  
  
</xsl:stylesheet>