<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">

    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="profondeurMax" select="max(//leaf/@y)"/>
    <xsl:param name="espaceEntreFeuille" select="0.01"/>
    <xsl:param name="profondeurSize" select="5"/>
    <xsl:param name="lineSize" select="1"/>


    <xsl:param name="numberLeaf" select="count(//leaf)"/>
    <xsl:param name="espaceEntreFeuilleCercle" select="(2 * math:pi()) div $numberLeaf"/>


    <xsl:param name="height" select="$profondeurSize * $profondeurMax"/>
    <xsl:param name="width" select="$numberLeaf*$espaceEntreFeuille"/>



    <xsl:template match="/">
        <svg  xmlns="http://www.w3.org/2000/svg"
            height="{$height}" width="{$width}" version="1.0"
            xmlns:xlink="http://www.w3.org/1999/xlink">
            <xsl:apply-templates select="node" mode="cercle"/>
        </svg>
    </xsl:template>

    <xsl:template match="node" mode="cercle">
        <xsl:variable name="f" select="(./@x) * $espaceEntreFeuilleCercle"/>
        <xsl:variable name="xd" select="math:cos($f) * (./@y) * $profondeurSize"/>
        <xsl:variable name="yd" select="math:sin($f) * (./@y) * $profondeurSize"/>
        <xsl:variable name="xf" select="math:cos($f) * (./@y + 1) * $profondeurSize"/>
        <xsl:variable name="yf" select="math:sin($f) * (./@y + 1) * $profondeurSize"/>

        <xsl:variable name="xmin" select="math:cos($f) * (./@xmin) * ((./@y + 1) * $profondeurSize)"/>
        <xsl:variable name="xmax" select="math:cos($f) *  (./@xmax) * ((./@y + 1) * $profondeurSize)"/>

        <path d="M {$xd+200} {$yd+200} L {$xf+200} {$yf+200}"
        stroke="black" stroke-width="0.1"/>

        <!--
        <path d="M {$xmin+200} {$yf+200} A {(./@y + 1) * $profondeurSize} {(./@y + 1) * $profondeurSize} 0 {if((./@xmax - ./@xmin) &lt; math:pi() )then 0 else 1} 0 {$xmax+200} {$yf+200} "
        stroke="black" stroke-width="0.1" fill="none"/>
        -->

        <!--<path d="M {$xmin+200} {$yf+200} Q {(($xmin+ $xmax) div 2) + 200} {$yf+200} {$xmin+200} {$yf+200}"/>-->
        <xsl:apply-templates select="child::*" mode="#current"/>
        
    </xsl:template>

    <xsl:template match="leaf" mode="cercle">
        <xsl:variable name="f" select="(./@x) * $espaceEntreFeuilleCercle"/>
        <xsl:variable name="xd" select="math:cos($f) * (./@y)"/>
        <xsl:variable name="yd" select="math:sin($f) * (./@y)"/>
        <xsl:variable name="xf" select="math:cos($f) * (./@y + 1)"/>
        <xsl:variable name="yf" select="math:sin($f) * (./@y + 1)"/>
        <path d="M {$xd+200} {$yd+200} L {$xf+200} {$yf+200}"
        stroke="black" stroke-width="0.1"/>

    </xsl:template>











    <xsl:template match="node" mode="rectangle">
        <xsl:variable name="xd" select="(./@x) * $espaceEntreFeuille"/>
        <xsl:variable name="yd" select="(./@y) * $profondeurSize"/>
        <xsl:variable name="yf" select="$yd + $profondeurSize"/><!-- pareil que (./@y + 1) * profSize -->
        <xsl:variable name="xmin" select="(./@xmin) * $espaceEntreFeuille"/>
        <xsl:variable name="xmax" select="(./@xmax) * $espaceEntreFeuille"/>


        <path d="M {$xd} {$yd} V {$yf}"
        stroke="black" stroke-width="0.1"/> <!-- tire un trait vertical -->
        <path d="M {$xmin} {$yf} H {$xmax}"
        stroke="black" stroke-width="0.1"/> <!-- tire un trait horizontal entre xmin et xmax -->
        <xsl:apply-templates select="child::*" mode="#current"/>

    </xsl:template>

    <xsl:template match="leaf" mode="rectangle">
        <xsl:variable name="xd" select="(./@x) * $espaceEntreFeuille"/>
        <xsl:variable name="yd" select="(./@y) * $profondeurSize"/>
        <xsl:variable name="yf" select="$yd + $profondeurSize"/>

        <path d="M {$xd} {$yd} V {$yf}"
        stroke="black" stroke-width="0.1"/>

    </xsl:template>

</xsl:transform>