/**
 * fn_attachItem_EQ.sqf
 * @Descr: Attach an item of given classname.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, item STRING (Classname of magazine item)]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_unit","_chemlight","_isStrobeLight", "_light"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_item = [_this, 1, "", [""]] call BIS_fnc_Param;

[format["Attach item: %1",_this]] call cse_fnc_debug;

if (!isNull(_unit getvariable ["cse_attachedItem_EQ",objNull])) exitwith {};
if !([_unit,_item] call cse_fnc_hasMagazine) exitwith{};
if !([_item] call cse_fnc_isAttachableItem_EQ) exitwith{};

_unit setvariable ["cse_attachedItemClassName_EQ", _item];

_isStrobeLight = switch (_item) do {
	case "B_IR_Grenade": {true};
	case "I_IR_Grenade": {true};
	case "O_IR_Grenade": {true};
	default {false};
};
if (_isStrobeLight) then {
	_light = (toString [(toArray _item) select 0] + "_IRStrobe") createVehicle (getPos _unit);
} else {
	_light = _item createVehicle (getPos _unit);
};

if (!isNull _light) then {
	[_unit,_item] call cse_fnc_useMagazine;
	_light attachTo [_unit,[0.1,-0.1,-0.1],"head"];
	_unit setvariable["cse_attachedItem_EQ",_light,true];
};



[_unit, _light] spawn {
	_unit = _this select 0;
	_light = _this select 1;
	while {((alive _light) && !isNull(_unit getvariable ["cse_attachedItem_EQ",objNull]) && alive _unit)} do {
		if (vehicle _unit != _unit) then {
			_positionInWorld = _unit modelToWorld (_unit selectionPosition  "head");
		 	_vehPos = (vehicle _unit) worldToModel _positionInWorld;
		 	_light attachTo [(vehicle _unit),_vehPos];
		} else {
			_light attachTo [_unit,[0.1,-0.1,-0.1],"head"];
		};
	};
};
