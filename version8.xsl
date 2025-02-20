<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
  <title><xsl:value-of select="gversions/@file"/></title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: #f4f4f4;
      color: #333;
    }
    .container {
      max-width: 800px;
      margin: auto;
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
      color: #444;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: left;
    }
    th {
      background: #0056B3;
      color: white;
    }
    tr:hover {
      background: #f1f1f1;
    }
    .dark-mode {
      background-color: #222;
      color: #333;
    }
    .dark-mode table, .dark-mode th, .dark-mode td {
      border-color: #666;
    }
    .dark-mode th {
      background: #0056b3;
    }
    .toggle-button {
      margin-top: 10px;
      padding: 8px 15px;
      background: #0056B2;
      color: white;
      border: none;
      cursor: pointer;
      border-radius: 5px;
    }
  </style>
  <script>
    function toggleDarkMode() {
      document.body.classList.toggle("dark-mode");
    }
  </script>
</head>
<body>
  <div class="container">
    <h2><xsl:value-of select="gversions/@file"/></h2>
    <ul>
      <li><b>Created: </b><xsl:value-of select="gversions/@date"/></li>
      <li><b>Description: </b><xsl:value-of select="gversions/description/text()"/></li>
    </ul>
    <button class="toggle-button" onclick="toggleDarkMode()">Toggle Dark Mode</button>
    <table>
      <tr>
        <th>Package</th>
        <th>Version</th>
        <th>Directory Tag</th>
        <th>Debug Level</th>
      </tr>
      <xsl:for-each select="gversions/package">
      <tr>
        <td><xsl:value-of select="@name"/></td>
        <td>
          <xsl:choose>
            <xsl:when test="@name='hdds' or @name='hddm' or @name='halld_recon' or @name='halld_sim' or @name='hdgeant4' or @name='gluex_root_analysis' or @name='hd_utilities' or @name='diracxx' or @name='gluex_MCwrapper'">
              <xsl:variable name="url">https://github.com/jeffersonlab/<xsl:value-of select="@name"/>/releases/tag/<xsl:value-of select="@version"/></xsl:variable>
              <a href="{$url}"><xsl:value-of select="@version"/></a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@version"/>
            </xsl:otherwise>
          </xsl:choose>
        </td>
        <td><xsl:value-of select="@dirtag"/></td>
        <td><xsl:value-of select="@debug_level"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>

