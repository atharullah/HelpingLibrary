﻿<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
  <xsl:output method="html" indent="no"/>
  <xsl:decimal-format NaN=""/>
  <xsl:param name="dvt_apos">'</xsl:param>
  <xsl:param name="ManualRefresh"></xsl:param>
  <xsl:variable name="dvt_1_automode">0</xsl:variable>
  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="($ManualRefresh = 'True')">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top">
              <xsl:call-template name="dvt_1"/>
            </td>
            <td width="1%" class="ms-vb" valign="top">
              <img src="/_layouts/15/images/staticrefresh.gif" id="ManualRefresh" border="0" onclick="javascript: {ddwrt:GenFireServerEvent('__cancel')}" alt="Click here to refresh the dataview."/>
            </td>
          </tr>
        </table>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="dvt_1"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="dvt_1">
    <xsl:variable name="dvt_StyleName">ListForm</xsl:variable>
    <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row"/>
    <xsl:variable name="dvt_RowCount" select="count($Rows)"/>
    <xsl:variable name="dvt_IsEmpty" select="$dvt_RowCount = 0"/>
    <xsl:choose>
      <xsl:when test="$dvt_IsEmpty">
        <xsl:call-template name="dvt_1.empty"/>
      </xsl:when>
      <xsl:otherwise>
        <table border="0" width="85%">
          <xsl:call-template name="dvt_1.body">
            <xsl:with-param name="Rows" select="$Rows"/>
          </xsl:call-template>
        </table>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="dvt_1.body">
    <xsl:param name="Rows"/>
    <tr style="display:none;">
      <td class="ms-toolbar" nowrap="nowrap">
        <table>
          <tr>
            <td width="99%" class="ms-toolbar" nowrap="nowrap">
              <IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/>
            </td>
            <td class="ms-toolbar" nowrap="nowrap" align="right">
              <SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton1"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="ms-toolbar" nowrap="nowrap">
        <SharePoint:FormToolBar runat="server" ControlMode="Display"/>
        <SharePoint:ItemValidationFailedMessage runat="server" ControlMode="Display"/>
      </td>
    </tr>
    <xsl:for-each select="$Rows">
      <xsl:call-template name="dvt_1.rowview"/>
    </xsl:for-each>
    <tr>
      <td class="ms-toolbar" nowrap="nowrap">
        <table>
          <tr>
            <td class="ms-descriptiontext" nowrap="nowrap">
              <SharePoint:CreatedModifiedInfo ControlMode="Display" runat="server"/>
            </td>
            <td width="99%" class="ms-toolbar" nowrap="nowrap">
              <IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/>
            </td>
            <td class="ms-toolbar" nowrap="nowrap" align="right">
              <SharePoint:GoBackButton runat="server" ControlMode="Display" id="gobackbutton2"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="dvt_1.rowview">
    <xsl:variable name="ImageUrl">
      <xsl:choose>
        <xsl:when test="substring-before(@Image, ', ')=''">
          <xsl:value-of select="@Image"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="substring-before(@Image, ', ')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <tabel cellpadding="0" cellspacing="0" width="100%">
      <tr style="text-align:center;">
        <td style="text-align:center;">
          <img class="ImageStyle" style="float: center;" border="0" src="{$ImageUrl}" alt="{@EmployeeImage}" />
        </td>
      </tr>
      <tr>
        <td>
          <br/>
        </td>
      </tr>
      <!--<tr>
        <td style="text-align:left; width:100%">
          <table class="tbl-allborder" cellpadding="0" cellspacing="0" width="100%">
            <tr>
              <td style="width:20%">Employee Name</td>
              <td style="width:30%">
                <xsl:value-of select="@EmployeeName" disable-output-escaping="yes"/>
              </td>
              <td style="width:20%">Designation</td>
              <td style="width:30%">
                <xsl:value-of select="@Designation" disable-output-escaping="yes"/>
              </td>
            </tr>
            <tr>
              <td style="width:20%">Region</td>
              <td style="width:30%">
                <xsl:value-of select="@Region" disable-output-escaping="yes"/>
              </td>
              <td style="width:20%">Country</td>
              <td style="width:30%">
                <xsl:value-of select="@Country" disable-output-escaping="yes"/>
              </td>
            </tr>
            <tr>
              <td>Unit</td>
              <td>
                <xsl:value-of select="@Unit" disable-output-escaping="yes"/>
              </td>
              <td>Department</td>
              <td>
                <xsl:value-of select="@Department" disable-output-escaping="yes"/>
              </td>
            </tr>
          </table>
        </td>
      </tr>-->
      <tr>
        <td style="text-align:left;">
          <p>
            <xsl:value-of select="@Body" disable-output-escaping="yes"/>
          </p>
        </td>
      </tr>
    </tabel>
  </xsl:template>
  <xsl:template name="dvt_1.empty">
    <xsl:variable name="dvt_ViewEmptyText">There are no items to show in this view.</xsl:variable>
    <table border="0" width="100%">
      <tr>
        <td class="ms-vb">
          <xsl:value-of select="$dvt_ViewEmptyText"/>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>
