function ajax(obj) {
	let xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			obj.onsuccess(this.responseText);
		}
	}
	if (obj.param) {
		let qs = jsonToQueryString(obj.param);
		obj.url = obj.url + qs;
	}
	xhttp.open(obj.method, obj.url, true);
	if (!obj.data) {
		obj.data = null;
	}
	else{
		xhttp.setRequestHeader('Content-Type', 'application/json');  
		obj.data = encodeURIComponent(JSON.stringify(obj.data));
	}
	xhttp.send(obj.data);
}

function jsonToQueryString(json) {
	return '?' + Object.keys(json).map(function(key) {
		return encodeURIComponent(key) + '=' + encodeURIComponent(json[key]);
	}).join('&');
}