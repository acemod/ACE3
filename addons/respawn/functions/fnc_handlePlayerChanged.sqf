#include "script_component.hpp"
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

params ["_newUnit"];

private _side = side group _newUnit;

((GETMVAR(ACE_Rallypoint_West,             objNull)) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal ([0, 1] select (_side == west));
((GETMVAR(ACE_Rallypoint_West_Base,        objNull)) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal ([0, 1] select (_side == west));
((GETMVAR(ACE_Rallypoint_East,             objNull)) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal ([0, 1] select (_side == east));
((GETMVAR(ACE_Rallypoint_East_Base,        objNull)) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal ([0, 1] select (_side == east));
((GETMVAR(ACE_Rallypoint_Independent,      objNull)) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal ([0, 1] select (_side == independent));
((GETMVAR(ACE_Rallypoint_Independent_Base, objNull)) getVariable [QGVAR(marker), ""]) setMarkerAlphaLocal ([0, 1] select (_side == independent));
