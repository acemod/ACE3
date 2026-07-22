#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Hides backpack hose
 *
 * Arguments:
 * 0: Optional unit <OBJECT> (default: ACE_player)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [player] call ace_goggles_fnc_respiratorDisconnect
 * call ace_goggles_fnc_respiratorDisconnect
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
    _backpack setObjectTextureGlobal [_forEachIndex, ""];
} forEach (GVAR(respiratorHoseList) get _goggles getOrDefault [_backpackType, GVAR(respiratorHoseTextures) get _backpackType]);
