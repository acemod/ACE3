#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Unattaches plug from control box
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_unattachPlug
 *
 * Public: No
 */
params ["_unit", "_plug"];

private _suitcase = _plug getVariable QGVAR(origin);
private _controlBox = _plug getVariable QGVAR(attachedControlBox);

private _suitcaseIndex = _suitcase getVariable QGVAR(attachedToPlugNumber);
if (_suitcaseIndex < 0) exitWith {
    WARNING_1("Somehow unattached plug when not first attached",_suitcaseIndex);
};
_suitcase setVariable [QGVAR(attachedToPlugNumber), -1, true];

private _statuses = _controlBox getVariable QGVAR(plugStatus);
_statuses set [_suitcaseIndex, objNull];
_controlBox setVariable [QGVAR(plugStatus), _statuses, true];

_plug setVariable [QGVAR(attachedControlBox), objNull, true];
[_unit, _plug] call FUNC(pickupPlug);

