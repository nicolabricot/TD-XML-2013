<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	>

<xsl:output method="html"/>

<xsl:template match="/">
	<html lang="fr-fr">
		<head>
			<meta charset="utf-8" />
			<title>Robots</title>
			<style>
				
			</style>
		</head>
		<body>
			<h1>Robots</h1>
			<xsl:apply-templates />
		</body>
	</html>
</xsl:template>

<xsl:template match="robot">
	<h2><xsl:value-of select="./@name"/></h2>
	<ul>
		<li>Prix : <xsl:value-of select="sum(.//*/@price)" /> €</li>
		<xsl:apply-templates />
		<!--<li>Nombre de roues : <xsl:value-of select="count(./axe/roue)" /></li>-->
		<li>Nombre de roues : <xsl:value-of select="count(.//roue)" /></li>
		<li>Nombre de roues motrices : <xsl:value-of select="count(.//roue[./@moteur='oui'])" /></li>
	</ul>
</xsl:template>

<xsl:template match="corps">
	<li>Longueur : <xsl:value-of select="./@w" /> cm</li>
	<li>Largeur : <xsl:value-of select="./@h" /> cm</li>
	<li>Surface : <xsl:value-of select="./@w * ./@h" /> cm&#178;</li>
</xsl:template>

<xsl:template match="pivot">
	<li>Pivot : <xsl:value-of select="../@position" />&#160;<xsl:value-of select="./@position" />&#160;<xsl:value-of select="./@mode" /></li>
</xsl:template>

</xsl:stylesheet>
