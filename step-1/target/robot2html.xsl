<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml"
	>

<xsl:output method="html"/>

<xsl:template match="/">
	<html>
		<head>
		<title>Document robot</title>
		</head>
		<body>
			<xsl:apply-templates select="//robot" mode="description"/>
		</body>
	</html>
</xsl:template>

<xsl:template match="robot" mode="description">
	<h2>Composition du robot <xsl:value-of select="@name"/></h2>
	<ul>
		<li>Prix :<xsl:value-of select="sum(descendant-or-self::*/@prix)"/></li>
		<li><xsl:value-of select="count(.//roue[@moteur='oui'])"/> roues motrices (<xsl:value-of select=".//roue[@moteur='oui']/../@position"/>) </li>
		<xsl:apply-templates mode="description"/>
	</ul>
</xsl:template>

<xsl:template match="corps" mode="description">
	<li>Dimensions w*h : <xsl:value-of select="@w"/> * <xsl:value-of select="@h"/> </li>
	<li>Surface caisse : <xsl:value-of select="@h * @w"/> </li>
</xsl:template>

<xsl:template match="axe" mode="description">
	<li>Axe <xsl:value-of select="./@position"/> : <xsl:value-of select="./pivot/@mode"/></li>
</xsl:template>

</xsl:stylesheet>
