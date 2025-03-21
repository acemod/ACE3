#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Sets up missile guidance state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Navigation Parameters <ARRAY>
 *
 * Example:
 * [] call ace_nlaw_fnc_onFired
 *
 * Public: No
 */

params ["_firedEH", "_launchParams", "_flightParams", "_seekerParams", "_stateParams"];
_firedEH params ["_shooter","","","","","","_projectile"];
_launchParams params ["","_targetLaunchParams","","_attackProfile"];
_targetLaunchParams params ["_target"];
_stateParams params ["", "", "", "", "_navigationParams"];

// Reset _launchPos origin as projectile's height instead of player's foot
_targetLaunchParams set [2, getPosASL _projectile];

// Get state params:
TRACE_3("start of attack profile",_attackProfile,_shooter,vectorDir _projectile);

private _firedLOS = _shooter weaponDirection (currentWeapon _shooter);
private _yawChange = 0;
private _pitchChange = 0;

if (_shooter == ACE_player) then {
    TRACE_2("isPlayer",GVAR(yawChange),GVAR(pitchChange));
    _yawChange = GVAR(yawChange);
    _pitchChange = GVAR(pitchChange);
    TRACE_1("los check",_firedLOS call CBA_fnc_vect2Polar);
} else {
    if ((!isNil "_target") && {!isNull _target}) then {
        _firedLOS = (getPosASL _projectile) vectorFromTo (aimPos _target);
        (((eyePos _shooter) vectorFromTo (aimPos _target)) call CBA_fnc_vect2Polar) params ["", "_startYaw", "_startPitch"];
        // Add some random error to AI's velocity prediction:
        private _random = random [(_shooter skillFinal "aimingAccuracy") min 0.9, 1, 2-((_shooter skillFinal "aimingAccuracy") min 0.9)];
        (((eyePos _shooter) vectorFromTo ((aimPos _target) vectorAdd ((velocity _target) vectorMultiply (_random)))) call CBA_fnc_vect2Polar) params ["", "_predictedYaw", "_predictedPitch"];
        _yawChange = ([_predictedYaw - _startYaw] call CBA_fnc_simplifyAngle180);
        _pitchChange = ([_predictedPitch - _startPitch] call CBA_fnc_simplifyAngle180);
        TRACE_1("AI",_target);
    } else {
        TRACE_1("AI - no target",_target);
    };
};

// Limit Max Deflection
//_yawChange = -10 max _yawChange min 10;
//_pitchChange = -10 max _pitchChange min 10;

((velocity _projectile) call CBA_fnc_vect2polar) params ["", "_currentYaw", "_currentPitch"];
((ACE_player weaponDirection (currentWeapon ACE_player)) call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];

TRACE_5("attackProfileStateParams",_firedLOS,_yawChange,_pitchChange,_currentPitch,_currentYaw);
_navigationParams set [0, _yawChange];
_navigationParams set [1, _pitchChange];
_navigationParams set [2, _currentPitch]; // last pitch
_navigationParams set [3, _currentYaw]; // last yaw
_navigationParams set [4, _pitch]; // initial pitch
_navigationParams set [5, 0]; // whether or not to zero out the pitch
_navigationParams set [6, 0];
_navigationParams

