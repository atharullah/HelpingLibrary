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


  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema">
    <style>

      .ep-footer-group
      {
      color:#d5f5fb;
      width:350px;
      padding-left:50px !important;
      padding-top:0px;
      margin-top:0px;
      height:80px;
      font-family: Calibri;

      }
      .ep-footer-header
      {
      <!--color: #C0C0C0;-->
      font-family: Calibri;
      font-weight:bold;
      font-size:15px;
      color:#F0F0F0;
      }
      .ep-footer-link a
      {
      <!--color: #d5f5fb;-->
      <!--color:#999999 !important;-->
      color:#F0F0F0;
      text-decoration:none !important;
      }

      .tablestyle
      {
      background-color:#2D2D2D;
      padding-top:0px;
      margin-top:0px;
      margin-bottom:0px;
      padding-bottom:0px;
      border-bottom-width:0px;
      }


    </style>
    <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />

    <table class="tablestyle">
      <tr>
        <xsl:for-each select="$Rows">          
          <xsl:call-template name="insertdata" />
        </xsl:for-each>       
      </tr>    
    </table>
   <hr style="border:1px solid #414141;margin:0px;"></hr>
    <center>
  <div style="color:#8B9999;background-color:#2B2B2B;padding:4px;">© Copyright Essel ProPack Limited 2014. All rights reserved.</div>
      </center>
  </xsl:template>

  <xsl:template name="insertdata">

    <td class="ep-footer-group">
      <span class="ep-footer-header">
        <xsl:value-of select="@Title" />
      </span>
      <br/>
      <span class="ep-footer-link">
        <a href="{@Link1}">
          <xsl:value-of select="@Link1.desc"/>
        </a>
      </span>
      <br/>
      <span class="ep-footer-link">
        <a href="{@Link2}">
          <xsl:value-of select="@Link2.desc"/>
        </a>
      </span>
      <br/>
      <span class="ep-footer-link" >
        <a href="{@Link3}">
          <xsl:value-of select="@Link3.desc"/>
        </a>
      </span>
      <br/>
    </td>

  </xsl:template>
</xsl:stylesheet>

