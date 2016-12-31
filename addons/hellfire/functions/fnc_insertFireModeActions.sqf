/*
 * Author: PabstMirror
 * Adds actions to switch the firemode to a vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [(vehicle player)] call ace_hellfire_fnc_insertFireModeActions
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("insertFireModeActions",_vehicle);

if (_vehicle getVariable [QGVAR(actionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(actionsAdded), true];

private _action = [QUOTE(ADDON), localize LSTRING(hellfireModeAction), "", {}, {true}] call EFUNC(interact_menu,createAction);
private _basePath = [_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);

private _fnc_statement = {
    params ["_target", "", "_attackProfile"];
    TRACE_2("statement",_target,_attackProfile);

    _target setVariable [QEGVAR(missileguidance,attackProfile), _attackProfile];
};
private _fnc_condition = {
    params ["_target", "_player", "_attackProfile"];

    ((gunner _target) == _player) &&
    {(_target getVariable [QEGVAR(missileguidance,attackProfile), "hellfire"]) != _attackProfile};
};

{
    private _displayName = getText (configFile >> QEGVAR(missileguidance,AttackProfiles) >> _x >> "name");
    private _action = [format [QGVAR(%1),_x], _displayName, "", _fnc_statement, _fnc_condition, {}, _x] call EFUNC(interact_menu,createAction);
    [_vehicle, 1, _basePath, _action] call EFUNC(interact_menu,addActionToObject);
} forEach ["hellfire", "hellfire_hi", "hellfire_lo"];

TRACE_2("interactions added",_vehicle,typeOf _vehicle);
