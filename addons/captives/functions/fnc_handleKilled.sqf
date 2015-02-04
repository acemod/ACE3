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

if (_oldUnit getVariable ["ACE_isCaptive", false]) then {
    _oldUnit setVariable ["ACE_isCaptive", false, true];
};

if (_oldUnit getVariable ["ACE_isEscorting", false]) then {
    _oldUnit setVariable ["ACE_isEscorting", false, true]
};
