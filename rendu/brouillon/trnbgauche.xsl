<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <!-- Transformation qui permet de mettre un attribut x a toute les feuilles en renommant l'element en 'leaf': x est la numérotation des feuilles de gauche a droite-->

    <xsl:template match="/">
        <xsl:apply-templates select="/node"/>
    </xsl:template>

    <!-- Template qui match avec des noeuds qui n'ont pas de fils -->
    <xsl:template match="node[not(node)]">
        <xsl:element name="leaf">
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="x"><xsl:number level="any" count="//node[not(node)]"/></xsl:attribute><!-- number permet de compter tous les element de gauche qui sont des feuilles -->
            <!--<xsl:apply-templates select="./node"/>-->
        </xsl:element>

    </xsl:template>

    <!-- Template qui match avec tous les autres noeuds -->
    <xsl:template match="node">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="./node"/>
        </xsl:copy>
    </xsl:template>

</xsl:transform>