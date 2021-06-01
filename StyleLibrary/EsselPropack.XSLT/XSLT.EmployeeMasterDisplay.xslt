<!--
This section is the set up and can be used at the top of any external XSLT stylesheet file
-->

<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
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
    <div style="border: 1px solid black;">
      <h2 style="padding-left: 10px;">Knowledge Shared By</h2>
      <hr></hr>
      <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />
      <xsl:for-each select="$Rows">
        <xsl:call-template name="dvt_1.rowview" />
      </xsl:for-each>
    </div>
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
    <xsl:variable name="ImageUrl">
      <xsl:choose>
        <xsl:when test="substring-before(@Thumbnail, ', ') !=null">
          <xsl:value-of select="substring-before(@Thumbnail, ', ')" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@Thumbnail" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <table style="width:60%; min-width:750px;">
      <tr>
        <td style="width:10%;">
          <img style="margin-left:20px;" border="0" src="{$ImageUrl}" alt="Thumbnail"/>
        </td>
        <td>
          <table style="padding-left: 10px;" border="0" cellspacing="0" width="100%">
            <tbody>
              <tr>
                <!--Employee Name-->
                <td  valign="top" class="ms-formlabel">
                  <h3 class="ms-standardheader">
                    <nobr>
                      EmployeeName
                    </nobr>
                  </h3>
                </td>
                <td  valign="top" class="ms-formbody">
                  <xsl:value-of select="@Title"/>
                  <xsl:value-of select="@EmployeeName" disable-output-escaping="yes" />
                </td>
                <!--Unit-->
                <td  valign="top" class="ms-formlabel">
                  <H3 class="ms-standardheader">
                    <nobr>Unit</nobr>
                  </H3>
                </td>
                <td  valign="top" class="ms-formbody">
                  <xsl:value-of select="substring-before(substring-after(@Unit, '&gt;'), '&lt;')" disable-output-escaping="yes"/>
                </td>
              </tr>

              <tr>
                <!--Department-->
                <td  valign="top" class="ms-formlabel">
                  <H3 class="ms-standardheader">
                    <nobr>Department</nobr>
                  </H3>
                </td>
                <td  valign="top" class="ms-formbody">
                  <xsl:value-of select="substring-before(substring-after(@Department, '&gt;'), '&lt;')" disable-output-escaping="yes"/>
                </td>
                <!--Country-->
                <td  valign="top" class="ms-formlabel">
                  <H3 class="ms-standardheader">
                    <nobr>Country</nobr>
                  </H3>
                </td>
                <td  valign="top" class="ms-formbody">
                  <xsl:value-of select="substring-before(substring-after(@Country, '&gt;'), '&lt;')" disable-output-escaping="yes"/>
                </td>
              </tr>

              <tr>
                <!--Designation-->
                <td  valign="top" class="ms-formlabel">
                  <H3 class="ms-standardheader">
                    <nobr>Designation</nobr>
                  </H3>
                </td>
                <td  valign="top" class="ms-formbody">
                  <xsl:value-of select="substring-before(substring-after(@Designation, '&gt;'), '&lt;')" disable-output-escaping="yes"/>
                </td>
                <!--Region-->
                <td  valign="top" class="ms-formlabel">
                  <H3 class="ms-standardheader">
                    <nobr>Region</nobr>
                  </H3>
                </td>
                <td  valign="top" class="ms-formbody">
                  <xsl:value-of select="substring-before(substring-after(@Region, '&gt;'), '&lt;')" disable-output-escaping="yes"/>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
    </table>

  </xsl:template>
</xsl:stylesheet>