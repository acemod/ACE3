#include "..\script_component.hpp"
/*
 * Author: commy2
 * Waits for the flashbang grenade fuze to trigger and 'explode'
 *
 * Arguments:
 * 0: projectile - Flashbang Grenade <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [theFlashbang] call ace_grenades_fnc_flashbangThrownFuze
 *
 * Public: No
 */

params ["_projectile"];
TRACE_1("params",_projectile);

if (alive _projectile) then {
    ([
        _projectile call CBA_fnc_getObjectConfig >> QGVAR(flashbangExplodeSound),
        "ARRAY",
        ["A3\Sounds_F\arsenal\explosives\grenades\Explosion_HE_grenade_01.wss", 5, 1.2, 400]
    ] call CBA_fnc_getConfigEntry) params ["_file", "_volume", "_pitch", "_distance"];

    playSound3D [_file, _projectile, false, getPosASL _projectile, _volume, _pitch, _distance];

    ["ace_flashbangExploded", [getPosASL _projectile]] call CBA_fnc_globalEvent;
};
