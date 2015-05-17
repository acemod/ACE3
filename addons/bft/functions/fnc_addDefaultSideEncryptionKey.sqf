/*
 * Author: Glowbal
 *
 * Arguments:
 * 0: Side <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_side", "_key"];
_side = _this select 0;
_key = _this select 1;

_variableName = format[QGVAR(%1_encryptionKey), _side];
_keys = missionNamespace getvariable [_variableName, []];
if !(_key in _keys) then {

    _keys pushback _key;
    missionNamespace setvariable [_variableName, _keys];
    publicVariable "_variableName";
};
