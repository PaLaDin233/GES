var xmlHttp;
function init()
{
	if(window.ActiveXObject)
	{
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP"); 
	}else{
		xmlHttp=new XMLHttpRequest();
	}
}
var t;
function doAjax(url,n)
{
	init();
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange =callBack;
	xmlHttp.send(null);
	t=n;
}
function callBack()
{
	if(xmlHttp.readyState==4 && xmlHttp.status==200)
	{
		
		if(xmlHttp.responseText==1)
		{
			document.getElementById('ab_'+t).innerHTML='已通过'; 
		}
		else
		{
			document.getElementById('ab_'+t).innerHTML='未通过'; 
		}
	}
}