
//Searches thecubicle.us for the search term query
function searchCubicleFor(query){
	//query should be a space separated string of keywords
	//Returns an object with title:price
	var url = "https://thecubicle.us/advanced_search_result.php?search_in_description=0&keywords=";
	var delimiter = "+";
	var terms = query.split(" ");
	for (var term in terms){
		url += terms[term];
		url += delimiter;
	}
	var results = httpGet(url);
	console.log(results);

}


