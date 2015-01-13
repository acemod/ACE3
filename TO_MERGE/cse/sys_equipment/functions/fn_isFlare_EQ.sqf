/**
 * fn_isFlare_EQ.sqf
 * @Descr: Check if given classname is a CSE Flare
 * @Author: Glowbal
 *
 * @Arguments: [classname STRING (Magazine classname to check)]
 * @Return: BOOL True if classname is a flare.
 * @PublicAPI: true
 */

private ["_classname", "_return"];
_classname = [_this, 0, "", [""]] call BIS_fnc_Param;
_return = switch (_classname) do {
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

_return