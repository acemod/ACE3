#include "..\script_component.hpp"
/*
 * Author: johnb432, PabstMirror
 * Adds event hander for explosions (for local projectiles)
 *
 * Arguments:
 * 0: Code to execute <CODE>
 *
 * Return Value:
 * The CBA Event Handler Index <NUMBER>
 *
 * Example:
 * [{systemChat "boom"}] call ace_common_fnc_addExplosionEventHandler
 *
 * Public: Yes
 */

params [["_code", {}, [{}]]];

if !(missionNamespace getVariable [QGVAR(addExplosionEventHandlerActive), false]) then {
    GVAR(addExplosionEventHandlerActive) = true;

    addMissionEventHandler ["ProjectileCreated", {
        params ["_projectile"];
        TRACE_2("pc",typeOf _projectile,local _projectile);

        if (!local _projectile) exitWith {}; // Rockets only explode on local clients

        _projectile addEventHandler ["Explode", {
            TRACE_1("exp",_this);
            [QGVAR(explosion), _this] call CBA_fnc_localEvent;
        }];
    }];
};

[QGVAR(explosion), _code] call CBA_fnc_addEventHandler
