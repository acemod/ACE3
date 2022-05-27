#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Slew keybind pressed
 *
 * Arguments:
 * 0: Override if true, Observe if false <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_hunterkiller_fnc_keydown
 *
 * Public: No
 */

if ((GVAR(mode) == MODE_NO_ACTIONS) || {!([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith))}) exitWith {
    false
};

params ["_mode"];
if ((_mode == "observe") && {!(GVAR(mode) in [MODE_OBSERVE, MODE_OBSERVE_AND_OVERRIDE])}) exitWith { false };
if ((_mode == "override") && {!(GVAR(mode) in [MODE_OVERRIDE, MODE_OBSERVE_AND_OVERRIDE])}) exitWith { false };

private _vehicle = vehicle ACE_player;
private _playerTurret = _vehicle unitTurret ACE_player;

private _eyePos = eyePos _vehicle;
private _lookDir = if (_mode == "override") then {
    TRACE_2("looking at",_mode,_playerTurret);
    ([1] + ([_vehicle, _playerTurret] call CBA_fnc_turretDir)) call CBA_fnc_polar2vect
} else {
    TRACE_2("looking at",_mode,GVAR(targetTurret));
    ([1] + ([_vehicle, GVAR(targetTurret)] call CBA_fnc_turretDir)) call CBA_fnc_polar2vect
};

private _lookPoint = _eyePos vectorAdd (_lookDir vectorMultiply 5000);
if (_mode == "override") then {
    [QGVAR(slew), [_vehicle, GVAR(targetTurret), _lookPoint, true], _vehicle, GVAR(targetTurret)] call CBA_fnc_turretEvent;
} else {
    [QGVAR(slew), [_vehicle, _playerTurret, _lookPoint, false]] call CBA_fnc_localEvent; // we know it's local
};

playSound "ACE_Sound_Click";

true // return (key used)
