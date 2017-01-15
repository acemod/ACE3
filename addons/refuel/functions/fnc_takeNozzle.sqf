/*
 * Author: GitHawk
 * Take a fuel nozzle either from a fuel truck/station or from the ground.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Truck <OBJECT>
 * 2: Nozzle <OBJECT> (optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, fuelTruck] call ace_refuel_fnc_takeNozzle
 * [player, objNull, nozzle] call ace_refuel_fnc_takeNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_target", objNull, [objNull]],
    ["_nozzle", objNull, [objNull]]
];

REFUEL_HOLSTER_WEAPON

private _endPosOffset = [0, 0, 0];
if (isNull _nozzle) then { // func is called on fuel truck
    _endPosOffset = getArray (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(hooks));
    if (count _endPosOffset == 2) then {
        if (_unit distance (_target modelToWorld (_endPosOffset select 0)) <  _unit distance (_target modelToWorld (_endPosOffset select 1))) then {
            _endPosOffset = _endPosOffset select 0;
        } else {
            _endPosOffset = _endPosOffset select 1;
        };
    } else {
        _endPosOffset = _endPosOffset select 0;
    };
    [
        2,
        [_unit, _target, _endPosOffset],
        {
            params ["_args"];
            _args params [
                ["_unit", objNull, [objNull]],
                ["_target", objNull, [objNull]],
                ["_endPosOffset", [0, 0, 0], [[]], 3]
            ];

            private _newNozzle = QGVAR(fuelNozzle) createVehicle position _unit;
            _newNozzle attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];
            _unit setVariable [QGVAR(nozzle), _newNozzle, true];

            if (_target isKindOf "AllVehicles") then {
                // Currently ropeCreate requires its first parameter to be a real vehicle
                private _rope = ropeCreate [_target, _endPosOffset, _newNozzle, [0, -0.20, 0.12], REFUEL_HOSE_LENGTH];
                _newNozzle setVariable [QGVAR(rope), _rope, true];
            };
            _newNozzle setVariable [QGVAR(attachPos), _endPosOffset, true];
            _newNozzle setVariable [QGVAR(source), _target, true];

            [_target, "blockEngine", "ACE_Refuel", true] call EFUNC(common,statusEffect_set);
            _target setVariable [QGVAR(isConnected), true, true];
            _target setVariable [QGVAR(ownedNozzle), _newNozzle, true];

            [_unit, "forceWalk", "ACE_refuel", true] call EFUNC(common,statusEffect_set);
            _unit setVariable [QGVAR(isRefueling), true];
            private _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
            if (_actionID != -1) then {
                _unit removeAction _actionID;
            };
            _actionID = _unit addAction [
                format ["<t color='#FF0000'>%1</t>", localize ELSTRING(dragging,Drop)],
                '_unit = _this select 0; _nozzle = _unit getVariable QGVAR(nozzle); [_unit, _nozzle] call FUNC(dropNozzle); [_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set); REFUEL_UNHOLSTER_WEAPON',
                nil,
                20,
                false,
                true,
                "",
                '!isNull (_target getVariable [QGVAR(nozzle), objNull])'
            ];
            _unit setVariable [QGVAR(ReleaseActionID), _actionID];

            // Drop nozzle at maximum hose distance
            [_unit, _target, _endPosOffset, _nozzle] call FUNC(maxDistanceDropNozzle);
        },
        "",
        localize LSTRING(TakeNozzleAction),
        {true},
        ["isnotinside"]
    ] call EFUNC(common,progressBar);
} else { // func is called on muzzle either connected or on ground
    [
        2,
        [_unit, _nozzle],
        {
            params ["_args"];
            _args params [
                ["_unit", objNull, [objNull]],
                ["_nozzle", objNull, [objNull]]
            ];

            if (_nozzle getVariable [QGVAR(jerryCan), false]) then {
                _nozzle attachTo [_unit, [0,1,0], "pelvis"];
            } else {
                _nozzle attachTo [_unit, [-0.02,0.05,-0.12], "righthandmiddle1"];
            };
            _unit setVariable [QGVAR(nozzle), _nozzle, true];

            [_unit, "forceWalk", "ACE_refuel", true] call EFUNC(common,statusEffect_set);
            _unit setVariable [QGVAR(isRefueling), true];
            private _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
            if (_actionID != -1) then {
                _unit removeAction _actionID;
            };
            _actionID = _unit addAction [
                format ["<t color='#FF0000'>%1</t>", localize ELSTRING(dragging,Drop)],
                '_unit = _this select 0; _nozzle = _unit getVariable QGVAR(nozzle); [_unit, _nozzle] call FUNC(dropNozzle); [_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set); REFUEL_UNHOLSTER_WEAPON',
                nil,
                20,
                false,
                true,
                "",
                '!isNull (_target getVariable [QGVAR(nozzle), objNull])'
            ];
            _unit setVariable [QGVAR(ReleaseActionID), _actionID];

            // Drop nozzle at maximum hose distance
            private _target = _nozzle getVariable QGVAR(source);
            private _endPosOffset = _nozzle getVariable QGVAR(attachPos);
            [_unit, _target, _endPosOffset, _nozzle] call FUNC(maxDistanceDropNozzle);
        },
        "",
        localize LSTRING(TakeNozzleAction),
        {true},
        ["isnotinside"]
    ] call EFUNC(common,progressBar);
};
