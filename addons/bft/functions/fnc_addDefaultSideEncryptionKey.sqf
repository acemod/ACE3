#include "script_component.hpp"
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


params ["_side", "_key"];

private _variableName = format[QGVAR(%1_encryptionKey), _side];
private _keys = missionNamespace getvariable [_variableName, []];

if !(_key in _keys) then {
    _keys pushback _key;
    missionNamespace setvariable [_variableName, _keys, true];
};
