<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math">

    <xsl:output method="xml" indent="yes"/>

    <xsl:param name="leafs" select="//leaf"/>
    <xsl:param name="profondeurMax" select="max($leafs/@y)"/>
    <xsl:param name="numberLeaf" select="count($leafs)"/>

    <xsl:param name="documentSize" select="30"/>

    <xsl:param name="rayon" select="$documentSize div 2"/><!--  centre : x et y-->

    <xsl:param name="espaceEntreFeuille" select="(2 * math:pi()) div $numberLeaf"/>
    <xsl:param name="profondeurSize" select="$rayon div ($profondeurMax + 1)"/>
    <xsl:param name="lineSize" select="1"/>


    <xsl:template match="/">
        <svg  xmlns="http://www.w3.org/2000/svg"
            height="{$documentSize}" width="{$documentSize}" version="1.0"
            xmlns:xlink="http://www.w3.org/1999/xlink">
            <xsl:apply-templates select="node"/>
        </svg>
    </xsl:template>

    <xsl:template match="node">

        <xsl:variable name="angle" select="(./@x) * $espaceEntreFeuille"/>
        <xsl:variable name="rayon0" select=" (./@y) * $profondeurSize"/>
        <xsl:variable name="rayon1" select=" (./@y + 1) * $profondeurSize"/>

        <xsl:variable name="xd" select="math:cos($angle) * $rayon0"/>
        <xsl:variable name="yd" select="math:sin($angle) * $rayon0"/>
        <xsl:variable name="xf" select="math:cos($angle) * $rayon1"/>
        <xsl:variable name="yf" select="math:sin($angle) * $rayon1"/>

        <xsl:variable name="anglexmin" select="(./@xmin) * $espaceEntreFeuille"/>
        <xsl:variable name="anglexmax" select="(./@xmax) * $espaceEntreFeuille"/>
        <xsl:variable name="xdmin" select="math:cos($anglexmin) * $rayon1"/>
        <xsl:variable name="ydmin" select="math:sin($anglexmin) * $rayon1"/>
        <xsl:variable name="xfmax" select="math:cos($anglexmax) * $rayon1"/>
        <xsl:variable name="yfmax" select="math:sin($anglexmax) * $rayon1"/>

        <xsl:variable name="plus180" select="if(($anglexmax - $anglexmin) >= math:pi()) then 1 else 0"/>

        <path d="M {$xd+$rayon} {$yd+$rayon} L {$xf+$rayon} {$yf+$rayon}"
        stroke="black" stroke-width="0.1"/>

        <path d="M {$xdmin+$rayon} {$ydmin+$rayon} A {$rayon1} {$rayon1} 0 {$plus180} 1 {$xfmax+$rayon} {$yfmax+$rayon}"
        stroke="black" stroke-width="0.1" fill="none"/>

        <xsl:apply-templates select="child::*"/>
    
    </xsl:template>

    <xsl:template match="leaf" >
    
        <xsl:variable name="angle" select="(./@x) * $espaceEntreFeuille"/>
        <xsl:variable name="rayon0" select=" (./@y) * $profondeurSize"/>
        <xsl:variable name="rayon1" select=" (./@y + 1) * $profondeurSize"/>
        <xsl:variable name="xd" select="math:cos($angle) * (./@y) * $profondeurSize"/>
        <xsl:variable name="yd" select="math:sin($angle) * (./@y) * $profondeurSize"/>
        <xsl:variable name="xf" select="math:cos($angle) * (./@y + 1) * $profondeurSize"/>
        <xsl:variable name="yf" select="math:sin($angle) * (./@y + 1) * $profondeurSize"/>

        <path d="M {$xd+$rayon} {$yd+$rayon} L {$xf+$rayon} {$yf+$rayon}" stroke="black" stroke-width="0.1"/>
        <!--
        <xsl:if test="(./@y) != $profondeurMax">
            <xsl:variable name="xff" select="math:cos($angle) * ($profondeurMax + 1) * $profondeurSize"/>
            <xsl:variable name="yff" select="math:sin($angle) * ($profondeurMax + 1) * $profondeurSize"/>  
            <path d="M {$xf+$rayon} {$yf+$rayon} L {$xff+$rayon} {$yff+$rayon}" stroke="black" stroke-width="0.1" stroke-dasharray="0.1"/>
        </xsl:if>
        -->
    </xsl:template>

</xsl:transform>