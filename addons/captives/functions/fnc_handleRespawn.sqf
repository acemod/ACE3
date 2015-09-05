/*
 * Author: commy2 PabstMirror
 * Fix, because captiveNum doesn't reset properly on respawn
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corpse <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [alive, body] call ACE_captives_fnc_handleRespawn;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_dead"];

if (!local _unit) exitWith {};

//With respawn="group", we could be respawning into a unit that is handcuffed/captive
//If they are, reset and rerun the SET function
//if not, make sure to explicity disable the setCaptivityStatus, because captiveNum does not work correctly on respawn

if (_unit getVariable [QGVAR(isHandcuffed), false]) then {
    _unit setVariable [QGVAR(isHandcuffed), false];
    [_unit, true] call FUNC(setHandcuffed);
} else {
    [_unit, QGVAR(Handcuffed), false] call EFUNC(common,setCaptivityStatus);
};

if (_unit getVariable [QGVAR(isSurrendering), false]) then {
    _unit setVariable [QGVAR(isSurrendering), false];
    [_unit, true] call FUNC(setSurrendered);
} else {
    [_unit, QGVAR(Surrendered), false] call EFUNC(common,setCaptivityStatus);
};
