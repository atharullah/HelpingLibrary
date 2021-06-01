// Copyright 2008 Darren Johnstone (http://darrenjohnstone.net)
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

function SPAPI_Core()
{
    this.createXMLHttpRequest = function()
    {
        if (typeof XMLHttpRequest != "undefined") 
        {
            return new XMLHttpRequest();
        } 
        else if (typeof ActiveXObject != "undefined") 
        {
            return new ActiveXObject("Microsoft.XMLHTTP");
        } 
        else 
        {
            throw new Error("XMLHttpRequest not supported");
        }
    }
    
    this.executeRequest = function(serviceUrl, action, packet, params)
    {
        var oXMLHttpRequest = this.createXMLHttpRequest();
        var result = null;
        var resultName;
        
        oXMLHttpRequest.open("POST", serviceUrl, false);
        oXMLHttpRequest.setRequestHeader("Content-Type", "text/xml; charset=utf-8"); 
        oXMLHttpRequest.setRequestHeader("SOAPAction", action);
        
        if (params != null)
        {
            for (var i=0; i < params.length; i++)
            {
                packet = packet.replace('{' + i.toString() + '}', (params[i] == null ? '' : params[i]));
            }
        }
        
        oXMLHttpRequest.send(packet);
        
        resultName = action.substring(action.lastIndexOf('/') + 1) + 'Result';
        var resBatch;
        var status;
        var statusText;
        
        status = oXMLHttpRequest.status;
        statusText = oXMLHttpRequest.statusText;
        
        if (status == 200)
        {
            // Check for SharePoint error code
            resBatch = oXMLHttpRequest.responseXML.getElementsByTagName(resultName);
            
            var codeEl = oXMLHttpRequest.responseXML.getElementsByTagName('ErrorCode');
            
            if (codeEl != null && codeEl.length > 0)
            {
                var spStatus = parseInt(codeEl[0].childNodes[0].nodeValue);
                
                if (spStatus != 0)
                {
                    status = 0-spStatus; // Note we make this -ve to prevent confusion with the HTTP code
                    
                    var messageEl = oXMLHttpRequest.responseXML.getElementsByTagName('ErrorText');
                    if (messageEl != null && messageEl.length >= 0)
                    {
                        statusText = messageEl[0].childNodes[0].nodeValue;
                    }
                }
            }
        }
            
        result = {
        status : status,
        statusText : statusText,
        responseXML : oXMLHttpRequest.responseXML,
        responseText : oXMLHttpRequest.responseText,
        resultNode : (resBatch == null || resBatch.length == 0 ? null : resBatch[0])
        };
        
        return result;
    }
}
