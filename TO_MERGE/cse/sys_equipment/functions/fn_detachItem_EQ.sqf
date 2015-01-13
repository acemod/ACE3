/**
 * fn_detachItem_EQ.sqf
 * @Descr: Detach current attached item and add it back to the magazines list of the unit.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL True if succesful.
 * @PublicAPI: true
 */

private ["_unit","_chemlight","_isStrobeLight", "_light","_item", "_originalCount"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;

_item = _unit getvariable ["cse_attachedItem_EQ",objNull];
_unit setvariable["cse_attachedItem_EQ",nil,true];

if (isNull _item) exitwith {true};
_isStrobeLight = switch (typeOf _item) do {
	case "B_IRStrobe": {true};
	case "I_IRStrobe": {true};
	case "O_IRStrobe": {true};
	default {false};
};
if (_isStrobeLight) then {
	_light = switch (typeOf _item) do {
		case "B_IRStrobe": {"B_IR_Grenade"};
		case "I_IRStrobe": {"I_IR_Grenade"};
		case "O_IRStrobe": {"O_IR_Grenade"};
	};
} else {
	_light = typeOf _item;
};
[format ["Detaching %1 %2", _unit, _light]] call cse_fnc_debug;
 _originalCount = ({_x == _light} count magazines _unit);

_unit addMagazine [_light, 1];
if ((_originalCount + 1) < ({_x == _light} count magazines _unit)) then {
 	_unit removeMagazine _light;
};
detach _item;

if (_isStrobeLight) then {
	_item setPos [-10000,-10000,-10000];

	// sleeping to ensure the IR strobe effect is properly gone before we delete the source.
	sleep 5;
};
deleteVehicle _item;
true;