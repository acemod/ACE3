/*
 * Author: commy2
 *
 * Called by repair action / progress bar. Raise events to set the new hitpoint damage.
 *
 * Arguments:
 * Stuff from progress bar.
 *
 * Return Value:
 * NONE
 */
#include "script_component.hpp"

private ["_vehicle", "_hitPoint", "_elapsedTime", "_totalTime"];

_vehicle = _this select 0 select 0;
_hitPoint = _this select 0 select 1;

_elapsedTime = _this select 1;
_totalTime = _this select 2;

// get current hitpoint damage
private "_hitPointDamage";
_hitPointDamage = _vehicle getHitPointDamage _hitPoint;

// subtract repaired damage
_hitPointDamage = _hitPointDamage - _hitPointDamage * (_elapsedTime / _totalTime);

// don't use negative values for damage
_hitPointDamage = _hitPointDamage max 0;

// raise event to set the new hitpoint damage
["setVehicleHitPointDamage", _vehicle, [_vehicle, _hitPoint, _hitPointDamage]] call EFUNC(common,targetEvent);

// display text message if enabled
if (GVAR(DisplayTextOnRepair)) then {
    private "_text";
    _text = format ["STR_ACE_Repair_%1", _hitPoint];

    if (isLocalized _text) then {
        _text = format [localize (["STR_ACE_Repair_RepairedHitPointFully", "STR_ACE_Repair_RepairedHitPointPartially"] select (_hitPointDamage > 0)), localize _text];
    } else {
        _text = localize (["STR_ACE_Repair_RepairedFully", "STR_ACE_Repair_RepairedPartially"] select (_hitPointDamage > 0));
    };

    [_text] call EFUNC(common,displayTextStructured);
};
