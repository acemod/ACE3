#include "..\script_component.hpp"
/*
 * Author: alganthe
 * Draws AI garrison pathing while the Zeus display is open.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_ai_fnc_drawCuratorGarrisonPathing
 *
 * Public: No
 */

if (isNull findDisplay 312) exitWith {
    //IGNORE_PRIVATE_WARNING ["_thisEventHandler"];
    removeMissionEventHandler ["Draw3D", _thisEventHandler];
};

private _unitMoveList = missionNamespace getVariable [QGVAR(garrison_unitMoveList), []];

{
    _x params  ["_unit", "_pos"];

    switch (true) do {
        case (surfaceIsWater (getPos _unit) && {surfaceIsWater _pos}) : {
            for "_i" from 0 to 3 do {
                drawLine3D [_unit modelToWorldVisualWorld [0,0,1], (AGLToASL _pos), [1,0,0,1]];
            };
            drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], (AGLToASL _pos), 0.75, 0.75, 0.75];
        };

        case (!surfaceIsWater (getPos _unit) && {!surfaceIsWater _pos}) : {
            for "_i" from 0 to 3 do {
                drawLine3D [_unit modelToWorldVisual [0,0,1], _pos, [1,0,0,1]];
            };
            drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], _pos, 0.75, 0.75, 0.75];
        };

        case (!surfaceIsWater (getPos _unit) && {surfaceIsWater _pos}) : {
            for "_i" from 0 to 3 do {
                drawLine3D [_unit modelToWorldVisual [0,0,1], (AGLToASL _pos), [1,0,0,1]];
            };
            drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], (AGLToASL _pos), 0.75, 0.75, 0.75];
        };

        case (surfaceIsWater (getPos _unit) && {!surfaceIsWater _pos}) : {
            for "_i" from 0 to 3 do {
                drawLine3D [_unit modelToWorldVisualWorld  [0,0,1], _pos, [1,0,0,1]];
            };
            drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], _pos, 0.75, 0.75, 0.75];
        };
    };
} forEach _unitMoveList;
