#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the track key being held down.
 * Tracks change in direction of weapon and computes angle change per second.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nlaw_fnc_keyDown
 *
 * Public: No
 */

TRACE_1("lock key down",GVAR(isLockKeyDown));

if (!alive ACE_player) exitWith {};
if (!([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith))) exitWith {};
if (!(ACE_player call CBA_fnc_canUseWeapon)) exitWith {};
if ((getNumber (configFile >> "CfgWeapons" >> (currentWeapon ACE_player) >> QGVAR(enabled))) == 0) exitWith {};
if (GVAR(isLockKeyDown)) exitWith {ERROR("already running?");};

GVAR(isLockKeyDown) = true;
playSound "ACE_Sound_Click";

// Get starting weapon dir
((ACE_player weaponDirection (currentWeapon ACE_player)) call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];

[{
    params ["_args", "_pfID"];
    _args params ["_lastTime", "_lastYaw", "_lastPitch", "_initPhase"];

    if ((!alive ACE_player) ||
            {!([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith))} ||
            {!GVAR(isLockKeyDown)} ||
            {!(ACE_player call CBA_fnc_canUseWeapon)} ||
            {(getNumber (configFile >> "CfgWeapons" >> (currentWeapon ACE_player) >> QGVAR(enabled))) == 0})
    exitWith {
        TRACE_1("ending track",_pfID);
        [_pfID] call CBA_fnc_removePerFrameHandler;
        playSound "ACE_Sound_Click";

        [{ // reset gvars after a short delay
            TRACE_1("reset vars",_this);
            GVAR(yawChange) = 0;
            GVAR(pitchChange) = 0;
        }, [], 0.5] call CBA_fnc_waitAndExecute;
    };

    private _deltaT = CBA_missionTime - _lastTime;
    if (_deltaT == 0) exitWith {};
    if (_initPhase && {_deltaT < 0.75}) exitWith {};

    ((ACE_player weaponDirection (currentWeapon ACE_player)) call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];
    private _yawChange = ([_yaw - _lastYaw] call CBA_fnc_simplifyAngle180) / _deltaT;
    private _pitchChange = ([_pitch - _lastPitch] call CBA_fnc_simplifyAngle180) / _deltaT;

    if (_initPhase) then { // initial value will use first 0.75 seconds of input
        GVAR(yawChange) = _yawChange;
        GVAR(pitchChange) = _pitchChange;
        _args set [3, false];
    } else {
        // smoothing factor alpha - higher values will be more responsive to change, but also spike higher on jerky mouse movmeent
        private _alpha = _deltaT / 3; 
        GVAR(yawChange) = (_yawChange * _alpha) + GVAR(yawChange) * (1 - _alpha);
        GVAR(pitchChange) = (_pitchChange * _alpha) + GVAR(pitchChange) * (1 - _alpha);
    };

    _args set [0, CBA_missionTime];
    _args set [1, _yaw];
    _args set [2, _pitch];

    #ifdef DEBUG_MODE_FULL
    hintSilent format ["Instantaneous\nYaw: %1\n Pitch: %2\nGVAR\nYaw: %3\nPitch: %4", _yawChange, _pitchChange, GVAR(yawChange), GVAR(pitchChange)];
    #endif
}, .25, [CBA_missionTime, _yaw, _pitch, true]] call CBA_fnc_addPerFrameHandler;
