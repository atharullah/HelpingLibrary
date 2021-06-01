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

  <xsl:include href="../../../Style%20Library/EsselPropack.XSLT/XSLT.StringUtility.xslt" />

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
        <span id="img-discussionforum" class="ep-webpart-img"/>
        <span class="ep-webpart-title">Discussion Forums</span>
      </span>
      <span class="ep-webpart-body">
        <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />
        <xsl:for-each select="$Rows">
          <xsl:call-template name="discussionforum.rowview" />
        </xsl:for-each>
      </span>
      <span class="ep-webpart-footer">

        <table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="text-align:left; vertical-align:top;padding-left:5px">
              <xsl:variable name="ArchiveViewLink" select="concat($HttpVDir,'/Lists/DiscussionForum/ArchiveView.aspx?Source=',$PageUrl,'&amp;InitialTabID=Ribbon.Read')" />
              <a href="{$ArchiveViewLink}">Archives</a>
            </td>
            <!--Check For New Item  Permission...-->
            <xsl:choose>
              <xsl:when test="$ListRight_AddListItems">
                <td style="text-align:right; vertical-align:top;padding-right:5px">
                  <span class="ep-webpart-footer">
                    <xsl:variable name="NewPageLink" select="concat('/Lists/DiscussionForum/NewDiscussion.aspx?Source=',$PageUrl,'&amp;InitialTabID=Ribbon.Read')" />
                    <a href="{$NewPageLink}">
                      <img src="/EsselImages/Icons/AddNew.jpg" height="14px" width="14px"></img>New Discussion
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
  <xsl:template name="discussionforum.rowview">

    <table border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr  class="ep-webpart-record">
        <td style="vertical-align:middle">
          <b>
            <xsl:value-of select="@Title" disable-output-escaping="yes" />
          </b>
          <!--Check For New Item...-->
          <xsl:choose>
            <xsl:when test="ddwrt:IfNew(@ApprovalDate)">
              <span style="margin-left:5px;" class="ms-vl-recent ms-textSmall">new!</span>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
          </xsl:choose>
          <!--Check For New Item...-->
        </td>
      </tr>
      <tr  class="ep-webpart-record">
        <td style="vertical-align:middle; padding-top:2px;">

          <xsl:variable name="BodyText">
            <xsl:call-template name="StripHTML">
              <xsl:with-param name="HTMLText" select="@Body"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:call-template name="FirstNWords">
            <xsl:with-param name="TextData" select="$BodyText"/>
            <xsl:with-param name="WordCount" select="20"/>
            <xsl:with-param name="MoreText" select="'...'"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr>
        <td style="text-align:right;padding-right:5px">
          <xsl:variable name="FileRef">
            <xsl:value-of select="@FileRef"/>
          </xsl:variable>
          <xsl:variable name="ReadmoreLink" select="concat($FileRef,'?Source=',ddwrt:UrlEncode($PageUrl),'&amp;InitialTabID=Ribbon.Read')" />
          <a href="{$ReadmoreLink}">
            <span class="ep-a-readmore">Read More </span>
            <span class="ep-readmorearrow"></span>
          </a>
        </td>
      </tr>
      <tr>
        <td>
          <hr class="ep-hr-separator"/>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>