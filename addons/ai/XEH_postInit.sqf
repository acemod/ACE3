#include "script_component.hpp"

[QGVAR(disableAI), {
    params [["_units", [], [[]]], ["_sections", [], [[]]]];
    {
        private _section = _x;
        {
            _x disableAI _section;
            LOG(format [ARR_4("XEH_postInit: %1 disableAI %2 | ID %3", _x, _section, clientOwner)]);
        } foreach (_units select {local _x});
    } foreach _sections
}] call CBA_fnc_addEventHandler;

[QGVAR(unGarrison), FUNC(unGarrison)] call CBA_fnc_addEventHandler;
[QGVAR(doMove), {
    params ["_unitsArray"];
    {  
        _x params ["_unit", "_pos"];
        _unit doFollow leader _unit;
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