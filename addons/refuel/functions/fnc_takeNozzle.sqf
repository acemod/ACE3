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

private ["_endPosOffset"],
params ["_unit", "_target", ["_nozzle", objNull]];

[_unit, QGVAR(vehAttach), true] call EFUNC(common,setForceWalkStatus);

REFUEL_HOLSTER_WEAPON

_endPosOffset = [0, 0, 0];
if (isNull _nozzle) then { // func is called on fuel truck
    _target setVariable [QGVAR(engineHit), _target getHitPointDamage "HitEngine", true];
    if !(local _target) then {
        [[_target, ["HitEngine", 1]], "{(_this select 0) setHitPointDamage (_this select 1)}", _sink] call EFUNC(common,execRemoteFnc);
    } else {
        _target setHitPointDamage ["HitEngine", 1];
    };

    _target setVariable [QGVAR(isConnected), true, true];
    _endPosOffset = getArray (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_hooks");
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
            private ["_newNozzle", "_rope", "_actionID"];
            params ["_args"];
            _args params ["_unit", "_target", "_endPosOffset"];

            _newNozzle = "ACE_refuel_fuelNozzle" createVehicle position _unit;
            _newNozzle attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"]; // TODO replace with right coordinates for real model
            _unit setVariable [QGVAR(nozzle), _newNozzle];

            _rope = ropeCreate [_target, _endPosOffset, _newNozzle, [0, 0, 0], 12];
            _newNozzle setVariable [QGVAR(attachPos), _endPosOffset, true];
            _newNozzle setVariable [QGVAR(source), _target, true];
            _newNozzle setVariable [QGVAR(rope), _rope, true];
            _target setVariable [QGVAR(nozzle), _newNozzle, true];

            _unit setVariable [QGVAR(isRefueling), true];
            _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
            if (_actionID != -1) then {
                _unit removeAction _actionID;
            };
            _actionID = _unit addAction [
                format ["<t color='#FF0000'>%1</t>", localize ELSTRING(dragging,Drop)],
                '_unit = _this select 0; _nozzle = _unit getVariable QGVAR(nozzle); [_unit, _nozzle] call FUNC(dropNozzle); [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus); REFUEL_UNHOLSTER_WEAPON',
                nil,
                20,
                false,
                true,
                "",
                '!isNull (_target getVariable [QGVAR(nozzle), objNull])'
            ];
            _unit setVariable [QGVAR(ReleaseActionID), _actionID];
        },
        "",
        localize LSTRING(TakeNozzleAction),
        {true},
        ["isnotinside"]
    ] call EFUNC(common,progressBar);
} else { // func is called in muzzle either connected or on ground
    [
        2,
        [_unit, _nozzle],
        {
            private ["_actionID"];
            params ["_args"];
            _args params ["_unit", "_nozzle"];
            _nozzle attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"]; // TODO replace with right coordinates for real model
            _unit setVariable [QGVAR(nozzle), _nozzle];

            _unit setVariable [QGVAR(isRefueling), true];
            _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
            if (_actionID != -1) then {
                _unit removeAction _actionID;
            };
            _actionID = _unit addAction [
                format ["<t color='#FF0000'>%1</t>", localize ELSTRING(dragging,Drop)],
                '_unit = _this select 0; _nozzle = _unit getVariable QGVAR(nozzle); [_unit, _nozzle] call FUNC(dropNozzle); [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus); REFUEL_UNHOLSTER_WEAPON',
                nil,
                20,
                false,
                true,
                "",
                '!isNull (_target getVariable [QGVAR(nozzle), objNull])'
            ];
            _unit setVariable [QGVAR(ReleaseActionID), _actionID];
        },
        "",
        localize LSTRING(TakeNozzleAction),
        {true},
        ["isnotinside"]
    ] call EFUNC(common,progressBar);

    _target = _nozzle getVariable QGVAR(source);
    _endPosOffset = _nozzle getVariable QGVAR(attachPos);
};
[{
    private ["_nozzle"];
    params ["_args", "_pfID"];
    _args params ["_unit", "_source", "_endPosOffset"];

    if (_unit distance (_source modelToWorld _endPosOffset) > 10) exitWith {
        _nozzle =  _unit getVariable [QGVAR(nozzle), objNull];
        if !(isNull _nozzle) then {
            [_unit, _nozzle] call FUNC(dropNozzle);
            REFUEL_UNHOLSTER_WEAPON

            [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
            [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);
        };
        [_pfID] call cba_fnc_removePerFrameHandler;
    };
}, 0, [_unit, _target, _endPosOffset]] call cba_fnc_addPerFrameHandler;
