#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Attaches the sighting unit to the Dragon missile.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit Performing Action <OBJECT>
 * 2: Is event (function recursives globaly to set weapon where turret is local) <BOOL> (default: false)
 *
 * Return Value:
 * Can Attach Sighting Unit <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_dragon_fnc_sightAttach
 *
 * Public: No
 */

params ["_target", "_unit", ["_event", false]];
TRACE_3("sightAttach",_target,_unit,_event);

if (_event isEqualTo true) then { // this is actually needed as 3rd arg may not be bool
    if (!(_target turretLocal [0])) exitWith {};
    _target setVariable [QGVAR(sightAttached), true, true];
    _target animate ["optic_hide", 0];
    _target addWeapon QGVAR(superStatic);
    _target removeWeapon QGVAR(dummyStatic);
    TRACE_2("added sight",_target weaponsTurret [0],_target animationPhase "optic_hide");
} else {
    _unit removeWeapon QGVAR(sight);
    [QGVAR(attachSight), [_target, _unit, true]] call CBA_fnc_globalEvent;
};
