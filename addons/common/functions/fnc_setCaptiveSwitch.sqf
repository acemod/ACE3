/**
 * fn_setCaptiveSwitch.sqf
 * @Descr: Register a unit as captive for the unconscious state
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, setCaptive BOOL]
 * @Return: BOOL True if unit is put as set captive, otherwise false
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_captiveSwitch", "_setCaptive"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_setCaptive = [_this, 1, false, [false]] call BIS_fnc_Param;


_captiveSwitch = true;
if (_setCaptive) then {
    if (captive _unit) then {
        _captiveSwitch = false;
    } else {
        _unit setCaptive true;
    };
} else {
    if (captive _unit) then {
        _unit setCaptive false;
    } else {
        _captiveSwitch = false;
    };
};

_captiveSwitch