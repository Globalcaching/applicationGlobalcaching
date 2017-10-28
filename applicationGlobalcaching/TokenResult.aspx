<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TokenResult.aspx.cs" Inherits="applicationGlobalcaching.TokenResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <script language="javascript" type="text/javascript">
        window.onload = function () {
            /** Assign your desired text on text mytextbox's value property. **/
            document.getElementById('codetxt').value = getToken();
			parent.postMessage(getToken(), "*");
        }
    </script>        
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Token has been retrieved.<br />
    Your code is:<br />
    <input id="codetxt" size="50" />
    </div>
    </form>
</body>
</html>
