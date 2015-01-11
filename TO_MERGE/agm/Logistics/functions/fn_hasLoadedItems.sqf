/*
	Name: AGM_Logistics_fnc_hasLoadedItems
	
	Author: 
		Garth de Wet (LH)
	
	Description:
		
	
	Parameters: 
		0: OBJECT - vehicle to check for loaded items
	
	Returns:
		BOOLEAN
	
	Example:
		_vehicleLoaded = [_truck] call AGM_Logistics_fnc_hasLoadedItems;
*/

private ["_result", "_vehicle"];

_result = false;
_vehicle = _this select 0;

// add default items
_items = _vehicle getVariable "AGM_Logistics_loadedItems";
if (isNil "_items") then {
	switch (true) do {
		/*
		"B_Truck_01_transport_F"
		"O_Truck_02_transport_F"
		"I_Truck_02_transport_F"
		"O_Truck_03_transport_F"
		*/
		case (_vehicle isKindOf "Car_F") : {
			[_vehicle] call compile preprocessFileLineNumbers "\AGM_Logistics\scripts\itemsCar.sqf";
		};
		case (_vehicle isKindOf "Tank_F") : {
			[_vehicle] call compile preprocessFileLineNumbers "\AGM_Logistics\scripts\itemsTank.sqf";
		};
	};
};

if (isClass (configFile >> "CfgVehicles" >> typeOf(_vehicle) >> "AGM_Load")) then {
	_attachPoints = (_vehicle) call AGM_Logistics_fnc_getLoadPoints;
	{
		if (count (_x select 3) > 0) exitWith {
			_result = true;
		};
	} count _attachPoints;
} else {
	_result = (count (_vehicle getVariable ["AGM_Logistics_loadedItems", []])) > 0;
};

_result
