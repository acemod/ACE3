/*
 * Author: GitHawk et.al.
 * Calculates a connection for refueling.
 * With code from ace_attach
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Vehicle <OBJECT>
 * 2: Visual Position ASL <ARRAY>
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

params [["_unit", objNull, [objNull]], ["_sink", objNull, [objNull]], ["_startingPosASL", [0,0,0], [[]], 3], ["_nozzle", objNull, [objNull]]];


private _bestPosASL = [];
private _bestPosDistance = 1e99;
private _viewPos = _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,0,1])) vectorMultiply 3);
private _modelVector = _startingPosASL vectorFromTo (AGLtoASL (_sink modelToWorld [0,0,0]));
private _modelVectorLow = _startingPosASL vectorFromTo (AGLtoASL (_sink modelToWorld [0,0,-1]));

{
    private _endPosASL = _x;
    // [_startingPosASL, _endPosASL, [1,0,0,1]] call EFUNC(common,addLineToDebugDraw); // Debug scan lines
    private _intersections = lineIntersectsSurfaces [_startingPosASL, _endPosASL, _unit];
    {
        _x params ["_intersectPosASL", "", "_intersectObject"];
        if (_intersectObject == _sink) then {
            private _distance = _startingPosASL distance _intersectPosASL;
            if (_distance < _bestPosDistance) then {
                _bestPosDistance = _distance;
                _bestPosASL = _intersectPosASL;
            };
        };
    } forEach _intersections;
} forEach [
    // Shoot rays towards player's view angle and see which spot is closest
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,0,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [-0.25,0,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0.25,0,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0,-0.25,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [-0.25,-0.25,1])) vectorMultiply 3),
    _startingPosASL vectorAdd (((positionCameraToWorld [0,0,0]) vectorFromTo (positionCameraToWorld [0.25,-0.25,1])) vectorMultiply 3),
    AGLtoASL (_sink modelToWorld [0,0,0]), // Try old method of just using model center
    AGLtoASL (_sink modelToWorld [0,0,-0.5])
];

//Checks (too close to center or can't attach)
if (_bestPosASL isEqualTo []) exitWith {
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visibility sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_bestPosASL = _bestPosASL vectorAdd ((_bestPosASL vectorFromTo _startingPosASL) vectorMultiply 0.05);

private _attachPosModel = _sink worldToModel (ASLtoAGL _bestPosASL);

[
    TIME_PROGRESSBAR(REFUEL_PROGRESS_DURATION),
    [_unit, _nozzle, _sink, _attachPosModel],
    {
        params ["_args"];
        _args params [["_unit", objNull, [objNull]], ["_nozzle", objNull, [objNull]], ["_sink", objNull, [objNull]], ["_endPosTestOffset", [0,0,0], [[]], 3]];
        _unit setVariable [QGVAR(nozzle), nil, true];
        _unit setVariable [QGVAR(isRefueling), false];

        detach _nozzle;
        _nozzle attachTo [_sink, _endPosTestOffset];
        _endPosTestOffset params ["_x", "_y"];
        private _bb = boundingBoxReal _sink;
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
        if (_nozzle isKindOf "Land_CanisterFuel_F") then { _nozzle setVariable [QEGVAR(cargo,canLoad), false, true]; };
        _nozzle setVariable [QGVAR(sink), _sink, true];
        _nozzle setVariable [QGVAR(isConnected), true, true];
        _sink setVariable [QGVAR(nozzle), _nozzle, true];

        _source = _nozzle getVariable QGVAR(source);
        private _fuel = [_source] call FUNC(getFuel);
        if (_fuel == REFUEL_INFINITE_FUEL) then {
            _source setVariable [QGVAR(fuelCounter), 0, true];
        } else {
            _source setVariable [QGVAR(fuelCounter), _fuel, true];
        };

        [_unit, _sink, _nozzle, _endPosTestOffset] call FUNC(refuel);

        if ([_unit, _nozzle] call FUNC(canTurnOn)) then {
            _unit setVariable [QGVAR(tempFuel), nil];
            [_unit, _nozzle] call FUNC(turnOn);
        } else {
            [localize LSTRING(CouldNotTurnOn)] call EFUNC(common,displayText);
        };
    },
    "",
    localize LSTRING(ConnectAction),
    {true},
    [INTERACT_EXCEPTIONS]
] call EFUNC(common,progressBar);
