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



    <xsl:param name="espaceEntreFeuille" select="0.01"/>
    <xsl:param name="profondeurSize" select="5"/>
    <xsl:param name="lineSize" select="1"/>

    <xsl:param name="height" select="$profondeurSize * $profondeurMax"/>
    <xsl:param name="width" select="$numberLeaf*$espaceEntreFeuille"/>



    <xsl:template match="/">
        <svg  xmlns="http://www.w3.org/2000/svg"
            height="{$height}" width="{$width}" version="1.0"
            xmlns:xlink="http://www.w3.org/1999/xlink">
            <xsl:apply-templates select="node"/>
        </svg>
    </xsl:template>


    <xsl:template match="node" >
        <xsl:variable name="xd" select="(./@x) * $espaceEntreFeuille"/>
        <xsl:variable name="yd" select="(./@y) * $profondeurSize"/>
        <xsl:variable name="yf" select="$yd + $profondeurSize"/><!-- pareil que (./@y + 1) * profSize -->
        <xsl:variable name="xmin" select="(./@xmin) * $espaceEntreFeuille"/>
        <xsl:variable name="xmax" select="(./@xmax) * $espaceEntreFeuille"/>

        <path d="M {$xd} {$yd} V {$yf} M {$xmin} {$yf} H {$xmax}" stroke="black" stroke-width="0.1"/> <!-- tire un trait vertical --> <!-- tire un trait horizontal entre xmin et xmax -->
        
        <xsl:apply-templates select="child::*" />
    </xsl:template>

    <xsl:template match="leaf">
        <xsl:variable name="xd" select="(./@x) * $espaceEntreFeuille"/>
        <xsl:variable name="yd" select="(./@y) * $profondeurSize"/>
        <xsl:variable name="yf" select="$yd + $profondeurSize"/><!-- pareil que (./@y + 1) * profSize -->
        <path d="M {$xd} {$yd} V {$yf}" stroke="black" stroke-width="0.1"/> <!-- tire un trait vertical -->
    </xsl:template>

</xsl:transform>