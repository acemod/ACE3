#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Connects appropriate backpack hose
 *
 * Arguments:
 * 0: Optional unit <OBJECT> (default: ACE_player)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [player] call ace_goggles_fnc_respiratorConnect
 * call ace_goggles_fnc_respiratorConnect
 *
 * Public: Yes
 */
 
params [["_unit", ACE_player, [objNull]]];

if (!local _unit) exitWith {};

private _goggles        = goggles _unit;
private _backpack       = backpackContainer _unit;
private _backpackType   = backpack _unit;

{
    if (_x isEqualType 0) then {continue}; 
    _backpack setObjectTextureGlobal [_forEachIndex, _x];
} forEach (GVAR(respiratorHoseList) get _goggles get _backpackType);
