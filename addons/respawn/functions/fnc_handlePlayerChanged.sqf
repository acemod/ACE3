/*
 * Author: commy2
 * Handle player changed event. Updates visibility of Rallypoint markers.
 *
 * Arguments:
 * 0: New Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_respawn_fnc_handlePlayerChanged
 *
 * Public: No
 */
#include "script_component.hpp"

#define SIDES [west, east, independent]
#define RALLYPOINTS ["ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent"]
#define BASE_RALLYPOINTS ["ACE_Rallypoint_West_Base", "ACE_Rallypoint_East_Base", "ACE_Rallypoint_Independent_Base"]

params ["_newUnit"];

_sideIndex = SIDES find (side group _newUnit);

{
    private "_alpha";
    _alpha = if (_forEachIndex == _sideIndex) then {1} else {0};
    ((missionNamespace getVariable [_x, objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal _alpha;
} forEach RALLYPOINTS;
{
    private "_alpha";
    _alpha = if (_forEachIndex == _sideIndex) then {1} else {0};
    ((missionNamespace getVariable [_x, objNull]) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal _alpha;
} forEach BASE_RALLYPOINTS;
