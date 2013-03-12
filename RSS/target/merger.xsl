<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2004/07/xpath-functions"
	xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes">

<xsl:output method="html"/>

<xsl:template match="/">
	<xsl:variable name="merged">
		<xsl:apply-templates mode="download"/>
	</xsl:variable>
	<xsl:apply-templates select="$merged" mode="html"/>
</xsl:template>

<xsl:template match="sources" mode="download">
	<rss>
			<xsl:apply-templates select="channel" mode="download"/>
	</rss>
</xsl:template>

<xsl:template match="channel" mode="download">
	<xsl:variable name="url" select="@url"/>
	<xsl:variable name="c" select="document($url)"/>
	<xsl:copy-of select="$c/rss/channel" />
</xsl:template>

<xsl:template match="/" mode="html">
  <html>
	 <head>
	   <title>
	   <xsl:choose>
		   <xsl:when test="count(rss/channel)=1"><xsl:value-of select="rss/channel/title"/></xsl:when>
		   <xsl:otherwise>Agregation : <xsl:value-of select="rss/channel/title" separator="|"/></xsl:otherwise>
		</xsl:choose>
	 </title>
	 </head>
	 <body>
		 <xsl:apply-templates mode="html"/>
	 </body>
  </html>
</xsl:template>

<xsl:template match="rss" mode="html">
	<table border="1">
		<xsl:apply-templates select="channel/item" mode="html"/>
	</table>
</xsl:template>

<xsl:template match="item" mode="html">
	<tr>
		<td>
			<xsl:value-of select="pubDate"/>
		</td>
		<td>
			<a href="{link}"><xsl:value-of select="title"/></a>
		</td>
		<xsl:if test="../image/url">
			<td>
				<a href="{../link}"><img src="{../image/url}" alt="{../image/title}"/></a>
			</td>
		</xsl:if>
	</tr>
	<tr>
		<td>
			<xsl:if test="enclosure/@url">
				<img src="{enclosure/@url}"/>
			</xsl:if>
		</td>
		<td>
			<xsl:value-of select="./description"/>
		</td>
	</tr>
</xsl:template>

</xsl:stylesheet>
