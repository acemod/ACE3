#include "..\script_component.hpp"
/*
 * Author: commy2
 * Waits for the flashbang grenade fuze to trigger and 'explode'
 *
 * Arguments:
 * 0: Flashbang grenade <OBJECT>
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
    private _posASL = getPosASL _projectile;
    private _soundFile = format ["A3\Sounds_F\arsenal\explosives\grenades\Explosion_HE_grenade_0%1.wss", floor (random 4) + 1];
    playSound3D [_soundFile, _projectile, false, _posASL, 5, 1.2, 400];

    ["ace_flashbangExploded", [_posASL]] call CBA_fnc_globalEvent;
};
