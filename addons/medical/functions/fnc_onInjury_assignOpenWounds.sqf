/**
 * fn_assignOpenWounds.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"
#define ADD_INJURY(BODYPART,TYPE,AMOUNT) _selection = _openWounds select BODYPART; \
    _newAmount = (_selection select TYPE) + AMOUNT; \
    _selection set [ TYPE, _newAmount]; \
    _openWounds set [BODYPART , _selection];


private ["_unit", "_amountOfDamage", "_typeOfInjury", "_bodyPartn", "_openWounds","_newAmount","_selection"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_typeOfInjury = _this select 2;
_bodyPartn = _this select 3;

if (_amountOfDamage > 0.05) exitwith {
    _openWounds = [_unit,QGVAR(openWounds)] call EFUNC(common,getDefinedVariable);
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
    [_unit, QGVAR(openWounds),_openWounds] call EFUNC(common,setDefinedVariable);

    true;
};

false;