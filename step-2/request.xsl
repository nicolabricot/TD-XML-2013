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
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="all">
	<xsl:copy-of select="$doc-robot" />
</xsl:template>

<xsl:template match="name">
	<xsl:copy-of select="$doc-robot/robot[./@name= ./@string]" />
</xsl:template>

</xsl:stylesheet>
