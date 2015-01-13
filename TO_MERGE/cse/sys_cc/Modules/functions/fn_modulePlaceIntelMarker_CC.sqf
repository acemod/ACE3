/**
 * fn_modulePlaceIntelMarker_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private["_logic", "_placeMentSide"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isServer) exitwith{};
if (!isNull _logic) then {
	if (!isnil "cse_fnc_placeMarker_CC") then {

		_placeMentSide = _logic getvariable ["PlacementSide", "west"],
		_placeMentSide = switch (_placeMentSide) do {
			case "west": {west};
			case "east": {east};
			case "independent": {independent};
			default {west};
		};

		[
			[
				_logic getvariable "Type",
				_logic getvariable "Side",
				_logic getvariable "Direction",
				_logic getvariable "Size",
				_logic getvariable "Number",
				_logic getVariable "Note",
				[0,0,0,0,0]
			],
			ASLToATL getPosASL _logic,
			"intel", _placeMentSide
		] call cse_fnc_placeMarker_CC;
	};
};