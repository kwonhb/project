$(function() {

	var bbsize = document.getElementById("bbsize").value;

	for (let s = 0; s < bbsize; s++) {

		var pictureid = document.getElementById(s + "_picid").value;
		var pixelCanvas = document.getElementById("table_" + s);

		$.ajax({
			url: "/painter/paintLoad2",
			type: "get",
			data: {
				pictureid: pictureid
			},
			datatype: "json",
			async: false,
			success: function(data) {
				var info = JSON.parse(data);
				var code = info.code;
				//var picname = data.picname;
				document.getElementById("code_" + s).value = code;

				var codes = document.getElementById('code_' + s).value;
				var ss = codes.split("\n");

				var newHeight = ss.length - 1;
				var newWidth = ss[0].split(" ").length - 1;

				for (let i = 1; i <= newHeight; i++) {
					let newgridRow = document.createElement('tr');
					var code_row = ss[i - 1].split(" ");
					pixelCanvas.appendChild(newgridRow);
					for (let j = 1; j <= newWidth; j++) {
						var color = code_row[j - 1];
						if (color == "#t") {
							color = "transparent"
						}
						let newgridCell = document.createElement('td');
						newgridRow.appendChild(newgridCell);
						newgridCell.style.backgroundColor = color;
					}
				}
			},
			error: function() { alert('error'); }
		});

	}

	/*
	for (let a = 1; a <= 3; a++) {
		let pictureid = document.getElementById('pictureid' + a).value;
		let pixelCanvas = document.getElementById('pixel-canvas' + a);
		let flea = document.getElementById('boardf' + a).value;
		let fpic = "/upload/" + document.getElementById('fpic' + a).value;
		let fpicadd = document.getElementById('fpicadd' + a);

		if (flea != "") {
			$(".boardf" + a).css("display", "block");
			var img = document.createElement("img");

			img.setAttribute("src", fpic);
			img.setAttribute("onerror", "this.src='/image/noimage.png'");
			img.setAttribute("width", "300px");
			img.setAttribute("height", "auto");

			fpicadd.appendChild(img);
		}

		
	}//for
*/
});


$(".item_box").click(function(){
	location.href = "/board/content/" + this.id;
})

$(".bestbox").click(function(){
	location.href = "/painter/painter";
})