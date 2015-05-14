/*
 * Author: Glowbal
 * IV Treatment local callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: Item used classname <STRING>
 *
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_target", "_ivItem", "_config", "_volumeAdded", "_typeOf", "_varName", "_bloodVolume"];
_target = _this select 0;
_ivItem = _this select 1;

_bloodVolume = _target getvariable [QGVAR(bloodVolume), 100];
if (_bloodVolume >= 100) exitwith {};

// Find the proper attributes for the used IV
_config = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "IV");
_volumeAdded = getNumber (_config >> "volume");
_typeOf = getText (_config >> "type");

if (isClass (_config >> _ivItem)) then {
    _config = (_config >> _ivItem);
    if (isNumber (_config >> "volume")) then { _volumeAdded = getNumber (_config >> "volume");};
    if (isText (_config >> "type")) then { _typeOf = getText (_config >> "type"); };
};

_varName = format["ACE_Medical_IVVolume_%1",_typeOf];
_target setvariable [_varName, (_target getvariable [_varName, 0]) + _volumeAdded, true];

if !(_varName in GVAR(IVBags)) then {
    GVAR(IVBags) pushback _varName;
    publicVariable QGVAR(IVBags);
};
