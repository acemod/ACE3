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

_key = missionNamespace getvariable [format[QGVAR(%1_encryptionKey), _side], [""]];

_key;
