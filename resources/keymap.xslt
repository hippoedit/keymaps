<?xml version="1.0"?>
<xslt:stylesheet xmlns:xslt="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xslt:template match="XMLConfigSettings">
    <html>
      <HEAD>
        <TITLE>
          <xslt:value-of select="FILEINFO/@type"/> (<xslt:value-of select="FILEINFO/@author"/>)
        </TITLE>
        <link href="./../styles.css" rel="stylesheet" type="text/css"/>
        <script src="./../sorting_table.js" type="text/javascript"></script>
        <script type="text/javascript">
          function init()
          {
          var TableSorter = new TSorter;
          TableSorter.init('sorting_table', '0');
          }
          window.onload = init;
        </script>
      </HEAD>
      <BODY>
        <xslt:apply-templates select="FILEINFO"/>
        <xslt:apply-templates select="HOTKEYSCHEMA"/>
        <xslt:apply-templates select="COMMANDS"/>
      </BODY>
    </html>
  </xslt:template>

  <xslt:template match="FILEINFO">
    <h3>File information</h3>
    <table width="400">
      <tr>
        <td class="TD-KEY">Author</td>
        <td>
          <xslt:value-of select="@author"/>
        </td>
      </tr>
      <tr>
        <td class="TD-KEY">Data type</td>
        <td>
          <xslt:value-of select="@type"/>
        </td>
      </tr>
    </table>
  </xslt:template>

  <xslt:template match="COMMANDS">
    <h3>
      HippoEDIT Command List
    </h3>
    <table width="400" id="sorting_table" class="sortable">
      <thead>
        <tr class="TR-HEADER">
          <th>№</th>
          <th>Command</th>
          <th>ID</th>
        </tr>
      </thead>
      <tbody>
        <xslt:for-each select="Command">
          <tr class="TR-NORMAL">
            <td abbr="image_number" class="key">
              <xslt:value-of select="position()"/>
            </td>
            <td>
              <xslt:value-of select="@verb_id"/>
            </td>
            <td>
              <xslt:value-of select="@id"/>
            </td>
          </tr>
        </xslt:for-each>
      </tbody>
    </table>
  </xslt:template>

  <xslt:template match="HOTKEYSCHEMA">
    <h3>
      Schema name:  <xslt:value-of select="@name"/>
    </h3>
    <table width="400" id="sorting_table" class="sortable">
      <thead>
        <tr class="TR-HEADER">
          <th>№</th>
          <th>Command</th>
          <th>Shortcut</th>
        </tr>
      </thead>
      <tbody>
        <xslt:for-each select="Shortcut">
          <tr class="TR-NORMAL">
            <td class="key">
              <xslt:value-of select="position()"/>
            </td>
            <td>
              <xslt:value-of select="@verb_id"/>
            </td>
            <td>
              <xslt:if test="@shift='true'">Shift + </xslt:if>
              <xslt:if test="@ctrl='true'">Ctrl + </xslt:if>
              <xslt:if test="@alt='true'">Alt + </xslt:if>
              <xslt:choose>
                <xslt:when test="number(@key) = 3">Break</xslt:when>
                <xslt:when test="number(@key) = 8">BackSpace</xslt:when>
                <xslt:when test="number(@key) = 9">Tab</xslt:when>
                <xslt:when test="number(@key) = 13">Enter</xslt:when>
                <xslt:when test="number(@key) = 27">Escape</xslt:when>
                <xslt:when test="number(@key) = 32">Space</xslt:when>
                <xslt:when test="number(@key) = 33">PageUp</xslt:when>
                <xslt:when test="number(@key) = 34">PageDown</xslt:when>
                <xslt:when test="number(@key) = 35">End</xslt:when>
                <xslt:when test="number(@key) = 36">Home</xslt:when>
                <xslt:when test="number(@key) = 37">Left</xslt:when>
                <xslt:when test="number(@key) = 38">Up</xslt:when>
                <xslt:when test="number(@key) = 39">Right</xslt:when>
                <xslt:when test="number(@key) = 40">Down</xslt:when>
                <xslt:when test="number(@key) = 45">Insert</xslt:when>
                <xslt:when test="number(@key) = 46">Delete</xslt:when>
                <xslt:when test="number(@key) = 47">Help</xslt:when>
                <xslt:when test="number(@key) = 91">Left Windows</xslt:when>
                <xslt:when test="number(@key) = 92">Right Windows</xslt:when>
                <xslt:when test="number(@key) = 93">Application</xslt:when>
                <xslt:when test="number(@key) = 106">Num *</xslt:when>
                <xslt:when test="number(@key) = 107">Num +</xslt:when>
                <xslt:when test="number(@key) = 109">Num -</xslt:when>
                <xslt:when test="number(@key) = 111">Num /</xslt:when>
                <xslt:when test="number(@key) = 226">\</xslt:when>
                <xslt:when test="number(@key) &gt; 111 and number(@key) &lt; 136">
                  <xslt:value-of select="concat('F', string(number(@key) - 111))"/>
                </xslt:when>
                <xslt:when test="number(@key) &gt; 159">
                  <xslt:value-of disable-output-escaping="yes" select="concat('&#38;#', string(number(@key) - 128),';')"/>
                </xslt:when>
                <xslt:otherwise>
                  <xslt:value-of disable-output-escaping="yes" select="concat('&#38;#', @key,';')"/>
                </xslt:otherwise>
              </xslt:choose>
            </td>
          </tr>
        </xslt:for-each>
      </tbody>
    </table>
  </xslt:template>
</xslt:stylesheet>
