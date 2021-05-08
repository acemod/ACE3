#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Add a per frame handler to the malyutka that copies MCLOS control data from player to missile
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_onLauncherFired
 *
 * Public: No
 */

params ["_unit", "", "", "", "", "", "_projectile"];
[{
    params ["_args", "_handle"];
    _args params ["_unit", "_projectile"];
    if !(alive _projectile) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };    

    // owner can change while missile is in flight
    private _owner = _unit getVariable QGVAR(owner);

    if ((vehicle _owner) isKindOf QGVAR(9m14_joystick)) then {
        _unit setVariable [QEGVAR(missileguidance,MCLOS_direction), _owner getVariable [QEGVAR(missileguidance,MCLOS_direction), [0, 0, 0]]];
    };

}, 0, [_unit, _projectile, _trackerLight]] call CBA_fnc_addPerFrameHandler;
