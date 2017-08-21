var districts;

/*$(function(){
	$.post('/HouseRent/Type_typeList', function(data){
		for ( var i = 0; i < data.length; i++)
		{
			$("#houseType").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");  
		}
	}, 'json');
	
	$.post('/HouseRent/District_districtList', function(data){
		districts = data;
		for ( var i = 0; i < data.length; i++)
		{
			$("#houseDistrict").append("<option value='" + data[i].id + "'>" + data[i].name + "</option>");  
		}
		addStreet(0);
		
	}, 'json');
});*/



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