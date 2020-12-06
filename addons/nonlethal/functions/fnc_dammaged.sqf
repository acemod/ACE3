#include "script_component.hpp"
/*
 * Author: mjc4wilton
 * Dammaged EH
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"] call ace_nonlethal_fnc_dammaged
 *
 * Public: No
 */

params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];

systemChat "EH Fired!";
systemChat str _this;
// Exit if bullet is not part of NonLethal
private _nonlethalType = getText (configFile >> "CfgAmmo" >> typeOf _projectile >> "ACE_nonLethalType");
if (_nonlethalType isEqualTo null) exitWith {};

// Calculate how much of an effect the nonlethal has had on the unit
private _threshold = (_unit getVariable [QGVAR(threshold), 0]) + (_damage * ((1 - (_unit skill "courage")) * 2));
_unit setVariable [QGVAR(threshold), _threshold];

// Update unit status
if !(_unit getVariable [QGVAR(limp), false]) then {
    if ((_threshold >= 1) && (random 1 >= 0.3)) then {
        [_unit, "forceWalk", QGVAR(sumDamage), _hasLegSplint] call EFUNC(common,statusEffect_set);
    };
};

if !(_unit getVariable [QGVAR(surrendering), false]) then {
    if ((_threshold >= 5) && (random 1 >= 0.2)) then {
        [_unit, true] call EFUNC(captives,setSurrendered);
    };
};

nil
