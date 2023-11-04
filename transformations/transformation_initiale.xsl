<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:key name="preg" match="link" use="@source_node_id"/> <!-- Recupérer un noeud à partir de son @id -->


    <xsl:template match="/">
        <tree>
            <xsl:apply-templates select="tree/nodes/node"/>
        </tree>
    </xsl:template>

    <xsl:template match="node">
        <xsl:copy>
            <xsl:attribute name="id" select="@node_id"/>
            <xsl:copy-of select="@*[name()!='node_id']"/>
            <xsl:apply-templates select="following::links/key('preg',current()/@node_id)"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="link">
        <xsl:element name="child">
            <xsl:attribute name="idref" select="@target_node_id"/>
        </xsl:element>
    </xsl:template>

</xsl:transform>