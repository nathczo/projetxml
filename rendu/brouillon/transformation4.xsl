<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <!-- PAS PAS UTILISER CAR transformation5.xsl le fait -->
    <xsl:template match="/">
        <xsl:apply-templates select="node"/>
    </xsl:template>

    <xsl:template match="node">
        <xsl:variable name="childs">
            <xsl:apply-templates select="child::*"/>
        </xsl:variable>
        <xsl:variable name="xmin" select="$childs/*[1]/@x"/><!-- * car peut etre une feuille ou un noeud -->
        <xsl:variable name="xmax" select="$childs/*[count($childs/*)]/@x"/>

        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="xmin" select="$xmin"/>
            <xsl:attribute name="xmax" select="$xmax"/>
            <xsl:attribute name="x"><xsl:value-of select="($xmin + $xmax) div 2"/></xsl:attribute>
            <xsl:copy-of select="$childs"/>
        </xsl:copy>

    </xsl:template>

    <xsl:template match="leaf">
        <xsl:copy-of select="."/>
    </xsl:template>

</xsl:transform>