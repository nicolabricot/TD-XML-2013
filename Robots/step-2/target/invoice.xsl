<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="prices" select="document('price.xml')"/>

<xsl:template name="getPrice">
	<xsl:param name="product" />

	<xsl:value-of select="$prices//product[./@PN=$product]/@price"/>
</xsl:template>

<xsl:template match="*">
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:if test="@PN">
			<xsl:attribute name="prix">
				<xsl:call-template name="getPrice">
					<xsl:with-param name="product" select="./@PN" />
				</xsl:call-template>
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="count(*)">
			<assembly>
				<xsl:attribute name="prix">
					<xsl:call-template name="getPrice">
						<xsl:with-param name="product" select="'ZZ'" />
					</xsl:call-template>
				</xsl:attribute>
			</assembly>
		</xsl:if>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<xsl:template match="robots">
	<xsl:copy>
		<xsl:copy-of select="@*"/>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>
