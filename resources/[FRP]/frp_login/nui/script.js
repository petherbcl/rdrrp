var selectloc = null;

$(function(){
	var actionContainer = $(".container");

	window.addEventListener('message',function(event){
		var item = event.data;

		if (item.showmenu){
			actionContainer.show();
			selectloc = null;
			$(".selected").removeClass("selected");
			$(".enter-world").css("opacity", "0.4")
		}

		if (item.hidemenu){
			actionContainer.hide();
		}
	});
})

function locSelected(loc) {			
    selectloc = loc;
    $(".enter-world").css("opacity", "1")
}

$(document).on('click', '.locoption', function(e){
    $(".selected").removeClass("selected");
    e.currentTarget.className += " selected";
});

function enterWorld() {			
    if(selectloc != null){
		sendData("ButtonClick",selectloc)
        $(".container").fadeOut(500);
    }
}

function sendData(name,data){
	$.post("http://frp_login/"+name,JSON.stringify(data),function(datab){
		if (datab != "ok"){
			console.log(datab);
		}
	});
}