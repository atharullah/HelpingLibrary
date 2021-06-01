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

  <xsl:template match="/" xmlns:x="http://www.w3.org/2001/XMLSchema" xmlns:d="http://schemas.microsoft.com/sharepoint/dsp" xmlns:asp="http://schemas.microsoft.com/ASPNET/20" xmlns:__designer="http://schemas.microsoft.com/WebParts/v2/DataView/designer" xmlns:SharePoint="Microsoft.SharePoint.WebControls" ddwrt:ghost="" xmlns:ddwrt="http://schemas.microsoft.com/WebParts/v2/DataView/runtime">
    <link rel="stylesheet" href="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SiteAssets/CSS/colorbox.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SiteAssets/JS/jquery.colorbox.js"></script>
    <!--<script>
      $(document).ready(function () {
      //Examples of how to assign the Colorbox event to elements
      $(".group3").colorbox({ rel: 'group3', transition: "none", width: "75%", height: "75%" });
      $(".group1").colorbox({ rel: 'group1',transition: "none", width: "75%", height: "75%" });
      $(".group2").colorbox({ rel: 'group2', transition: "fade" });
      $(".group4").colorbox({ rel: 'group4', slideshow: true });
      $(".ajax").colorbox();
      $(".youtube").colorbox({ iframe: true, innerWidth: 640, innerHeight: 390 });
      $(".vimeo").colorbox({ iframe: true, innerWidth: 500, innerHeight: 409 });
      $(".iframe").colorbox({ iframe: true, width: "80%", height: "80%" });
      $(".inline").colorbox({ inline: true, width: "50%" });
      $(".callbacks").colorbox({
      onOpen: function () { alert('onOpen: colorbox is about to open'); },
      onLoad: function () { alert('onLoad: colorbox has started to load the targeted content'); },
      onComplete: function () { alert('onComplete: colorbox has displayed the loaded content'); },
      onCleanup: function () { alert('onCleanup: colorbox has begun the close process'); },
      onClosed: function () { alert('onClosed: colorbox has completely closed'); }
      });

      $('.non-retina').colorbox({ rel: 'group5', transition: 'none' })
      $('.retina').colorbox({ rel: 'group5', transition: 'none', retinaImage: true, retinaUrl: true });

      //Example of preserving a JavaScript event for inline calls.
      $("#click").click(function () {
      $('#click').css({ "background-color": "#f00", "color": "#fff", "cursor": "inherit" }).text("Open this window again and this message will still be here.");
      return false;
      });
      });
    </script>-->

    <script>
      $(document).ready(function(){
      //Examples of how to assign the Colorbox event to elements
      $(".group1").colorbox({rel:'group1'});
      $(".group2").colorbox({rel:'group2', transition:"fade"});
      $(".group3").colorbox({rel:'group3', transition:"none", width:"75%", height:"75%"});
      $(".group4").colorbox({rel:'group4', slideshow:true});
      $(".ajax").colorbox();
      $(".youtube").colorbox({iframe:true, innerWidth:640, innerHeight:390});
      $(".vimeo").colorbox({iframe:true, innerWidth:500, innerHeight:409});
      $(".iframe").colorbox({iframe:true, width:"80%", height:"80%"});
      $(".inline").colorbox({inline:true, width:"50%"});
      $(".callbacks").colorbox({
      onOpen:function(){ alert('onOpen: colorbox is about to open'); },
      onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
      onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
      onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
      onClosed:function(){ alert('onClosed: colorbox has completely closed'); }
      });

      $('.non-retina').colorbox({rel:'group5', transition:'none'})
      $('.retina').colorbox({rel:'group5', transition:'none', retinaImage:true, retinaUrl:true});

      //Example of preserving a JavaScript event for inline calls.
      $("#click").click(function(){
      $('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
      return false;
      });
      });
    </script>


    <link rel="stylesheet" href="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SiteAssets/CSS/Style.css"/>
    <div style="padding-top:8px;padding-bottom:8px;">
      <span>
        <xsl:choose>
          <xsl:when test="substring-after($PageUrl,'RootFolder=')='' or substring-after($PageUrl,'Source=')=''">
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="GoBackLink" select="substring-after($PageUrl,'Source=')"></xsl:variable>
			<xsl:choose>
				<xsl:when test="substring-after($PageUrl,'View=')=''">
					<a style="color:#1769B4;" href="{$GoBackLink}">Go Back</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:variable name="GoBackLink_1" select="substring-before($GoBackLink,'View=')"></xsl:variable>
					<a style="color:#1769B4;" href="{$GoBackLink_1}">Go Back</a>
				</xsl:otherwise>
			</xsl:choose>
            <!--<a style="color:#1769B4;" href="{$GoBackLink}">Go Back</a>-->
          </xsl:otherwise>
        </xsl:choose>



        <!--Check For New Item  Permission...-->
        <xsl:choose>
          <xsl:when test="$ListRight_AddListItems">
            <span class="text_padding_td">
              <!-- style="padding-top:5px; padding-bottom:5px; padding-right:5px;">-->
              <span class="ep-webpart-footer">

                <a style="color:rgb(0, 114, 198);" href="/sites/OWHubDev/Portal/PhotoGallery/Forms/Thumbnails.aspx">
                  Manage Photos
                </a>
              </span>
            </span>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        <!--Check For New Item  Permission...-->
      </span>
      <br />
    </div>
    <span>


      <xsl:variable name="Rows" select="/dsQueryResponse/Rows/Row" />
      <xsl:for-each select="$Rows">
        <xsl:call-template name="dvt_1.rowview" />
      </xsl:for-each>
    </span>
  </xsl:template>
  <xsl:template name="dvt_1.rowview">

    <xsl:choose>

      <xsl:when test="@FileLeafRef.Suffix=''">

        <div class="divfolder_image">
          <xsl:choose>
            <xsl:when test="substring-after($PageUrl, 'View=')=''">
              <a  href="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SitePages/Media.aspx?RootFolder={@FileRef.urlencode}&amp;Source={$PageUrl}">
                <img src="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SiteAssets/Images/folder_image.png" height="100" width="100"  style="border:none !important;outline:none !important;"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:variable name="prevPageUrl" select="substring-before($PageUrl, 'View=')"></xsl:variable>
              <a  href="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SitePages/Media.aspx?RootFolder={@FileRef.urlencode}&amp;Source={$prevPageUrl}">
                <img src="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SiteAssets/Images/folder_image.png" height="100" width="100"  style="border:none !important;outline:none !important;"/>
              </a>
            </xsl:otherwise>
          
          </xsl:choose>
          <!--
          <a  href="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SitePages/Media.aspx?RootFolder={@FileRef.urlencode}&amp;Source={$PageUrl}">
            <img src="https://octatech.sharepoint.com/sites/OWHubDev/Portal/SiteAssets/Images/folder_image.png" height="100" width="100"  style="border:none !important;outline:none !important;"/>
          </a>-->
          <div class="imageName_Thumbnail">
            <!--<span style="position: absolute;top: 98%;margin-left: -7%;color: rgb(0, 114, 198);">-->
            <span class="divImgText">
              <xsl:value-of select="@FileLeafRef.Name" disable-output-escaping="yes" />
            </span>
          </div>
        </div>

      </xsl:when>
      <xsl:otherwise>
        <div class="divfolder_image">
          <xsl:variable name="imgTitle" select="@Title"></xsl:variable>
        	  <a class="group1" href="{@FileRef}" title="{$imgTitle}">
        	    <!--<img src='{@FileRef}' height="100" width="100" style="margin-left:3%;border:none !important;outline:none !important;"/>-->
				<!--<img src="{concat(@FileDirRef,'/_t/', substring-before(@FileLeafRef,concat('.',@FileLeafRef.Suffix)),'_',@FileLeafRef.Suffix,'.',@FileLeafRef.Suffix)}" alt="{@FileLeafRef}" height="100" width="100" style="margin-left:3%;border:none !important;outline:none !important;">-->
				<img src="{concat(@FileDirRef,'/_t/', substring-before(@FileLeafRef,concat('.',@FileLeafRef.Suffix)),'_',@FileLeafRef.Suffix,'.jpg')}" alt="{@FileLeafRef}" height="100" width="100" style="margin-left:3%;border:none !important;outline:none !important;">
				</img>
			</a>
          <div class="imageName_Thumbnail">
            <span class="divImgText">
              <xsl:value-of select="@FileLeafRef.Name" disable-output-escaping="yes" />
            </span>
          </div>
        </div>
      </xsl:otherwise>
    </xsl:choose>

  </xsl:template>



</xsl:stylesheet>