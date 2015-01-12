/**
 * fn_dropFlare_EQ.sqf
 * @Descr: Drop a flare object
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, flare STRING (Classname of the flare or fusee)]
 * @Return: OBJECT The created flare. Objnull if failure.
 * @PublicAPI: true
 */

private ["_unit", "_item", "_flareObj"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_item = [_this, 1, "", [""]] call BIS_fnc_Param;

_continue = switch (_item) do {
	case "CSE_FlareWhite": {true};
	case "CSE_FlareRed": {true};
	case "CSE_FlareGreen": {true};
	case "CSE_FlareYellow": {true};
	case "CSE_RoadFlareWhite": {true};
	case "CSE_RoadFlareRed": {true};
	case "CSE_RoadFlareGreen": {true};
	case "CSE_RoadFlareYellow": {true};
	default {false};
};
if (!_continue) exitwith {objNull};
if (_unit isKindof "CAManBAse") then {
	[_unit, _item] call cse_fnc_useMagazine;
};
_flareObj = _item createVehicle getPos _unit;

_flareObj