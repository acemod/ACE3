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

if ((!GVAR(isMaster)) || {!([ACE_player, vehicle ACE_player, []] call EFUNC(common,canInteractWith))}) exitWith {
    false
};

params ["_isOverride"];

private _vehicle = vehicle ace_player;
private _config = configOf _vehicle;
private _masterTurret = [_config >> QGVAR(masterTurret), "ARRAY", [0, 0]] call CBA_fnc_getConfigEntry;
private _puppetTurret = [_config >> QGVAR(puppetTurret), "ARRAY", [0]] call CBA_fnc_getConfigEntry;


private _eyePos = eyePos _vehicle;
private _lookDir = if (_isOverride) then {
    // CBA_fnc_turretDir has problems on some commander turrets, we can just use eyeDirection to get high precision turret dir
    // The accuracy is higher here because the turret is local to us
    eyeDirection _vehicle // assume masterTurret is the obsTurret
} else {
    ([1] + ([_vehicle, _puppetTurret] call CBA_fnc_turretDir)) call CBA_fnc_polar2vect
};

private _lookPoint = _eyePos vectorAdd (_lookDir vectorMultiply 5000);

if (_isOverride) then {
    [QGVAR(slew), [_vehicle, _puppetTurret, _lookPoint, _isOverride], _vehicle, _puppetTurret] call CBA_fnc_turretEvent;
} else {
    [QGVAR(slew), [_vehicle, _masterTurret, _lookPoint, _isOverride]] call CBA_fnc_localEvent; // we know it's local
};

playSound "ACE_Sound_Click";

true // return (key used)
