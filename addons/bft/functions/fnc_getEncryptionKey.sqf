
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: ID <string>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_side", "_generateNew"];
_side = _this select 0;
_generateNew = _this select 1;

_keys = missionNamespace getvariable [format[QGVAR(%1_encryptionKeys), _side], []];

if (_generateNew) exitwith {
    _newKey = format["%1%2%3", diag_tickTime, diag_frameNo, random(10)];
    _keys pushback _newKey;

    missionNamespace setvariable [format[QGVAR(%1_encryptionKeys), _side], _keys];

    _newKey;
};

if (count _keys > 0) exitwith {
    _keys select (floor(random(count _keys)));
}
[];
