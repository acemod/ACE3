/**
 * fn_searchGround_IEDS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define AVAILABLE_IEDS 			["cseModule_spawnIEDs", "cse_playerSpawnedIED"]
#define MAX_SEARCH_DISTANCE 	2.5

private ["_unit", "_foundIEDS", "_diggedUp", "_pos", "_height"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;

_foundIEDS = nearestObjects [_unit, AVAILABLE_IEDS, MAX_SEARCH_DISTANCE];
_diggedUp = false;
{
	_ied = _x getvariable ["cse_linkedIED_IEDS", objNull];
	if (((getPos _ied) select 2) < 0) then {
		if (random(1)>0.1) then {
			_diggedUp = true;
		};
	};
	if (_diggedUp) exitwith{
		_pos = getPos _ied;
		_height = (_pos select 2) + 0.09;
		if (_height > 0) then {
			_height = 0;
		};
		_pos set[2,_height];
		_ied setPos _pos;
	};
}foreach _foundIEDs;

if (_unit == player) then {
	if (_diggedUp) then {
		_unit sidechat "You uncover some of an IED";
		_unit sidechat format["Pos: %1",_pos];
	} else {
		_unit sidechat "You didn't find anything";
	};
};

true;