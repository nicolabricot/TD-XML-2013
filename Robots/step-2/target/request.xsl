<?xml version="1.0" ?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
>

<xsl:output method="xml" version="1.0" indent="yes"/>

<xsl:variable name="robots" select="document('robot.xml')"/>

<xsl:template match="/">
	<xsl:processing-instruction name="xml-stylesheet">
		type="text/xsl"
		href="robot2html.xsl"
	</xsl:processing-instruction>
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="request">
	<robots>
		<xsl:apply-templates />
	</robots>
</xsl:template>

<!--Attention à cause de la balise bidon-->
<xsl:template match="*"/>

<xsl:template match="all">
	<xsl:copy-of select="$robots//robot"/>
</xsl:template>

<xsl:template match="name">
	<xsl:variable name="key" select="@string"/>
	<xsl:copy-of select="$robots//robot[@name=$key]"/>
</xsl:template>

<xsl:template match="start">
	<xsl:variable name="key" select="@string"/>
	<xsl:copy-of select="$robots//robot[starts-with(@name,$key)]"/>
</xsl:template>

<xsl:template match="engine">
	<xsl:variable name="key" select="@count"/>
	<xsl:copy-of select="$robots//robot[count(.//roue[@moteur='oui'])=$key]"/>
</xsl:template>

<xsl:template match="and">
	<xsl:variable name="a">
		<xsl:apply-templates select="*[1]"/>
	</xsl:variable>
	<xsl:variable name="b">
		<xsl:apply-templates select="*[2]"/>
	</xsl:variable>
	<xsl:for-each select="$b/*">
		<xsl:variable name="name" select="./@name"/>
		<xsl:copy-of select="$a/*[@name = $name]"/>
	</xsl:for-each>
</xsl:template>

<xsl:template match="or">
	<xsl:variable name="a">
		<xsl:apply-templates select="*[1]"/>
	</xsl:variable>
	<xsl:variable name="b">
		<xsl:apply-templates select="*[2]"/>
	</xsl:variable>
	<xsl:for-each select="exsl:node-set($a)">
		<xsl:variable name="name" select="./@name"/>
		<xsl:if test="not($b/*[@name = $name])">
			<xsl:copy-of select="."/>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

</xsl:stylesheet>
