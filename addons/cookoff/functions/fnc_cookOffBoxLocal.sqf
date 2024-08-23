#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, kymckay, johnb43
 * Spawns local cook-off effects for ammo boxes.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Source <OBJECT>
 * 2: Instigator <OBJECT>
 * 3: Start time of the cook-off <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, player, CBA_missionTime + 10] call ace_cookoff_fnc_cookOffBoxLocal
 *
 * Public: No
 */

params ["", "", "", "_startTime"];

[{
    params ["_box", "_source", "_instigator"];

    // If box was deleted before smoke could be spawned, just exit
    if (isNull _box) exitWith {};

    private _boxPos = ASLToAGL getPosASL _box;
    private _effects = [];

    // Box will start smoking
    if (hasInterface) then {
        private _smoke = createVehicleLocal ["#particlesource", _boxPos, [], 0, "CAN_COLLIDE"];
        _smoke setParticleClass "AmmoSmokeParticles2";
        _smoke attachTo [_box];

        _effects pushBack _smoke;
    };

    if (isServer) then {
        private _sound = createSoundSource ["Sound_Fire", _boxPos, [], 0];
        _sound attachTo [_box];

        _effects pushBack _sound;

        // Detonate the ammunition
        [QGVAR(detonateAmmunitionServer), [_box, true, _source, _instigator, random [DETONATION_DELAY / 2, DETONATION_DELAY, DETONATION_DELAY / 2 * 3]]] call CBA_fnc_localEvent;
    };

    _box setVariable [QGVAR(effects), _effects];
}, _this, (_startTime - CBA_missionTime) max 0] call CBA_fnc_waitAndExecute; // This delay allows for synchronisation for JIP players
