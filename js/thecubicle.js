
//Searches thecubicle.us for the search term query
function getCubicleResultsFor(query){
	//query should be a space separated string of keywords
	//Returns an object with title:price
	var url = "//thecubicle.us/advanced_search_result.php?search_in_description=0&keywords=";
	var delimiter = "+";
	var terms = query.split(" ");
	for (var term in terms){
		url += terms[term];
		url += delimiter;
	}
	var frame = document.createElement("IFRAME");
	frame.height = 500;
	frame.width=500;
	frame.src = url;
	frame.id = "thecubicleframe"
	//frame.scrolling = "no"
	frame.onload = function () { this.contentWindow.scrollTo(0, 200) };
	return frame;
}


