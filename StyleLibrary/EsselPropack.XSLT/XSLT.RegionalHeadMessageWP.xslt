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
        <span id="img-directorsmessage" class="ep-webpart-img"/>
        <!--img-directorsmessage-->
        <span class="ep-webpart-title">Regional Head Message</span>
      </span>
      <span class="ep-webpart-body">
        <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />
        <xsl:for-each select="$Rows">
          <xsl:call-template name="dvt_1.rowview" />
        </xsl:for-each>
      </span>
      <span class="ep-webpart-footer">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="text-align:left; vertical-align:top; padding-left:5px;">
              <xsl:variable name="ArchiveViewLink" select="concat($HttpVDir,'/Lists/RegionalHeadMessage/ArchiveView.aspx?Source=',$PageUrl,'&amp;InitialTabID=Ribbon.Read')" />
              <a href="{$ArchiveViewLink}">Archives</a>
            </td>
            <!--Check For New Item  Permission...-->
            <xsl:choose>
              <xsl:when test="$ListRight_AddListItems">
                <td style="text-align:right; vertical-align:top; padding-right:5px">
                  <span class="ep-webpart-footer">
                    <xsl:variable name="NewPageLink" select="concat($HttpVDir,'/Lists/RegionalHeadMessage/NewForm.aspx?Source=',$PageUrl,'&amp;InitialTabID=Ribbon.Read')" />
                    <a href="{$NewPageLink}">
                      <img src="/EsselImages/Icons/AddNew.jpg" height="14px" width="14px"></img>Add New
                    </a>
                  </span>
                </td>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
            <!--Check For New Item  Permission...-->
          </tr>
        </table>
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

    <xsl:variable name="ThumbnailURL">
      <xsl:choose>
        <xsl:when test="substring-before(@Thumbnail, ', ')=''">
          <xsl:value-of select="@Thumbnail"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-before(@Thumbnail, ', ')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>



    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr  class="ep-webpart-record">
        <td style="vertical-align:top;">
          <img class="ThumbnailStyle" src="{$ThumbnailURL}" alt="{@RegionalHeadName}"> </img>
        </td>
        <td style="vertical-align:middle; padding-left:5px;">
          <b>
            <xsl:value-of select="@RegionalHeadName" disable-output-escaping="yes" />
            <!--Check For New Item...-->
            <xsl:choose>
              <xsl:when test="@Created_x0020_Date.ifnew='1'">
                <span style="margin-left:5px;" class="ms-vl-recent ms-textSmall">new!</span>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
            <!--Check For New Item...-->
          </b>
          <br />
          <i>
            <xsl:value-of select="@Designation" disable-output-escaping="yes" />
          </i>
        </td>
      </tr>
      <tr>
        <td style="vertical-align:top; padding-left:5px;" colspan="2">
          <xsl:value-of select="@ShortDescription" disable-output-escaping="yes" />
        </td>
      </tr>
      <tr>
        <td style="text-align:right; padding-right:5px" colspan="2">
          <xsl:variable name="Id">
            <xsl:value-of select="@ID"/>
          </xsl:variable>
          <xsl:variable name="DetailPageLink" select="concat($HttpVDir,'/Lists/RegionalHeadMessage/ReadMore.aspx?ID=',$Id,'&amp;Source=',ddwrt:UrlEncode($PageUrl),'&amp;InitialTabID=Ribbon.Read')" />
          <a href="{$DetailPageLink}">
            <span class="ep-a-readmore">Read More </span>
            <span class="ep-readmorearrow"></span>
          </a>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <hr class="ep-hr-separator"/>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>