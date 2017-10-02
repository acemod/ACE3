#include "script_component.hpp"

[QGVAR(AISection), {
    params [["_units", [], [[]]], ["_sections", [], [[]]], ["_bool", true, [true]]];
    {
        private _section = _x;
        {
            if (_bool) then {
                _x enableAI _section;
            } else {
                _x disableAI _section;
            };
            LOG(format [ARR_4("XEH_postInit: %1 disableAI %2 | ID %3", _x, _section, clientOwner)]);
        } foreach (_units select {local _x});
    } foreach _sections
}] call CBA_fnc_addEventHandler;

[QGVAR(unGarrison), FUNC(unGarrison)] call CBA_fnc_addEventHandler;
[QGVAR(doMove), {
    params ["_unitsArray"];
    {  
        _x params ["_unit", "_pos"];
        //_unit doFollow leader _unit;
        _unit setDestination [_pos, "LEADER PLANNED", true];
        _unit doMove _pos;
        LOG(format [ARR_4("XEH_postInit: %1 doMove %2 | ID %3", _unit, _pos, clientOwner)]);
    } foreach _unitsArray
}] call CBA_fnc_addEventHandler;
[QGVAR(setBehaviour), {
    params ["_groupsArray", "_behaviour"];
    {  
        _x params ["_group"];
        _group setBehaviour _behaviour;
        LOG(format [ARR_4("XEH_postInit: %1 setBehaviour %2 | ID %3", _group, _behaviour, clientOwner)]);
    } foreach _groupsArray
}] call CBA_fnc_addEventHandler;
[QGVAR(enableAttack), {
    params ["_unitsArray", "_mode"];
    {
        _x params ["_unit"];
        _unit enableAttack _mode;
        LOG(format [ARR_4("XEH_postInit: %1 enableAttack %2 | ID %3", _unit, _mode, clientOwner)]);
    } foreach _unitsArray
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
    addMissionEventHandler ["Draw3D", {
        private _unitMoveList = missionNameSpace getVariable [QGVAR(garrison_unitMoveList), []];

        {
            _x params  ["_unit", "_pos"];

            switch true do {
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
        } foreach _unitMoveList;
    }];
#endif