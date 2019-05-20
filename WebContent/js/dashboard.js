//hide products in the list that do not have the class
//selected by the farmer
function onCategoryChange(category){
	if(category == "All"){
		$(".list-group-item").css("display", "");
	}
	else{
		$(".list-group-item").css("display", "");
		$(".list-group-item").not("." + category).css("display", "none");
	}
}