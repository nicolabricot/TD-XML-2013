<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="price" select="document('price.xml')" />

<xsl:template name="getPrice">
	<xsl:param name="PN" />
	<xsl:value-of select="$price//product[./@PN = $PN]/@price" />
</xsl:template>
	
<xsl:template match="/">
	<xsl:processing-instruction name="xml-stylesheet">
		type="text/xsl"
		href="robot2html.xsl"
	</xsl:processing-instruction>
	<robots>
		<xsl:apply-templates />
	</robots>
</xsl:template>

<xsl:template match="robots">
	<robots>
		<xsl:apply-templates />
	</robots>
</xsl:template>

<xsl:template match="*">
	<xsl:copy>
		<xsl:copy-of select="./@*" />
		<xsl:if test="./@PN">
			<xsl:attribute name="price">
				<xsl:call-template name="getPrice">
					<xsl:with-param name="PN" select="./@PN" />
				</xsl:call-template>
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="./*">
			<assembly>
				<xsl:attribute name="price">
					<xsl:call-template name="getPrice">
						<xsl:with-param name="PN" select="'ZZ'" />
					</xsl:call-template>
				</xsl:attribute>
			</assembly>
		</xsl:if>
		<xsl:apply-templates />
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>
