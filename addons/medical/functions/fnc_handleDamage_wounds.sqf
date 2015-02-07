
#include "script_component.hpp"
#define ADD_INJURY(BODYPART,TYPE,AMOUNT) _woundID = 1; \
    _amountOf = count _openWounds; \
    if (_amountOf > 0) then { _woundID = (_openWounds select (_amountOf - 1) select 0) + 1; }; \
    for "_i" from  1 to AMOUNT /* step +1 */ do {   \
        _openWounds pushback [_woundID, _woundType, _bodyPartn, 1 /* percentage treated */]; \
        _woundID = _woundID + 1; \
    };

private ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage", "_bodyPartn", "_woundType"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_sourceOfDamage = _this select 3;
_typeOfDamage = _this select 4;
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

_woundType = 1;
if (_amountOfDamage > 0.05) then {
     private ["_wounds", "_woundID", "_amountOf"];
    _openWounds = _unit getvariable[QGVAR(openWounds), []];
    // TODO specify openWounds based off typeOfInjury details better.
     switch (toLower _typeOfInjury) do {
        case "bullet": {
            ADD_INJURY(_bodyPartn, round(random(2)), 1);
        };
        case "grenade": {
            ADD_INJURY(_bodyPartn, round(random(2)), 1);
            for "_i" from 0 to round(random(3)) /* step +1 */ do {
                ADD_INJURY(round(random(6)), round(random(2)), 1);
            };
        };
        case "explosive": {
            ADD_INJURY(_bodyPartn, round(random(2)), 1);
            for "_i" from 0 to round(random(4)) /* step +1 */ do {
                ADD_INJURY(round(random(6)), round(random(2)), 1);
            };
        };
        case "shell": {
            ADD_INJURY(_bodyPartn, round(random(2)), 1);
            for "_i" from 0 to round(random(5)) /* step +1 */ do {
                ADD_INJURY(round(random(6)), round(random(2)), 1);
            };
        };
        case "backblast": {
            if (random(1)>=0.5) then{
                ADD_INJURY(_bodyPartn, round(random(2)), 1);
            };
        };
        case "unknown": {
            ADD_INJURY(_bodyPartn, round(random(1)), 1);
        };
        case "vehiclecrash": {
            if (random(1)>=0.5) then{
                ADD_INJURY(_bodyPartn, round(random(1)), 1);
            };
        };
        default {
            ADD_INJURY(_bodyPartn, round(random(1)), 1);
        };
    };
    _unit setvariable [GVAR(openWounds), _openWounds, true];
};
