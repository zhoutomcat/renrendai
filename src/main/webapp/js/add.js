var districts;


function onchangeDistrict(obj)
{
	addStreet(obj.selectedIndex);
}

function addStreet(index)
{
	var data = districts[index];
	$("#houseStreet").empty();
	for ( var j = 0; j < data.streets.length; j++)
	{
		$("#houseStreet").append("<option value='" + data.streets[j].id + "'>" + data.streets[j].name + "</option>");  
	}
}