<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" version = "1.0" > 

  <xsl:template match = "/" > 
    <text>
      <xsl:apply-templates select="/*"/>
    </text>
  </xsl:template>

  <xsl:template match='p[@rend="bodytext"]'>
    <paragraph>
      <!-- if the n attribute is set, create an HTML anchor for the paragraph in the form para### -->
      <xsl:if test="@n">
          <xsl:attribute name="nr">
            <xsl:value-of select="@n"/>
          </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </paragraph>
  </xsl:template>

  <xsl:template match='p[@rend="hangnum"]'>
    <hangnum>
      <!-- if the n attribute is set, create an HTML anchor for the paragraph in the form para### -->
      <xsl:if test="@n">
        <xsl:attribute name="nr">
          <xsl:value-of select="@n"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </hangnum>
  </xsl:template>

  <xsl:template match='p[@rend="unindented"]'>
    <paragraph type="unindented">
      <xsl:apply-templates/>
    </paragraph>
  </xsl:template>

  <xsl:template match='p[@rend="indent"]'>
    <paragraph type="indent">
      <xsl:apply-templates/>
    </paragraph>
  </xsl:template>

  <xsl:template match="note">
    <note>[<xsl:apply-templates/>]</note>
  </xsl:template>

  <xsl:template match='hi[@rend="bold"]'>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match='hi[@rend="paranum"]'>
    <!-- <paranum><xsl:apply-templates/></paranum> -->
  </xsl:template>

  <xsl:template match='p[@rend="centre"]'>
    <centered>
      <xsl:apply-templates/>
    </centered>
  </xsl:template>

  <xsl:template match='p[@rend="subsubhead"]'>
    <subsubhead>
      <xsl:apply-templates/>
    </subsubhead>
  </xsl:template>

  <xsl:template match='hi[@rend="dot"]'>
    <!-- <xsl:apply-templates/> -->
  </xsl:template>

  <xsl:template match='p[@rend="book"]'>
    <book>
      <xsl:apply-templates/>
    </book>
  </xsl:template>

  <xsl:template match='p[@rend="chapter"]'>
    <chapter>
      <xsl:apply-templates/>
    </chapter>
  </xsl:template>

  <xsl:template match='p[@rend="subhead"]'>
    <subhead>
      <xsl:apply-templates/>
    </subhead>
  </xsl:template>

  <xsl:template match='p[@rend="nikaya"]'>
    <nikaya>
      <xsl:apply-templates/>
    </nikaya>
  </xsl:template>

  <xsl:template match='p[@rend="title"]'>
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>

  <xsl:template match='p[@rend="gatha1"]'>
    <gatha type="1">
      <xsl:apply-templates/>
    </gatha>
  </xsl:template>

  <xsl:template match='p[@rend="gatha2"]'>
    <gatha type="2">
      <xsl:apply-templates/>
    </gatha>
  </xsl:template>

  <xsl:template match='p[@rend="gatha3"]'>
    <gatha type="3">
      <xsl:apply-templates/>
    </gatha>
  </xsl:template>

  <xsl:template match='p[@rend="gathalast"]'>
    <gatha type="last">
      <xsl:apply-templates/>
    </gatha>
  </xsl:template>
</xsl:stylesheet>
