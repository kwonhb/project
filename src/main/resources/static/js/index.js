
$(function(){
   for(let a=1; a <= 3; a++){
   let pictureid = document.getElementById('pictureid'+a).value;
   let pixelCanvas = document.getElementById('pixel-canvas'+a);
   
      $.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
      var code = data.code;
      var picname = data.picname;
      document.getElementById("code"+a).value = code;
      
      var codes = document.getElementById('code'+a).value;
        var ss = codes.split("\n");
     
      var newHeight = ss.length - 1;
        var newWidth = ss[0].split(" ").length - 1;

        for (let i = 1; i <= newHeight; i++) {
          let newgridRow = document.createElement('tr');
          var code_row = ss[i-1].split(" ");
          pixelCanvas.appendChild(newgridRow);
          for (let j = 1; j <= newWidth; j++) {
            var color = code_row[j-1];
            if (color == "#t") {
               color = "transparent"
            }
               let newgridCell = document.createElement('td');
               newgridRow.appendChild(newgridCell);
               newgridCell.style.backgroundColor = color;         
           }
        }

   if(newHeight >= 48 || newWidth >= 48) {
         $(".canvas td").css("height", "5px");
         $(".canvas td").css("min-width", "5px");
      } else if(newHeight >= 24 || newWidth >= 24) {
         $(".canvas td").css("height", "11px");
         $(".canvas td").css("min-width", "11px");
      } else {
         $(".canvas td").css("height", "20px");
         $(".canvas td").css("min-width", "20px");
      }
                     
   }); //getJSON
   }
});