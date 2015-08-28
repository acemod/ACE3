/*
 * Author: commy2
 * Adjust the grenades throwing direction and speed to the selected throwing mode.
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_grenades_fnc_throwGrenade
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_mode", "_fuzeTime"];
params ["_unit", "_weapon", "", "", "", "", "_projectile"];

if (_unit != ACE_player) exitWith {};
if (_weapon != "Throw") exitWith {};

_mode = missionNamespace getVariable [QGVAR(currentThrowMode), 0];

if (_mode != 0) then {
    private "_velocity";

    _velocity = velocity _projectile;

    switch (_mode) do {
        //high throw
    case 1 : {
            _velocity = [
            0.5 * (_velocity select 0),
            0.5 * (_velocity select 1),
            [0, 0, 0] distance (_velocity vectorMultiply 0.5)
            ];
        };
        //precise throw
    case 2 : {
            _velocity = (_unit weaponDirection _weapon) vectorMultiply (vectorMagnitude _velocity);
        };
        //roll grande
    case 3 : {
            //@todo
        };
        //drop grenade
    case 4 : {
            _velocity = [0, 0, 0];
        };
    };

    _projectile setVelocity _velocity;
};

if (typeOf _projectile == "ACE_G_M84") then {
    _fuzeTime = getNumber (configFile >> "CfgAmmo" >> typeOf _projectile >> "fuseDistance");
    // _fuzeTime = getNumber (configFile >> "CfgAmmo" >> typeOf _projectile >> "explosionTime");  //@toDo pretty sure this should be explosionTime not fuseDistance
    [FUNC(flashbangThrownFuze), [_projectile], _fuzeTime, 0] call EFUNC(common,waitAndExecute);
};
