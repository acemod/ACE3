/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when the treatment fails
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 * 4: Items available <ARRAY<STRING>>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args"];
_args params ["_caller", "_target", "_selectionName", "_className", "_items", "_usersOfItems"];

// switch to end anim immediately
private _endInAnim = _caller getVariable QGVAR(endInAnim);

if (!isNil "_endInAnim") then {
    if (animationState _caller != _endInAnim) then {
        [_caller, _endInAnim, 2] call EFUNC(common,doAnimation);
    };
    _caller setVariable [QGVAR(endInAnim), nil];
    TRACE_1("abort",_endInAnim);
};

// reset sped up animations
[QEGVAR(common,setAnimSpeedCoef), [_caller, 1]] call CBA_fnc_globalEvent;

{
    _x params ["_unit", "_item"];
    _unit addItem _item;
} forEach _usersOfItems;

// Record specific callback
private _config = configFile >> QGVAR(Actions) >> CUR_LEVEL >> _className;

private _callback = getText (_config >> "callbackFailure");

if (isNil _callback) then {
    _callback = compile _callback;
} else {
    _callback = missionNamespace getVariable _callback;
};

if !(_callback isEqualType {}) then {
    _callback = {TRACE_1("callback was NOT code",_callback)};
};

_args call _callback;
