<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <!-- INUTILE : c'est un test de l'element xsl:number  -->

    <xsl:template match="/">
        <xsl:apply-templates select="tree/node"/>
    </xsl:template>

    <xsl:template match="node">
        <xsl:copy>
            <xsl:copy-of select="@name"/>
            <xsl:attribute name="pos"><xsl:number level="multiple" count="node"/></xsl:attribute>
            <xsl:apply-templates select="./node"/>
        </xsl:copy>
    </xsl:template>

</xsl:transform>