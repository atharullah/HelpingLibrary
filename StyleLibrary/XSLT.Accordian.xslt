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
  <xsl:param name="HttpVDir"/>
  <xsl:param name="ListRight_AddListItems"/>
  <xsl:param name="ENCODED_FORM_NEW"/>

  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema">   
      
        <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />        
            <xsl:for-each select="$Rows">
              <xsl:call-template name="dvt_1.rowview" />
            </xsl:for-each>   
  </xsl:template>
  <xsl:template name="dvt_1.rowview">
    <xsl:variable name="Link"  select="@URL"/>
    <!-- select='substring-before(substring-after(@Text, "'&quot;'"), "'&quot;'")'/>-->
    <a href="{@URL}" target="_blank" style="font-size:12pt">
        <xsl:value-of  select="@URL.desc" disable-output-escaping="yes"/>
      </a>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;<!--<span style="color: #0072c6;font-size:16pt;">&#124;</span>-->&#xA0;
    </xsl:template>
</xsl:stylesheet>