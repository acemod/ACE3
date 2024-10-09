#include "..\script_component.hpp"
/*
 * Author: johnb432, PabstMirror
 * Adds event hander for explosions (for local projectiles)
 * Warning: For shots that are tracers and explosive the event will trigger on all machines in range
 *          This function may be changed after 2.18!
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
 * Public: No (maybe after 2.18)
 */

params [["_code", {}, [{}]]];

if !(missionNamespace getVariable [QGVAR(addExplosionEventHandlerActive), false]) then {
    GVAR(addExplosionEventHandlerActive) = true;

    // Add EH to existing projectiles and mines
    {
        TRACE_2("existing",typeOf _x,local _x);
        // Rockets only explode on local clients
        _x addEventHandler ["Explode", {
            TRACE_1("exp (existing)",_this);
            [QGVAR(explosion), _this] call CBA_fnc_localEvent;
        }];
    } forEach ((8 allObjects 2) select {local _x});

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
