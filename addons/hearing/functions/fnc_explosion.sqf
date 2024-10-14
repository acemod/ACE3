#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Handles deafness due to explosions going off near the player.
 *
 * Arguments:
 * 0: Projectile <OBJECT>
 * 1: Explosion position ASL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile, [0, 0, 0]] call ace_hearing_fnc_explosion
 *
 * Public: No
 */

// Ignore spectators, curators and alike
if ((getNumber (configOf ACE_player >> "isPlayableLogic")) == 1) exitWith {};

params ["_projectile", "_pos"];

// Don't allow for distances under 1
private _distance = ((eyePos ACE_player) vectorDistance _pos) max 1;

// Fast exit if explosion far away
if (_distance > 100) exitWith {
    TRACE_1("too far away",_distance);
};

private _ammoConfig = configOf _projectile;
private _hit = getNumber (_ammoConfig >> "hit");
if (_hit < 0.5) exitWith { TRACE_1("ignore smoke/flare",_hit) };
private _explosive = getNumber (_ammoConfig >> "explosive");

private _vehAttenuation = [GVAR(playerVehAttenuation), 1] select (isNull objectParent ACE_player || {isTurnedOut ACE_player});

TRACE_4("",typeOf _projectile,_distance,_explosive,_vehAttenuation);

(if (isArray (_ammoConfig >> "soundHit1")) then {
    getArray (_ammoConfig >> "soundHit1")
} else {
    getArray (_ammoConfig >> "soundHit")
}) params ["", ["_volume", 1], "", ["_maxDistance", 1500]];

if (_distance > _maxDistance) exitWith {
    TRACE_2("too far away",_distance,_maxDistance);
};

// Tone down _maxDistance to bring strength back to similar levels as a large burst of a loud weapon
private _strength = _vehAttenuation * _explosive * _volume * (_maxDistance / 2) / _distance^2;
TRACE_6("strength",_vehAttenuation,_explosive,_volume,_maxDistance,_distance,_strength);

// Call immediately, as it will get picked up later by the update thread anyway
(_strength * GVAR(explosionDeafnessCoefficient)) call FUNC(earRinging);
