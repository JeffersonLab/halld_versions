<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<title><xsl:value-of select="gversions/@file"/></title>
<body>
  <h2><xsl:value-of select="gversions/@file"/></h2>
  <ul>
    <li><b>created: </b><xsl:value-of select="gversions/@date"/></li>
    <li><b>description: </b><xsl:value-of select="gversions/description/text()"/></li>
  </ul>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Package</th>
      <th style="text-align:left">Version</th>
      <th style="text-align:left">Directory Tag</th>
      <th style="text-align:left">Debug Level</th>
    </tr>
    <xsl:for-each select="gversions/package">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <xsl:choose>
        <xsl:when test="(@name='hdds') or (@name='halld_recon') or (@name='halld_sim') or (@name='hdgeant4') or (@name='gluex_root_analysis') or (@name='hd_utilities') or (@name='diracxx') or (@name='gluex_MCwrapper')">
          <xsl:variable name="url">https://github.com/jeffersonlab/<xsl:value-of select="@name"/>/releases/tag/<xsl:value-of select="@version"/></xsl:variable>
          <td style="text-align:right"><a href="{$url}"><xsl:value-of select="@version"/></a></td>
        </xsl:when>
        <xsl:when test="(@name='amptools')">
          <xsl:variable name="url">https://github.com/mashephe/<xsl:value-of select="@name"/>/releases/tag/v<xsl:value-of select="@version"/></xsl:variable>
          <td style="text-align:right"><a href="{$url}"><xsl:value-of select="@version"/></a></td>
        </xsl:when>
        <xsl:otherwise>
          <td style="text-align:right"><xsl:value-of select="@version"/></td>
        </xsl:otherwise>
      </xsl:choose>
      <td><xsl:value-of select="@dirtag"/></td>
      <td><xsl:value-of select="@debug_level"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
