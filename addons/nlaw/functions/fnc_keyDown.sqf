/*
 * Author: PabstMirror
 * 
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
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

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

        [{
            TRACE_1("reset vars",_this);
            GVAR(yawChange) = 0;
            GVAR(pitchChange) = 0;
        }, [], 1] call CBA_fnc_waitAndExecute;
    };

    private _deltaT = CBA_missionTime - _lastTime;
    if (_deltaT == 0) exitWith {};
    if (_initPhase && {_deltaT < 0.75}) exitWith {};

    ((ACE_player weaponDirection (currentWeapon ACE_player)) call CBA_fnc_vect2Polar) params ["", "_yaw", "_pitch"];
    private _yawChange = ([_yaw - _lastYaw] call CBA_fnc_simplifyAngle180) / _deltaT;
    private _pitchChange = ([_pitch - _lastPitch] call CBA_fnc_simplifyAngle180) / _deltaT;

    if (_initPhase) then { // initial value will use last 0.75 seconds
        GVAR(yawChange) = _yawChange;
        GVAR(pitchChange) = _pitchChange;
        _args set [3, false];
    } else {
        private _alpha = _deltaT / 3; // todo: tweak filtering alpha
        GVAR(yawChange) = (_yawChange * _alpha) + GVAR(yawChange) * (1 - _alpha);
        GVAR(pitchChange) = (_pitchChange * _alpha) + GVAR(pitchChange) * (1 - _alpha);
    };

    _args set [0, CBA_missionTime];
    _args set [1, _yaw];
    _args set [2, _pitch];

    #ifdef DEBUG_MODE_FULL
    hintSilent format ["Now\n%1\n%2\nGVAR\n%3\n%4", _yawChange, _pitchChange, GVAR(yawChange), GVAR(pitchChange)];
    #endif
}, .25, [CBA_missionTime, _yaw, _pitch, true]] call CBA_fnc_addPerFrameHandler;
