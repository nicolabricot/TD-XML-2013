<?xml version="1.0" ?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
>

<xsl:output method="xml" version="1.0" indent="yes"/>

<xsl:variable name="doc-robot" select="document('robot.xml')" />

<xsl:template match="/">
	<xsl:processing-instruction name="xml-stylesheet">
		type="text/xsl"
		href="robot2html.xsl"
	</xsl:processing-instruction>
	<robots>
		<xsl:apply-templates />
	</robots>
</xsl:template>

<xsl:template match="all">
	<xsl:copy-of select="$doc-robot//robot" />
</xsl:template>

<xsl:template match="name">
	<xsl:variable name="string" select="./@string" />
	<xsl:copy-of select="$doc-robot//robot[./@name = $string]" />
</xsl:template>

<xsl:template match="engine">
	<xsl:variable name="count" select="./@count" />
	<!--<robots>-->
	<xsl:copy-of select="$doc-robot//robot[count(.//roue[./@moteur = 'oui']) = $count]" />
	<!--</robots>-->
</xsl:template>

<xsl:template match="start">
	<xsl:variable name="string" select="./@string" />
	<xsl:copy-of select="$doc-robot//robot[starts-with(./@name, $string)]" />
</xsl:template>

<xsl:template match="or">
	<xsl:variable name="a">
		<xsl:apply-templates select="*[1]" />
	</xsl:variable>
	<xsl:variable name="b">
		<xsl:apply-templates select="*[2]" />
	</xsl:variable>
	<xsl:copy-of select="$a/robot" />
	<xsl:for-each select="$b/robot">
		<xsl:variable name="name" select="./@name" />
		<xsl:if test="not($a/robot[./@name = $name])">
			<xsl:copy-of select="." />
		</xsl:if>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
