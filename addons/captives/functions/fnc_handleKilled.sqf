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
 * [bob1] call ACE_captives_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_oldUnit);

if (!local _oldUnit) exitWith {};

if (_oldUnit getVariable [QGVAR(isHandcuffed), false]) then {
    [_oldUnit, false] call FUNC(setHandcuffed);
};

if (_oldUnit getVariable [QGVAR(isEscorting), false]) then {
    _oldUnit setVariable [QGVAR(isEscorting), false, true];
};

if (_oldUnit getVariable [QGVAR(isSurrendering), false]) then {
    [_oldUnit, false] call FUNC(setSurrendered);
};
