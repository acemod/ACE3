/*
 * Author: PabstMirror
 * Handles when a unit is kill.  Reset captivity and escorting status when getting killed
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

if (_oldUnit getVariable [QGVAR(isCaptive), false]) then {
    _oldUnit setVariable [QGVAR(isCaptive), false, true];
};

if (_oldUnit getVariable [QGVAR(isEscorting), false]) then {
    _oldUnit setVariable [QGVAR(isEscorting), false, true]
};
