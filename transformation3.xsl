<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="tree//node[not(descendant::node())]"/>
    </xsl:template>

    <xsl:template match="node">
        <xsl:copy>
            <xsl:copy-of select="@name"/>
        </xsl:copy>
    </xsl:template>

</xsl:transform>