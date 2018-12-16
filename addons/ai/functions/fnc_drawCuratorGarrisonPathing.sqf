#include "script_component.hpp"
/*
 * Author: alganthe
 * Add draw3D eh to the curator interface.
 *
 * Arguments:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
*/

addMissionEventHandler ["Draw3D", {
    if (findDisplay 312 isEqualTo displayNull) exitWith {
        removeMissionEventHandler ["Draw3D", _thisEventHandler];
    };

    private _unitMoveList = missionNameSpace getVariable [QGVAR(garrison_unitMoveList), []];
    {
        _x params  ["_unit", "_pos"];

        switch (true) do {
            case (surfaceIsWater (getPos _unit) && {surfaceIsWater _pos}) : {
                for "_i" from 0 to 3 do {
                    drawLine3D [_unit modelToWorldVisualWorld [0,0,1], (AGLtoASL _pos), [1,0,0,1]];
                };
                drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], (AGLtoASL _pos), 0.75, 0.75, 0.75];
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
                drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], (AGLtoASL _pos), 0.75, 0.75, 0.75];
            };

            case (surfaceIsWater (getPos _unit) && {!surfaceIsWater _pos}) : {
                for "_i" from 0 to 3 do {
                    drawLine3D [_unit modelToWorldVisualWorld  [0,0,1], _pos, [1,0,0,1]];
                };
                drawIcon3D ["\a3\ui_f\data\map\groupicons\waypoint.paa", [1,0,0,1], _pos, 0.75, 0.75, 0.75];
            };
        };
    } forEach _unitMoveList;
}];
