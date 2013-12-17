/** Метод инициализации для webview */
var webview = function () {
	$content = $("#content");
	$input = $("[name=url]", $content);
	$go = $(".button-go", $content);

	$input.focus();

	$content.verticalCenter({"minClientHeight" : "225px"});

	$go.on("click", function () {
		var value = $input.val();
		if (value) $.cocoaHtml({"special" : "coocodo-hide-params", "window" : "webview", "go" : value});
	});
};

webview.url = function (url) {
	$input.val(url);
};

/** Метод инициализации для get */
var get = function () {
	$content = $("#content");
	$panel = $("#panel");
	$clear = $(".button.clear", $panel);

	$clear.on("click", get.clearme);
};

get.clearme = function () {
	$content.html("");
};

get.tmpl_item = '<div class="item"><img class="icon" src="/img/icon.svg" /><div class="text">{STRING}</div></div>';

get.add = function (str) {
	var pos = str.indexOf("?") + 1;
	str = str.substr(pos);
	var params = str.split("&");
	var params2;
	var string = "? ";

	for (var num in params) {
		if (num != 0) string += " & ";
		params2 = params[num].split("=");
		string += "<span class='name'>" + params2[0] + "</span> = <span class='value'>" + params2[1] + "</span>";
	}

	string = x.replace(get.tmpl_item, {"STRING" : string});

	$content.prepend(string);
};

x.exe["option-default"] = [];
x.exe["option-webview"] = ["webview()"];
x.exe["option-get"] = ["get()"];

/** END */