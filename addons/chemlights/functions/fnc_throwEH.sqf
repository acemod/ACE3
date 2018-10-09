#include "script_component.hpp"
/*
 * Author: commy2, voiper
 * Fired EH, for handling chemlight ThrowMuzzles.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_chemlights_fnc_throwEH;
 *
 * Public: No
 */

params ["_unit", "_weapon", "", "", "_ammo", "", "_projectile"];

if ((_weapon != "Throw") || {!(_ammo isKindOf ["Chemlight_base", configFile >> "CfgAmmo"])}) exitWith {};

// http://feedback.arma3.com/view.php?id=12340
if (isNull _projectile) then {
    _projectile = nearestObject [_unit, _ammo];
};

if (local _unit) then {
    if ([_ammo] call FUNC(isIRClass)) then {
        // Handle Advanced Throwing
        if ((ACE_player getVariable [QEGVAR(advanced_throwing,activeThrowable), objNull]) == _projectile) then {
            [_projectile, _ammo, true] call FUNC(throwIR); // direct call if we are priming with adv throw
        } else {
            [{_this call FUNC(throwIR)}, [_projectile, _ammo]] call CBA_fnc_execNextFrame;
        };
    };
};
