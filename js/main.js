console.log("running")
function search(){
	var query = document.getElementById('query').value
	var resultFrame = getCubicleResultsFor(query);
	document.getElementById('thecubicle').innerHTML = "";
	document.getElementById('thecubicle').appendChild(resultFrame);

}