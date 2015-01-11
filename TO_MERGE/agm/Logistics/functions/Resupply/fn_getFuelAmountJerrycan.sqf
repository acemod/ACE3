// by commy2

private ["_unit", "_item", "_fuel", "_text"];

_unit = _this select 0;
_item = _this select 1;

if (isNil "_item") then {
	_item = _unit getVariable "AGM_carriedItem";
};
if (isNil "_item") exitWith {};

_fuel = _item getVariable ["AGM_amountFuel", 20];
_fuel = (round (10 * _fuel)) / 10;

_unit playActionNow "Gear";

_text = format [localize "STR_AGM_Resupply_CheckedFuel", _fuel];
[_text] call AGM_Core_fnc_displayTextStructured;
