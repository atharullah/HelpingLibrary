
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
  <!--<xsl:output method="html" indent="no"/>
  <xsl:param name="PageUrl" />
  <xsl:param name="HttpVDir"/>
  <xsl:param name="ListRight_AddListItems"/>
  <xsl:param name="ENCODED_FORM_NEW"/>
  <xsl:param name="FeedTitle"/>
  <xsl:param name="ServerRelativeUrl"/>
  <xsl:param name="XmlDefinition"/>
 
  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema">   

    <div class="outerdiv">
      <xsl:value-of select="$XmlDefinition"/>            
    </div>

  </xsl:template>-->

  <xsl:output version="1.0" indent="yes" encoding="UTF-8" method="xml" />
  <xsl:param name="ListTitle" />
  <xsl:param name="XmlDefinition"/>
  <xsl:template match="/">
    <h1>
      <xsl:value-of select="$ListTitle"/>
    </h1>
    <xmp>      
      <xsl:copy-of select="*"/>
    </xmp>
  </xsl:template>

</xsl:stylesheet>