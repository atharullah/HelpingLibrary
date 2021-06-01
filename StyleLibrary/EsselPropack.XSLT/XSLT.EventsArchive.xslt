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
  <xsl:param name="PageUrl" />
  <!--<xsl:include href="main.xsl" />
  <xsl:include href="internal.xsl" />-->
  <xsl:include href="/_layouts/xsl/main.xsl" />
  <xsl:include href="/_layouts/xsl/internal.xsl" />
  <xsl:include href="../../../Style%20Library/EsselPropack.XSLT/XSLT.StringUtility.xslt" />
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
  <xsl:output method='html' indent='yes' />
  <!--
End of Set Up
-->

  <!--
The initial template which in this case is matching everything with "/"
It then creates a variable called Rows - this is accessed as $Rows
A standard HTML table and header row with the names of our columns is next followed by a loop through each row of the list and calls our second template dvt1-rowview to display the contents
-->
  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:d="http://schemas.microsoft.com/sharepoint/dsp"
       xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer"
       xmlns:sharepoint="Microsoft.SharePoint.WebControls" xmlns:o="urn:schemas-microsoft-com:office:office"
       ddwrt:ghost="" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime">
    <!--Pagging Variables-->
    <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row[$EntityName = '' or (position() &gt;= $FirstRow and position() &lt;= $LastRow)]" />
    <!--Pagging Variables-->

    <span class="ep-webpart">
      <span class="ep-webpart-body">
        <xsl:variable name="ItemRows" select="/dsQueryResponse/Rows/Row" />
        <xsl:for-each select="$Rows">
          <xsl:call-template name="dvt_1.rowview" />
        </xsl:for-each>
      </span>
      <span class="ep-webpart-footer">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
          <tr>
            <td style="text-align:left; vertical-align:top">
              <xsl:call-template name="pagingButtons" />
            </td>
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
    <table class="tbl-borderbottom" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr  class="ep-archive-record" style="width:100%;">
        <td>
          <span class="ep-knowledgesharing-title" style="display:block;">
            <xsl:value-of select="@Title" disable-output-escaping="yes" />
            <!--Check For New Item...-->
            <xsl:choose>
              <xsl:when test="@Created_x0020_Date.ifnew='1'">
                <span style="margin-left:5px;" class="ms-vl-recent ms-textSmall">new!</span>
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
            </xsl:choose>
            <!--Check For New Item...-->
          </span>
          <span class="ep-knowledgesharing-shortdescription" style="display:block;">

            <xsl:variable name="DescriptionText">
              <xsl:call-template name="StripHTML">
                <xsl:with-param name="HTMLText" select="@Description"/>
              </xsl:call-template>
            </xsl:variable>
            <xsl:call-template name="FirstNWords">
              <xsl:with-param name="TextData" select="$DescriptionText"/>
              <xsl:with-param name="WordCount" select="100"/>
              <xsl:with-param name="MoreText" select="'...'"/>
            </xsl:call-template>
          </span>
          <span class="ep-knowledgesharing-shortdescription" style="display:block; font-size:12px">
            <i style="font-size:11px">
              Location:
            </i>
            <xsl:value-of select="@Location" disable-output-escaping="yes" />
            <!--- [<xsl:value-of select="@Region" disable-output-escaping="yes" />]-->
          </span>
          <span class="ep-knowledgesharing-shortdescription" style="display:block;">
            <i style="font-size:11px">Schedule: </i>
            <xsl:value-of select="@EventDate" disable-output-escaping="yes" /> - <xsl:value-of select="@EndDate" disable-output-escaping="yes" />
          </span>
        </td>
        <td class="td-leftborder" style="width:12%; vertical-align:middle;">
          <xsl:variable name="Id">
            <xsl:value-of select="@ID"/>
          </xsl:variable>
          <xsl:variable name="DetailPageLink" select="concat($HttpVDir,'/Lists/Events/ReadMore.aspx?ID=',$Id,'&amp;Source=',ddwrt:UrlEncode($PageUrl),'&amp;InitialTabID=Ribbon.Read')" />

          <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td style="text-align:center; vertical-align:middle">
                <a href="{$DetailPageLink}">
                  <span class="ep-readmoreround"></span>
                </a>
              </td>
            </tr>
            <tr>
              <td style="text-align:center; vertical-align:middle">
                <a href="{$DetailPageLink}">
                  <span>Read More</span>
                </a>


              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </xsl:template>

  <!--Pagging Templates-->

  <xsl:template name="pagingButtons">
    <xsl:choose>
      <xsl:when test="$XmlDefinition/List/@TemplateType = 106 and $XmlDefinition/@RecurrenceRowset='TRUE'">
        <xsl:if test="$dvt_nextpagedata or $dvt_prevpagedata">
          <xsl:call-template name="CalendarExpandedRecurrenceFooter"/>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$XmlDefinition/RowLimit[@Paged='TRUE']">
          <xsl:call-template name="CommandFooter">
            <xsl:with-param name="FirstRow" select="$FirstRow" />
            <xsl:with-param name="LastRow" select="$LastRow" />
            <xsl:with-param name="dvt_RowCount" select="$dvt_RowCount" />
          </xsl:call-template>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="CommandFooter">
    <xsl:param name="FirstRow" select="1"/>
    <xsl:param name="LastRow" select="1"/>
    <xsl:param name="dvt_RowCount" select="1"/>
    <xsl:if test="$FirstRow &gt; 1 or $dvt_nextpagedata">
      <xsl:call-template name="Navigation">
        <xsl:with-param name="FirstRow" select="$FirstRow" />
        <xsl:with-param name="LastRow" select="$LastRow" />
        <xsl:with-param name="dvt_RowCount" select="$dvt_RowCount" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="Navigation">
    <xsl:param name="FirstRow" select="1"/>
    <xsl:param name="LastRow" select="1"/>
    <xsl:param name="dvt_RowCount" select="1"/>
    <xsl:variable name="LastRowValue">
      <xsl:choose>
        <xsl:when test="$EntityName = '' or $LastRow &lt; $RowTotalCount">
          <xsl:value-of select="$LastRow"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$RowTotalCount"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="NextRow">
      <xsl:value-of select="$LastRowValue + 1"/>
    </xsl:variable>
    <table id="bottomPagingCell{$WPQ}" style="font-size:25px;width:100%;padding:5px;" border="0">
      <tr>
        <td style="width:50%">
          <xsl:if test="$dvt_firstrow &gt; 1">
            <a style="font-size:20px;">
              <xsl:choose>
                <xsl:when test="$dvt_RowCount = 0 and not($NoAJAX)">
                  <xsl:attribute name="onclick">
                    javascript:RefreshPageTo(event, "<xsl:value-of select="$PagePath"/>?<xsl:value-of select="$ShowWebPart"/>\u0026<xsl:value-of select='$FieldSortParam'/><xsl:value-of select='$SortQueryString'/>\u0026View=<xsl:value-of select="$View"/>");javascript:return false;
                  </xsl:attribute>
                  <xsl:attribute name="href">javascript:</xsl:attribute>
                  <img src="/_layouts/{$LCID}/images/prev.gif" border="0" alt="{$Rows/@idRewind}" />
                  <img src="/_layouts/{$LCID}/images/prev.gif" border="0" alt="{$Rows/@idRewind}" />
                </xsl:when>
                <xsl:otherwise>
                  <xsl:variable name="RealRowLimit">
                    <xsl:choose>
                      <xsl:when test="$XmlDefinition/Query/GroupBy[@Collapse='TRUE']/@GroupLimit">
                        <xsl:value-of select ="$XmlDefinition/Query/GroupBy[@Collapse='TRUE']/@GroupLimit"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select = "$XmlDefinition/RowLimit"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:variable>
                  <xsl:choose>
                    <xsl:when test="not($NoAJAX)">
                      <xsl:attribute name="onclick">
                        javascript:RefreshPageTo(event, "<xsl:value-of select="$PagePath"/>?<xsl:value-of select="$dvt_prevpagedata"/><xsl:value-of select="$ShowWebPart"/>\u0026PageFirstRow=<xsl:value-of select="$FirstRow - $RealRowLimit"/>\u0026<xsl:value-of select='$FieldSortParam'/><xsl:value-of select='$SortQueryString'/>\u0026View=<xsl:value-of select="$View"/>");javascript:return false;
                      </xsl:attribute>
                      <xsl:attribute name="href">javascript:</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="href">
                        javascript: <xsl:call-template name="GenFireServerEvent">
                          <xsl:with-param name="param" select="concat('dvt_firstrow={',$FirstRow - $XmlDefinition/RowLimit,'};dvt_startposition={',$dvt_prevpagedata,'}')"/>
                        </xsl:call-template>
                      </xsl:attribute>
                    </xsl:otherwise>
                  </xsl:choose>
                  <img src="/_layouts/{$LCID}/images/prev.gif" border="0" alt="{$Rows/@idPrevious}" style="vertical-align:middle" />
                  Prev
                </xsl:otherwise>
              </xsl:choose>
            </a>
          </xsl:if>
        </td>

        <td style="width:50%" align="right">
          <xsl:if test="$LastRowValue &lt; $dvt_RowCount or string-length($dvt_nextpagedata)!=0">

            <a style="font-size:20px;">
              <xsl:choose>
                <xsl:when test="not($NoAJAX)">
                  <xsl:attribute name="onclick">
                    javascript:RefreshPageTo(event, "<xsl:value-of select="$PagePath"/>?<xsl:value-of select="$dvt_nextpagedata"/><xsl:value-of select="$ShowWebPart"/>\u0026PageFirstRow=<xsl:value-of select="$NextRow"/>\u0026<xsl:value-of select='$FieldSortParam'/><xsl:value-of select='$SortQueryString'/>\u0026View=<xsl:value-of select="$View"/>");javascript:return false;
                  </xsl:attribute>
                  <xsl:attribute name="href">javascript:</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="href">
                    javascript: <xsl:call-template name="GenFireServerEvent">
                      <xsl:with-param name="param" select="concat('dvt_firstrow={',$NextRow,'};dvt_startposition={',$dvt_nextpagedata,'}')"/>
                    </xsl:call-template>
                  </xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
              Next<img src="/_layouts/{$LCID}/images/next.gif" border="0" alt="{$Rows/@tb_nextpage}" style="vertical-align:middle" />
            </a>
          </xsl:if>
        </td>
      </tr>
    </table>

    <xsl:if test="not($GroupingRender)">
      <script>
        var topPagingCell = document.getElementById(&quot;topPagingCell<xsl:value-of select="$WPQ" />&quot;);
        var bottomPagingCell = document.getElementById(&quot;bottomPagingCell<xsl:value-of select="$WPQ" />&quot;);
        if (topPagingCell != null &amp;&amp; bottomPagingCell != null)
        {
        topPagingCell.innerHTML = bottomPagingCell.innerHTML;
        }
      </script>
    </xsl:if>
  </xsl:template>

  <!--Pagging Templates-->
</xsl:stylesheet>