/*
 * Author: GitHawk
 * Resets a fuel vehicle in case is got bugged
 *
 * Arguments:
 * 0: Fuel truck <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [truck] call ace_refuel_fnc_reset
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]]];

[_target, "blockEngine", "ACE_Refuel", false] call EFUNC(common,statusEffect_set);
_target setVariable [QGVAR(isConnected), false, true];

private _nozzle = _target getVariable [QGVAR(ownedNozzle), nil];
if !(isNil "_nozzle") then {
    private _nozzleTarget = _nozzle getVariable [QGVAR(sink), nil];
    if !(isNil "_nozzleTarget") then {
        _nozzleTarget setVariable [QGVAR(nozzle), nil, true];
    };

    private _rope = _nozzle getVariable [QGVAR(rope), objNull];
    if !(isNull _rope) then {
        ropeDestroy _rope;
    };
    private _helper = _nozzle getVariable [QGVAR(helper), objNull];
    if !(isNull _helper) then {
        deleteVehicle _helper;
    };

    {
        [QGVAR(resetLocal), [_x, _nozzle], _x] call CBA_fnc_targetEvent;
    } count allPlayers;
    deleteVehicle _nozzle;
};
_target setVariable [QGVAR(ownedNozzle), nil, true];
