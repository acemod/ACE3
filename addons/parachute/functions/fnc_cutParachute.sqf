#include "script_component.hpp"
/*
	Name: Cut Parachute

	Author: joko // Jonas

	Description:
	Cut Parachute and delete Old

	Parameters:
	0: Object

	Returns:
	Nothing
*/
private["_unit","_vehicle"];
_unit = _this select 0;
_vehicle = vehicle _unit;
_unit action ["GetOut", vehicle _unit];
deleteVehicle _vehicle;
_unit addBackpack "B_Parachute";
SETVAR(_unit,chuteIsCut,true);