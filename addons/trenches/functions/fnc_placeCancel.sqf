#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support
 * Cancels trench dig
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Key <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_trenches_fnc_placeCancel
 *
 * Public: No
 */

params ["_unit", "_key"];

if (_key != 1 || {GVAR(digPFH) == -1}) exitWith {};

// Enable running again
[_unit, QEGVAR(common,forceWalk), QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, QEGVAR(common,blockThrow), QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Delete placement dummy
deleteVehicle GVAR(trench);

// Remove digment pfh
[GVAR(digPFH)] call CBA_fnc_removePerFrameHandler;
GVAR(digPFH) = -1;

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(Dig), -1]] call EFUNC(common,removeActionEventHandler);

_unit setVariable [QGVAR(isPlacing), false, true];
