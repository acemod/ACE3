/*
 * Author: PabstMirror
 * Handles when a unit is kill.  Reset captivity and escorting status
 *
 * Arguments:
 * 0: _oldUnit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_oldUnit);

if (_oldUnit getVariable [QGVAR(isHandcuffed), false]) then {
    _oldUnit setVariable [QGVAR(isHandcuffed), false, true];
};

if (_oldUnit getVariable [QGVAR(isEscorting), false]) then {
    _oldUnit setVariable [QGVAR(isEscorting), false, true];
};
