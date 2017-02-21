/*
 * Author: commy2
 * Returns the wheel hitpoints and their selections.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: Wheel hitpoints <ARRAY>
 * 1: Wheel hitpoint selections in model coordinates <ARRAY>
 *
 * Example:
 * [car1] call ace_repair_fnc_getWheelHitPointsWithSelections
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params",_vehicle);

private ["_bestDist", "_bestIndex", "_wheelBone", "_wheelBoneNameResized", "_wheelCenter", "_wheelCenterPos", "_wheelHitPoint", "_wheelHitPointSelection", "_wheelHitPointSelections", "_wheelHitPoints", "_wheelName", "_xDist", "_xPos"];

// get the vehicles wheel config
private _wheels = configFile >> "CfgVehicles" >> typeOf _vehicle >> "Wheels";

// exit with nothing if the vehicle has no wheels class
if !(isClass _wheels) exitWith {TRACE_1("No Wheels",_wheels); [[],[]]};

// get all hitpoints and selections
(getAllHitPointsDamage _vehicle) params ["_hitPoints", "_hitPointSelections"];

// get all wheels and read selections from config
_wheels = "true" configClasses _wheels;

_wheelHitPoints = [];
_wheelHitPointSelections = [];

{
    _wheelName = configName _x;
    _wheelCenter = getText (_x >> "center");
    _wheelBone = getText (_x >> "boneName");
    _wheelBoneNameResized = _wheelBone select [0, 9]; //ount "wheel_X_Y"; // this is a requirement for physx. Should work for all addon vehicles.

    TRACE_4("",_wheelName,_wheelCenter,_wheelBone,_wheelBoneNameResized);

    _wheelHitPoint = "";
    _wheelHitPointSelection = "";

    //Commy's orginal method
    {
        if ((_wheelBoneNameResized != "") && {_x find _wheelBoneNameResized == 0}) exitWith {  // same as above. Requirement for physx.
            _wheelHitPoint = _hitPoints select _forEachIndex;
            _wheelHitPointSelection = _hitPointSelections select _forEachIndex;
            TRACE_2("wheel found [Orginal]", _wheelName, _wheelHitPoint);
        };
    } forEach _hitPointSelections;


    if (_vehicle isKindOf "Car") then {
        //Backup method, search for the closest hitpoint to the wheel's center selection pos.
        //Ref #2742 - RHS's HMMWV
        if (_wheelHitPoint == "") then {
            _wheelCenterPos = _vehicle selectionPosition _wheelCenter;
            if (_wheelCenterPos isEqualTo [0,0,0]) exitWith {TRACE_1("no center?",_wheelCenter);};


            _bestDist = 99;
            _bestIndex = -1;
            {
                if (_x != "") then {
                     //Filter out things that definitly aren't wheeels (#3759)
                    if ((toLower (_hitPoints select _forEachIndex)) in ["hitengine", "hitfuel", "hitbody"]) exitWith {TRACE_1("filter",_x)};
                    _xPos = _vehicle selectionPosition _x;
                    if (_xPos isEqualTo [0,0,0]) exitWith {};
                    _xDist = _wheelCenterPos distance _xPos;
                    if (_xDist < _bestDist) then {
                        _bestIndex = _forEachIndex;
                        _bestDist = _xDist;
                    };
                };
            } forEach _hitPointSelections;

            TRACE_2("closestPoint",_bestDist,_bestIndex);
            if (_bestIndex != -1) then {
                _wheelHitPoint = _hitPoints select _bestIndex;
                _wheelHitPointSelection = _hitPointSelections select _bestIndex;
                TRACE_2("wheel found [Backup]", _wheelName, _wheelHitPoint);
            };
        };
    };

    if ((_wheelHitPoint != "") && {_wheelHitPointSelection != ""}) then {
        _wheelHitPoints pushBack _wheelHitPoint;
        _wheelHitPointSelections pushBack _wheelHitPointSelection;
    };
} forEach _wheels;

[_wheelHitPoints, _wheelHitPointSelections]
