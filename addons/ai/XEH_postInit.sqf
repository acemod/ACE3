#include "script_component.hpp"

[QGVAR(AISection), {
    params [["_units", [], [[]]], ["_sections", [], [[]]], ["_bool", true, [true]]];
    {
        private _section = _x;
        {
            if (_bool) then {
                _x enableAI _section;
                LOG_3("%1 enableAI %2 | ID: %3",_x,_section,clientOwner);
            } else {
                _x disableAI _section;
                LOG_3("%1 disableAI %2 | ID: %3",_x,_section,clientOwner);
            };
        } forEach (_units select {local _x});
    } forEach _sections;
}] call CBA_fnc_addEventHandler;

[QGVAR(unGarrison), FUNC(unGarrison)] call CBA_fnc_addEventHandler;

[QGVAR(doMove), {
    params ["_unitsArray"];
    {
        _x params ["_unit", "_pos"];
        _unit setDestination [_pos, "LEADER PLANNED", true];
        _unit doMove _pos;
        LOG_3("%1 doMove %2 | ID: %3",_unit,_pos,clientOwner);
    } forEach _unitsArray;
}] call CBA_fnc_addEventHandler;

[QGVAR(setBehaviour), {
    params ["_groupsArray", "_behaviour"];
    {
        _x setBehaviour _behaviour;
        LOG_3("%1 setBehaviour %2 | ID: %3",_x,_behaviour,clientOwner);
    } forEach _groupsArray;
}] call CBA_fnc_addEventHandler;

[QGVAR(enableAttack), {
    params ["_unitsArray", "_mode"];
    {
        _x enableAttack _mode;
        LOG_3("%1 enableAttack %2 | ID: %3",_x,_mode,clientOwner);
    } forEach _unitsArray;
}] call CBA_fnc_addEventHandler;

[QGVAR(setUnitPos), {
    params ["_unit", "_mode"];
    _unit setUnitPos _mode;
}] call CBA_fnc_addEventHandler;

[QGVAR(setSpeedMode), {
    params ["_unit", "_mode"];
    _unit setSpeedMode _mode;
}] call CBA_fnc_addEventHandler;

[QGVAR(setCombatMode), {
    params ["_unit", "_mode"];
    _unit setCombatMode _mode;
}] call CBA_fnc_addEventHandler;

[QGVAR(allowFleeing), {
    params ["_unit", "_cowardice"];
    _unit allowFleeing _cowardice;
}] call CBA_fnc_addEventHandler;

[QGVAR(enableGunLights), {
    params ["_unit", "_mode"];
    _unit enableGunLights _mode;
}] call CBA_fnc_addEventHandler;
