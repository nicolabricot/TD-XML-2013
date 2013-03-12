<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2004/07/xpath-functions"
	xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">

	<xsl:output method="xml" indent="yes"/>

<xsl:template match="/">
	<xsl:processing-instruction name="xml-stylesheet">
		type="text/xsl"
		href="rss2html.xsl"
	</xsl:processing-instruction>
	<xsl:apply-templates />
</xsl:template>

	<xsl:template match="sources">
		<rss>
				<xsl:apply-templates select="channel"/>
		</rss>
	</xsl:template>
 
	<xsl:template match="channel">
	</xsl:template>

</xsl:stylesheet>
