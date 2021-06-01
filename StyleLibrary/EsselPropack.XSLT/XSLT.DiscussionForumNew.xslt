
<xsl:stylesheet xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" version="1.0" exclude-result-prefixes="xsl msxsl ddwrt" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:SharePoint="Microsoft.SharePoint.WebControls" xmlns:ddwrt2="urn:frontpage:internal">
	<xsl:output method="html" indent="no"/>
	<xsl:decimal-format NaN=""/>
	<xsl:param name="dvt_apos">&apos;</xsl:param>
	<xsl:param name="ManualRefresh"></xsl:param>
	<xsl:variable name="dvt_1_automode">0</xsl:variable>
	<xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:dsp="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls">
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
		<div>
			<span id="part1">
				<table border="0" width="100%">
					<xsl:call-template name="dvt_1.body">
						<xsl:with-param name="Rows" select="$Rows"/>
					</xsl:call-template>
				</table>
			</span>
			<SharePoint:AttachmentUpload runat="server" ControlMode="New"/>
			<SharePoint:ItemHiddenVersion runat="server" ControlMode="New"/>
		</div>
	</xsl:template>
	<xsl:template name="dvt_1.body">
		<xsl:param name="Rows"/>
		<tr style="display:none;" >
			<td class="ms-toolbar" nowrap="nowrap">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap">
							<SharePoint:SaveButton runat="server" ControlMode="New" id="savebutton1"/>
						</td>
						<td class="ms-separator">&#160;</td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="New" id="gobackbutton1"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<SharePoint:FormToolBar runat="server" ControlMode="New"/>
				<SharePoint:ItemValidationFailedMessage runat="server" ControlMode="New"/>
			</td>
		</tr>
		<xsl:call-template name="dvt_1.rowedit"/>
		<tr>
			<td class="ms-toolbar" nowrap="nowrap">
				<table>
					<tr>
						<td width="99%" class="ms-toolbar" nowrap="nowrap"><IMG SRC="/_layouts/15/images/blank.gif" width="1" height="18"/></td>
						<td class="ms-toolbar" nowrap="nowrap">
							<SharePoint:SaveButton runat="server" ControlMode="New" id="savebutton2"/>
						</td>
						<td class="ms-separator">&#160;</td>
						<td class="ms-toolbar" nowrap="nowrap" align="right">
							<SharePoint:GoBackButton runat="server" ControlMode="New" id="gobackbutton2"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="dvt_1.rowedit">
		<xsl:param name="Pos" select="position()"/>
		<tr>
			<td>
				<table border="0" cellspacing="0" width="100%">
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Subject<span class="ms-formvalidation"> *</span>
								</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff1{$Pos}" ControlMode="New" FieldName="Title" __designer:bind="{ddwrt:DataBind('i',concat('ff1',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Title')}"/>
							<SharePoint:FieldDescription runat="server" id="ff1description{$Pos}" FieldName="Title" ControlMode="New"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Body</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff3{$Pos}" ControlMode="New" FieldName="Body" __designer:bind="{ddwrt:DataBind('i',concat('ff3',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Body')}"/>
							<SharePoint:FieldDescription runat="server" id="ff3description{$Pos}" FieldName="Body" ControlMode="New"/>
						</td>
					</tr>
					<tr style="display:none;">
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>E-Mail Sender</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff8{$Pos}" ControlMode="New" FieldName="EmailSender" __designer:bind="{ddwrt:DataBind('i',concat('ff8',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@EmailSender')}"/>
							<SharePoint:FieldDescription runat="server" id="ff8description{$Pos}" FieldName="EmailSender" ControlMode="New"/>
						</td>
					</tr>
					<tr>
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>Question</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff9{$Pos}" ControlMode="New" FieldName="IsQuestion" __designer:bind="{ddwrt:DataBind('i',concat('ff9',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@IsQuestion')}"/>
							<SharePoint:FieldDescription runat="server" id="ff9description{$Pos}" FieldName="IsQuestion" ControlMode="New"/>
						</td>
					</tr>
					<tr style="display:none;">
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>ApprovedBy</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff10{$Pos}" ControlMode="New" FieldName="ApprovedBy" __designer:bind="{ddwrt:DataBind('i',concat('ff10',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ApprovedBy')}"/>
							<SharePoint:FieldDescription runat="server" id="ff10description{$Pos}" FieldName="ApprovedBy" ControlMode="New"/>
						</td>
					</tr>
					<tr style="display:none;">
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>ApprovalDate</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff11{$Pos}" ControlMode="New" FieldName="ApprovalDate" __designer:bind="{ddwrt:DataBind('i',concat('ff11',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ApprovalDate')}"/>
							<SharePoint:FieldDescription runat="server" id="ff11description{$Pos}" FieldName="ApprovalDate" ControlMode="New"/>
						</td>
					</tr>
					<tr style="display:none;">
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>AssignedTo</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff12{$Pos}" ControlMode="New" FieldName="AssignedTo" __designer:bind="{ddwrt:DataBind('i',concat('ff12',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@AssignedTo')}"/>
							<SharePoint:FieldDescription runat="server" id="ff12description{$Pos}" FieldName="AssignedTo" ControlMode="New"/>
						</td>
					</tr>
					<tr style="display:none;">
						<td width="190px" valign="top" class="ms-formlabel">
							<H3 class="ms-standardheader">
								<nobr>ApprovalStatus</nobr>
							</H3>
						</td>
						<td width="400px" valign="top" class="ms-formbody">
							<SharePoint:FormField runat="server" id="ff13{$Pos}" ControlMode="New" FieldName="ApprovalStatus" __designer:bind="{ddwrt:DataBind('i',concat('ff13',$Pos),'Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@ApprovalStatus')}"/>
							<SharePoint:FieldDescription runat="server" id="ff13description{$Pos}" FieldName="ApprovalStatus" ControlMode="New"/>
						</td>
					</tr>
					<tr id="idAttachmentsRow">
						<td nowrap="true" valign="top" class="ms-formlabel" width="20%">
							<SharePoint:FieldLabel ControlMode="New" FieldName="Attachments" runat="server"/>
						</td>
						<td valign="top" class="ms-formbody" width="80%">
							<SharePoint:FormField runat="server" id="AttachmentsField" ControlMode="New" FieldName="Attachments" __designer:bind="{ddwrt:DataBind('i','AttachmentsField','Value','ValueChanged','ID',ddwrt:EscapeDelims(string(@ID)),'@Attachments')}"/>
							<script>
          var elm = document.getElementById(&quot;idAttachmentsTable&quot;);
          if (elm == null || elm.rows.length == 0)
          document.getElementById(&quot;idAttachmentsRow&quot;).style.display=&apos;none&apos;;
        </script>
						</td>
					</tr>
					<xsl:if test="$dvt_1_automode = '1'" ddwrt:cf_ignore="1">
						<tr>
							<td colspan="99" class="ms-vb">
								<span ddwrt:amkeyfield="ID" ddwrt:amkeyvalue="ddwrt:EscapeDelims(string(@ID))" ddwrt:ammode="view"></span>
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>	