#include "script_component.hpp"
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

params [["_units", [], [[]]]];

_units = _units select {local _x};

{
    private _unit = _x;
    if (!isPlayer _unit && {local _unit}) then {
        _unit enableAI "PATH";
        _unit enableAI "FSM";

        private _leader = leader _unit;

        TRACE_3("fnc_ungarrison: unit and leader",_unit , _leader, (_leader == _unit));

        _unit setVariable [QGVAR(garrisonned), false, true];

        private _unitMoveList = missionNameSpace getVariable [QGVAR(garrison_unitMoveList), []];
       _unitMoveList deleteAt (_unitMoveList findIf {_x select 0 == _unit});

        if (_leader != _unit) then {
            doStop _unit;
            _unit doFollow _leader;

        } else {
            _unit doMove ((nearestBuilding (getPos _unit)) buildingExit 0);
        };

        if ((units _unit) findif {(_x getVariable [QGVAR(garrisonned), false]) && !isPlayer _x} == -1) then {
            LOG("fnc_ungarrison: enableAttack true");
            (group _unit) enableAttack true;
        };
    };
} foreach _units;
