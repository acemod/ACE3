#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Returns the wheel hitpoints and their selections.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * 0: Wheel hitpoints <ARRAY>
 * 1: Wheel hitpoint selections <ARRAY>
 *
 * Example:
 * cursorObject call ace_common_fnc_getWheelHitPointsWithSelections
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("params",_vehicle);

// TODO: Fix for GM vehicles
GVAR(wheelSelections) getOrDefaultCall [typeOf _vehicle, {
    // Get the vehicles wheel config
    private _wheels = configOf _vehicle >> "Wheels";

    if (isClass _wheels) then {
        // Get all hitpoints and selections
        (getAllHitPointsDamage _vehicle) params ["_hitPoints", "_hitPointSelections"];

        // Get all wheels and read selections from config
        _wheels = "true" configClasses _wheels;

        private _wheelHitPoints = [];
        private _wheelHitPointSelections = [];

        {
            private _wheelName = configName _x;
            private _wheelCenter = getText (_x >> "center");
            private _wheelBone = getText (_x >> "boneName");
            private _wheelBoneNameResized = _wheelBone select [0, 9]; // Count "wheel_X_Y"; // this is a requirement for physx. Should work for all addon vehicles.

            TRACE_4("",_wheelName,_wheelCenter,_wheelBone,_wheelBoneNameResized);

            private _wheelHitPoint = "";
            private _wheelHitPointSelection = "";

            // Commy's orginal method
            {
                if ((_wheelBoneNameResized != "") && {_x find _wheelBoneNameResized == 0}) exitWith {  // same as above. Requirement for physx.
                    _wheelHitPoint = _hitPoints select _forEachIndex;
                    _wheelHitPointSelection = _hitPointSelections select _forEachIndex;
                    TRACE_2("wheel found [Orginal]",_wheelName,_wheelHitPoint);
                };
            } forEach _hitPointSelections;


            if (_vehicle isKindOf "Car") then {
                // Backup method, search for the closest hitpoint to the wheel's center selection pos.
                // Ref #2742 - RHS's HMMWV
                if (_wheelHitPoint == "") then {
                    private _wheelCenterPos = _vehicle selectionPosition _wheelCenter;
                    if (_wheelCenterPos isEqualTo [0, 0, 0]) exitWith {TRACE_1("no center?",_wheelCenter);};


                    private _bestDist = 99;
                    private _bestIndex = -1;
                    {
                        if (_x != "") then {
                             // Filter out things that definitly aren't wheeels (#3759)
                            if ((toLowerANSI (_hitPoints select _forEachIndex)) in ["hitengine", "hitfuel", "hitbody"]) exitWith {TRACE_1("filter",_x)};
                            private _xPos = _vehicle selectionPosition _x;
                            if (_xPos isEqualTo [0, 0, 0]) exitWith {};
                            private _xDist = _wheelCenterPos distance _xPos;
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
                        TRACE_2("wheel found [Backup]",_wheelName,_wheelHitPoint);
                    };
                };
            };

            if ((_wheelHitPoint != "") && {_wheelHitPointSelection != ""}) then {
                _wheelHitPoints pushBack _wheelHitPoint;
                _wheelHitPointSelections pushBack _wheelHitPointSelection;
            };
        } forEach _wheels;

        [_wheelHitPoints, _wheelHitPointSelections]
    } else {
        // Exit with nothing if the vehicle has no wheels class
        TRACE_1("No Wheels",_wheels);

        [[], []]
    }
}, true] // return
