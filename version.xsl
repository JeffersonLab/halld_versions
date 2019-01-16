<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html> 
<body>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th style="text-align:left">Package</th>
      <th style="text-align:left">Version</th>
      <th style="text-align:left">Directory Tag</th>
    </tr>
    <xsl:for-each select="gversions/package">
    <tr>
      <td><xsl:value-of select="@name"/></td>
      <td style="text-align:right"><xsl:value-of select="@version"/></td>
      <td><xsl:value-of select="@dirtag"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

