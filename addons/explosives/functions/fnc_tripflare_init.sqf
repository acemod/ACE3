#include "..\script_component.hpp"
/*
 * Author: VKing, MikeMF, PabstMirror
 * Spawns a flare on the ground for tripflare trigger.
 *
 * Arguments:
 * 0: Ammo <OBJECT>
 * 1: Position ASL (not used) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, [0, 0, 0]] call ace_explosives_fnc_tripflare_init
 *
 * Public: no
 */

params ["_mine"];

// Runs where mine is local
_mine addEventHandler ["Explode", {
    params ["_projectile", "_posASL"];
    TRACE_2("tripflare-explode",_projectile,_posASL);

    private _flareClass = getText (configOf _projectile >> QGVAR(flareClass));
    if (_flareClass == "") exitWith { ERROR_1("bad flare cfg %1",typeOf _projectile) };

    private _airburst = _projectile getVariable [QGVAR(airburst), false];
    if (_airburst) then {
        _posASL set [2, _posASL # 2 + 200];
    };

    private _pos = ASLToAGL _posASL;

    private _flare = createVehicle [_flareClass, _pos, [], 0, "CAN_COLLIDE"];
    _flare setVelocity [0, 0, -1]; // Used for air mode, does nothing if already on the ground

    TRACE_1("",_flare);
    ["ace_tripflareTriggered", [_flare, _pos]] call CBA_fnc_globalEvent;
}];

nil
