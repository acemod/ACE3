/*
 * Author: alganthe
 * Used to un-garrison units
 *
 * Arguments:
 * 0: Units to un-garrison <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit1, unit2, unit3] call ace_ai_fnc_unGarrison
 *
 * Public: Yes
 *
*/
#include "script_component.hpp"

params [["_units", [], [[]]]];

diag_log format ["unGarrison called: %1", _units];

_units = _units select {local _x};

{
    if !(isPlayer _x || {!local _x}) then {
        _x enableAI "AUTOCOMBAT";
        _x enableAI "PATH";

        private _leader = leader _x;

        if (_leader != _x) then {
            doStop _x;
            _x doFollow _leader;

        } else {
            _x doMove ((nearestBuilding (getPos _x)) buildingExit 0);
        };
    };
} foreach _units;

