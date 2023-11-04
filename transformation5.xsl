<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="node">
            <xsl:with-param name="profondeur" select="0"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="node">
        <xsl:param name="profondeur"/>
        <xsl:variable name="childs">
            <xsl:apply-templates select="child::*">
                <xsl:with-param name="profondeur" select="$profondeur+1"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:variable name="xmin" select="$childs/*[1]/@x"/>
        <xsl:variable name="xmax" select="$childs/*[count($childs/*)]/@x"/>

        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="xmin" select="$xmin"/>
            <xsl:attribute name="xmax" select="$xmax"/>
            <xsl:attribute name="x"><xsl:value-of select="($xmin + $xmax) div 2"/></xsl:attribute>
            <xsl:attribute name="y" select="$profondeur"/>
            <xsl:copy-of select="$childs"/>
        </xsl:copy>

    </xsl:template>

    <xsl:template match="leaf">
        <xsl:param name="profondeur"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="y" select="$profondeur"/>
        </xsl:copy>
    </xsl:template>

</xsl:transform>