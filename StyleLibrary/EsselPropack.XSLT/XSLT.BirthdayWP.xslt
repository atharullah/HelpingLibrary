<!--
This section is the set up and can be used at the top of any external XSLT stylesheet file
-->
<xsl:stylesheet
xmlns:x="http://www.w3.org/2001/XMLSchema"
xmlns:d="http://schemas.microsoft.com/sharepoint/dsp"
version="1.0"
exclude-result-prefixes="xsl msxsl ddwrt"
xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime"
xmlns:asp="http://schemas.microsoft.com/ASPNET/20"
xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt"
xmlns:SharePoint="Microsoft.SharePoint.WebControls"
xmlns:ddwrt2="urn:frontpage:internal">
  <xsl:output method="html" indent="no"/>
  <xsl:param name="PageUrl" />
  <!--
End of Set Up
-->

  <!--
The initial template which in this case is matching everything with "/"
It then creates a variable called Rows - this is accessed as $Rows
A standard HTML table and header row with the names of our columns is next followed by a loop through each row of the list and calls our second template dvt1-rowview to display the contents
-->
  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema">
    <span class="ep-webpart">
      <span class="ep-webpart-header">
        <span id="img-birthdays" class="ep-webpart-img"/>
        <!--img-directorsmessage-->
        <span class="ep-webpart-title">Birthdays</span>
      </span>
      <span class="ep-webpart-body">
        <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />
        <xsl:for-each select="$Rows">
          <xsl:call-template name="dvt_1.rowview" />
        </xsl:for-each>
      </span>
    </span>
  </xsl:template>
  <!--
End of first template
-->
  <!--
Standard HTML rows and cells contain the contents of our list row
xsl:value-of command is used to display our columns
Columns are accessed as @InternalColumnName
-->
  <xsl:template name="dvt_1.rowview">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr  class="ep-webpart-record">
        <td style="vertical-align:middle; text-align:left; padding-left:5px;">
          <span class="ep-birthday-title">
            <xsl:value-of select="@EmployeeName" disable-output-escaping="yes" />
          </span>
          <span class="ep-knowledgesharing-shortdescription">
            <xsl:value-of select="substring-before(substring-after(@Unit, '&gt;'), '&lt;')" disable-output-escaping="yes"/>
          </span>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>