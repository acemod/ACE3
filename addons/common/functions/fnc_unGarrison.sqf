/*
 * Author: alganthe
 * Used to un-garrison units garrisoned with ace_common_fnc_garrison
 *
 * Arguments:
 * 0: Array of units to un-garrison <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Public: Yes
 *
*/
#include "script_component.hpp"

params [["_unitsArray", [], [[]]]];

{
    if !(isPlayer _x) then {
        if (local _x) then {
            _x enableAI "AUTOCOMBAT";
            _x enableAI "PATH";
        } else {
            [QGVAR(enableAI), [_placedUnits, "AUTOCOMBAT"], _placedUnits] call CBA_fnc_targetEvent;
            [QGVAR(enableAI), [_placedUnits, "PATH"], _placedUnits] call CBA_fnc_targetEvent;
        };

        private _leader = leader _x;
        if (_leader != _x) then {
            doStop _x;
            if (local _leader) then {
                _x doFollow _leader;
            } else {
                [QGVAR(doFollow), [_x, _leader], _leader] call CBA_fnc_targetEvent;
            };

        } else {
            if (local _x) then {
                _x doMove ((nearestBuilding (getPos _x)) buildingExit 0);
            } else {
                [QGVAR(doMove), [_x, ((nearestBuilding (getPos _x)) buildingExit 0)], _x] call CBA_fnc_targetEvent;
            };
        };
    };
} foreach _unitsArray;
