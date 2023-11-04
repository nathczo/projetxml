<?xml version="1.0"?>
<xsl:transform 
    version="2.0" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <!-- Transformation qui permet d'avoir des noeuds dans des noeuds-->

    <xsl:key name="preg" match="node" use="@id"/> <!-- Recupérer un noeud à partir de son @id -->


    <xsl:template match="/">
    
        <xsl:apply-templates select="tree/node except tree/key('preg',node/child/@idref)"/>    <!-- Pour trouver le noeud racine : prendre tout les noeud et retirer ceux qui ont un @idref-->
    </xsl:template>

    <xsl:template match="node">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="key('preg',./child/@idref)"/><!-- Appelle le même template que le noeud actuel (.) sur tous ses enfants noeuds -->
        </xsl:copy>
    </xsl:template>

</xsl:transform>