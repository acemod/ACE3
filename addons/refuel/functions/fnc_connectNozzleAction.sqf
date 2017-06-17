/*
 * Author: GitHawk et.al.
 * Calculates a connection for refueling.
 * With code from ace_attach
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Visual Position <ARRAY>
 * 3: Nozzle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, tank, [0,0,0], nozzle] call ace_refuel_fnc_connectNozzleAction
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_closeInDistance", "_endPosTestOffset"];

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]], ["_startingPosition", [0,0,0], [[]], 3], ["_nozzle", objNull, [objNull]]];
private _startingOffset = _target worldToModel _startingPosition;

private _startDistanceFromCenter = vectorMagnitude _startingOffset;
private _closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);

private _closeInMax = _startDistanceFromCenter;
private _closeInMin = 0;

while {(_closeInMax - _closeInMin) > 0.01} do {
    _closeInDistance = (_closeInMax + _closeInMin) / 2;
    _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    private _endPosTest = _target modelToWorldVisual _endPosTestOffset;

    private _doesIntersect = false;
    {
        if (_doesIntersect) exitWith {};
        private _startingPosShifted = _startingPosition vectorAdd _x;
        _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLtoASL _startingPosShifted};
        {
            _endPosShifted = _endPosTest vectorAdd _x;
            private _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLtoASL _endPosShifted};

            //Uncomment to see the lazor show, and see how the scanning works:
            // drawLine3D [_startingPosShifted, _endPosShifted, [1,0,0,1]];
            if (_target in lineIntersectsWith [_startASL, _endASL, _unit]) exitWith {_doesIntersect = true};
        } forEach [[0,0,0.045], [0,0,-0.045], [0,0.045,0], [0,-0.045,0], [0.045,0,0], [-0.045,0,0]];
    } forEach [[0,0,0], [0,0,0.05], [0,0,-0.05]];

    if (_doesIntersect) then {
        _closeInMax = _closeInDistance;
    } else {
        _closeInMin = _closeInDistance;
    };
};

_closeInDistance = (_closeInMax + _closeInMin) / 2;

//Checks (too close to center or can't attach)
if ((_startDistanceFromCenter - _closeInDistance) < 0.1) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = (_closeInDistance - 0.05);

_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, (_startingOffset select 2)];

[
    REFUEL_PROGRESS_DURATION,
    [_unit, _nozzle, _target, _endPosTestOffset],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_target", objNull, [objNull]], ["_endPosTestOffset", [0,0,0], [[]], 3]];
        _unit setVariable [QGVAR(nozzle), nil, true];
        _unit setVariable [QGVAR(isRefueling), false];
        [_unit, "forceWalk", "ACE_refuel", false] call EFUNC(common,statusEffect_set);
        REFUEL_UNHOLSTER_WEAPON
        private _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
        if (_actionID != -1) then {
            _unit removeAction _actionID;
            _unit setVariable [QGVAR(ReleaseActionID), nil];
        };

        detach _nozzle;
        _nozzle attachTo [_target, _endPosTestOffset];
        _endPosTestOffset params ["_x", "_y"];
        private _bb = boundingBoxReal _target;
        _bb params ["_ll", "_rr"];
        _ll set [2, 0];
        _rr set [2, 0];
        _ll params ["_x1", "_y1"];
        _rr params ["_x2", "_y2"];
        private _c1 = _ll vectorCos _endPosTestOffset;
        private _c2 = _ll vectorCos [_x1, _y2, 0];
        private _cn = (_ll vectorCrossProduct [0, 0, 1]) vectorCos _endPosTestOffset;
        private _dirAndUp = [[1, 0, 0],[0, 0, 1]];
        if (_c1 > _c2 && (_cn > 0)) then {
            _dirAndUp = [[1, 0, 0.8],[0, 0, 1]];
        } else {
            _c1 = [_x1, _y2, 0] vectorCos _endPosTestOffset;
            _c2 = [_x1, _y2, 0] vectorCos _rr;
            _cn = ([_x1, _y2, 0] vectorCrossProduct [0, 0, 1]) vectorCos _endPosTestOffset;
            if (_c1 > _c2 && (_cn > 0)) then {
                _dirAndUp = [[0, -1, 0.8],[0, 0, 1]];
            } else {
                _c1 = _rr vectorCos _endPosTestOffset;
                _c2 = _rr vectorCos [_x2, _y1, 0];
                _cn = (_rr vectorCrossProduct [0, 0, 1]) vectorCos _endPosTestOffset;
                if (_c1 > _c2 && (_cn > 0)) then {
                    _dirAndUp = [[-1, 0, 0.8],[0, 0, 1]];
                } else {
                    _dirAndUp = [[0, 1, 0.8],[0, 0, 1]];
                };
            };
        };
        [QEGVAR(common,setVectorDirAndUp), [_nozzle, _dirAndUp], _nozzle] call CBA_fnc_targetEvent;
        _nozzle setVariable [QGVAR(sink), _target, true];
        _nozzle setVariable [QGVAR(isConnected), true, true];
        _target setVariable [QGVAR(nozzle), _nozzle, true];

        _source = _nozzle getVariable QGVAR(source);
        private _fuel = [_source] call FUNC(getFuel);
        if (_fuel == REFUEL_INFINITE_FUEL) then {
            _source setVariable [QGVAR(fuelCounter), 0, true];
        } else {
            _source setVariable [QGVAR(fuelCounter), _fuel, true];
        };

        [_unit, _target, _nozzle, _endPosTestOffset] call FUNC(refuel);
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
