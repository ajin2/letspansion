/**
 *  JSON Module
 */

function HttpRequest(callback, url, params, method){
	this.callback = callback;
	this.url = url;
	this.params = params;
	this.method = method;
	this.request = null;
}

HttpRequest.prototype = {
	getXMLHttpRequest : function(){
		if(window.ActiveXObject){
			try{
				this.request = new ActiveXObject("Msxml2.XMLHTTP");
			} catch(e){
				try{
					this.request = new ActiveXObject("Microsoft.XMLHTTP");
				} catch(ee){
					this.request = null;
				}
			}
		}else{
			try{
				this.request = new XMLHttpRequest();	
			} catch(e){
				this.request = null;
			}
		}
	},
	sendRequest : function(){
		this.getXMLHttpRequest();
		
		// callback
		this.request.onreadystatechange = this.callback;
		
		// method
		var httpMethod = this.method ? this.method : "GET";
		if(httpMethod != "GET" && httpMethod != "POST"){
			httpMethod = "GET";
		}
		
		// params
		var httpParams = this.params == null || this.params == "" ? null : this.params;
		
		// url
		var httpUrl = httpMethod == "GET" ? this.url + "?" + httpParams : this.url;
		
		this.request.open(httpMethod, httpUrl, false);
		this.request.setRequestHeader("content-type","application/x-www-form-urlencoded");
		this.request.send(httpMethod == "POST" ? httpParams : null);
		
	}
};

