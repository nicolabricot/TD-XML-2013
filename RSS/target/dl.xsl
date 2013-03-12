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
	<xsl:variable name="merged">
		<xsl:apply-templates mode="download"/>
	</xsl:variable>
	<xsl:apply-templates select="$merged" mode="html"/>
</xsl:template>

	<xsl:template match="sources">
		<rss>
				<xsl:apply-templates select="channel" mode="download"/>
		</rss>
	</xsl:template>
 
	<xsl:template match="channel" mode="download">
		<xsl:variable name="url" select="@url"/>
		<xsl:variable name="c" select="document($url)"/>
		<xsl:copy-of select="$c/rss/channel" />
	</xsl:template>

</xsl:stylesheet>
