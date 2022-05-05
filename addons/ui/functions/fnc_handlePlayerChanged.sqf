#include "script_component.hpp"
/*
 * Author: veteran29
 * Handles switching units.
 *
 * Arguments:
 * 0: New Unit <OBJECT>
 * 1: Old Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [newbob, oldbob] call ace_ui_fnc_handlePlayerChanged
 *
 * Public: No
 */
params ["_newUnit", "_oldUnit"];
TRACE_2("unit changed",_newUnit,_oldUnit);

if (!isNull _oldUnit) then {
    _oldUnit removeEventHandler ["AnimChanged", _oldUnit getVariable [QGVAR(animHandler), -1]];
    _oldUnit setVariable [QGVAR(animHandler), nil];
    TRACE_1("remove old",_oldUnit getVariable QGVAR(animHandler));
};

// Don't add a new EH if the unit respawned
if (_newUnit getVariable [QGVAR(animHandler), -1] == -1) then {
    private _animHandler = _newUnit addEventHandler ["AnimChanged", LINKFUNC(onAnimChanged)];
    TRACE_1("add new",_animHandler);
    _newUnit setVariable [QGVAR(animHandler), _animHandler];
};
