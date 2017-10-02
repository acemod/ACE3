/*
 * Author: alganthe
 * Used to un-garrison units.
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

_units = _units select {local _x};

{
    if (!isPlayer _x && {local _x}) then {
        _x enableAI "PATH";
        _x enableAI "FSM";

        private _leader = leader _x;

        TRACE_3("fnc_ungarrison: unit and leader",_x , _leader, (_leader == _x));

        _x setVariable [QGVAR(garrisonned), false, true];

        if (_leader != _x) then {
            doStop _x;
            _x doFollow _leader;

        } else {
            _x doMove ((nearestBuilding (getPos _x)) buildingExit 0);
        };

        private _fnc_countGarrisonnedUnits = {
            params ["_unit", "_bool"];
            if (_bool) then {
                ({(_x getVariable [QGVAR(garrisonned), false]) && {!isPlayer _x}} count units _unit)
            } else {
                ({!(_x getVariable [QGVAR(garrisonned), false]) && {!isPlayer _x}} count units _unit)
            };
            
        };

        if ([_x, true] call _fnc_countGarrisonnedUnits == ({!isPlayer _x} count (units _x)) - 1 || {[_x, false] call _fnc_countGarrisonnedUnits == {!isPlayer _x} count (units _x)}) then {
            LOG("fnc_ungarrison: enableAttack true");
            (group _x) enableAttack true;
        };
    };
} foreach _units;
