#include "..\script_component.hpp"
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

if (
    (GVAR(mode) == MODE_NO_ACTIONS)
    || {!([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith))}
    || {isTurnedOut ACE_player}
) exitWith {
    false
};

params ["_modeOverride"];
TRACE_1("keydown",_modeOverride);
if ((_modeOverride) && {!(GVAR(mode) in [MODE_OVERRIDE, MODE_OBSERVE_AND_OVERRIDE])}) exitWith { false };
if ((!_modeOverride) && {!(GVAR(mode) in [MODE_OBSERVE, MODE_OBSERVE_AND_OVERRIDE])}) exitWith { false };

private _vehicle = vehicle ACE_player;
private _playerTurret = _vehicle unitTurret ACE_player;

private _sourceTurret = [GVAR(targetTurret), _playerTurret] select _modeOverride;
private _puppetTurret = [_playerTurret, GVAR(targetTurret)] select _modeOverride;
TRACE_3("",_modeOverride,_sourceTurret,_puppetTurret);

private _eyePos = eyePos _vehicle;
private _lookDir = if ((getNumber (([_vehicle, _sourceTurret] call CBA_fnc_getTurret) >> "primaryObserver")) == 1) then {
    TRACE_1("using commander",_sourceTurret);
    // CBA_fnc_turretDir fails on "CUP_B_M1A2SEP_TUSK_II_NATO", but eyeDirection should be correct on commander turrets
    eyeDirection _vehicle
} else {
    ([1] + ([_vehicle, _sourceTurret] call CBA_fnc_turretDir)) call CBA_fnc_polar2vect
};
private _lookPoint = _eyePos vectorAdd (_lookDir vectorMultiply 5000);

TRACE_1("sending event",_lookDir);
[QGVAR(slew), [_vehicle, _puppetTurret, _lookPoint, _modeOverride], _vehicle, _puppetTurret] call CBA_fnc_turretEvent;

playSound "ACE_Sound_Click";

true // return (key used)
