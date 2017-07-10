/*
 * Author: GitHawk, Jonpas
 * Drops the nozzle at maximum hose distance.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Truck <OBJECT>
 * 2: End Pos Offset <ARRAY>
 * 3: Nozzle <OBJECT> (optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck, [0, 0, 0], nozzle] call ace_refuel_fnc_maxDistanceDropNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_source", "_endPosOffset", "_nozzle"];

// Exit if jerry can (no maximum distance there as it's not connected to anything)
if (_nozzle getVariable [QGVAR(jerryCan), false]) exitWith {};

// Check distance periodically to drop it at maximum hose length
[{
    params ["_args", "_pfID"];
    _args params [
        ["_unit", player, [objNull]],
        ["_source", objNull, [objNull]],
        ["_endPosOffset", [0, 0, 0], [[]], 3],
        ["_nozzle", (_args select 0) getVariable [QGVAR(nozzle), objNull], [objNull]]
    ];

    if (!(_unit getVariable [QGVAR(isRefueling), false])) exitWith {
        TRACE_1("player not isRefueling",_unit);
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };

    private _hoseLength = _source getVariable [QGVAR(hoseLength), GVAR(hoseLength)];
    if (isNull _source || {_unit distance (_source modelToWorld _endPosOffset) > (_hoseLength - 2)} || {!alive _source}) exitWith {
        if !(isNull _nozzle) then {
            [_unit, _nozzle] call FUNC(dropNozzle);
            REFUEL_UNHOLSTER_WEAPON

            [_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
            if (isNull _source || {!alive _source}) then {
                private _rope = _nozzle getVariable [QGVAR(rope), objNull];
                if !(isNull _rope) then {
                    ropeDestroy _rope;
                };
                private _helper = _nozzle getVariable [QGVAR(helper), objNull];
                if !(isNull _helper) then {
                    deleteVehicle _helper;
                };
                deleteVehicle _nozzle;
            } else {
                [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);
            };
        };
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_unit, _target, _endPosOffset, _nozzle]] call CBA_fnc_addPerFrameHandler;
