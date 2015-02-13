/*
 * Author: Glowbal
 * Handling of the open wounds & injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter or source of the damage <OBJECT>
 * 4: Type of the damage done <STRING>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

#define RANDOM_BODY_PART round(random(6))
#define RANDOM_OPEN_WOUND (1 + round(random(2)))
#define ADD_INJURY(BODYPART,TYPE,AMOUNT) _woundID = 1; \
    _amountOf = count _openWounds; \
    if (_amountOf > 0) then { _woundID = (_openWounds select (_amountOf - 1) select 0) + 1; }; \
    for "_i" from  1 to AMOUNT /* step +1 */ do {   \
        _openWounds pushback [_woundID, _woundType, BODYPART, 1 /* percentage treated */, FIND_BLEEDING_RATE(TYPE)]; \
        _woundID = _woundID + 1; \
    };

private ["_unit", "_selectionName", "_damage", "_typeOfProjectile", "_typeOfDamage", "_bodyPartn", "_woundType"];
_unit = _this select 0;
_selectionName = _this select 1;
_damage = _this select 2;
_typeOfProjectile = _this select 3;
_typeOfDamage = _this select 4;
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

_woundType = 1;
if (_damage > 0.05) then {
     private ["_wounds", "_woundID", "_amountOf"];
    _openWounds = _unit getvariable[QGVAR(openWounds), []];

    // TODO specify openWounds based off typeOfInjury details better.
    switch (toLower _typeOfInjury) do {
        case "bullet": {
            if (_damage < 0.1) exitwith {
                if (random(1) => 0.5) then {
                    if (random(1) => 0.5) then {
                        ADD_INJURY(_bodyPartn, SCRATCH, 1);
                    } else {
                        ADD_INJURY(_bodyPartn, BRUISES, 1); // didn't do much damage, so the skin got only bruised.
                    };
                } else {
                    ADD_INJURY(_bodyPartn, GRAZE_WOUND, 1);
                };
            };
            // TODO base upon caliber of the round and damage done, using _typeOfProjectile and CfgAmmo class.
            switch (true) do {
                case (_damage >= 1.2): {ADD_INJURY(_bodyPartn, LARGE_OPEN_WOUND, 1);};
                case (_damage >= 0.7): {ADD_INJURY(_bodyPartn, MEDIUM_OPEN_WOUND, 1);};
                default {ADD_INJURY(_bodyPartn, MINOR_OPEN_WOUND, 1);};
            };
        };
        case "grenade": {
            if (_damage < 0.1) exitwith {
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, BRUISES, 1);
                } else {
                    ADD_INJURY(RANDOM_BODY_PART, GRAZE_WOUND, 1);
                };
            };
            for "_i" from 0 to round(random(3)) /* step +1 */ do {
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, RANDOM_OPEN_WOUND, 1);
                } else {
                    ADD_INJURY(RANDOM_BODY_PART, SCHRAPNEL_WOUND, 1);
                };
            };
        };
        case "explosive": {
            if (_damage < 0.1) exitwith {
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, BRUISES, 1);
                } else {
                    ADD_INJURY(RANDOM_BODY_PART, GRAZE_WOUND, 1);
                };
            };

            ADD_INJURY(RANDOM_BODY_PART, RANDOM_OPEN_WOUND, 1);
            for "_i" from 0 to round(random(4)) /* step +1 */ do {
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, SCHRAPNEL_WOUND, 1);
                };
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, RANDOM_OPEN_WOUND, 1);
                }:
            };
        };
        case "shell": {
            if (_damage < 0.1) exitwith {
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, BRUISES, 1);
                } else {
                    ADD_INJURY(RANDOM_BODY_PART, GRAZE_WOUND, 1);
                };
            };

            ADD_INJURY(RANDOM_BODY_PART, RANDOM_OPEN_WOUND, 1);
            for "_i" from 0 to round(random(5)) /* step +1 */ do {
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, SCHRAPNEL_WOUND, 1);
                };
                if (random(1) => 0.5) then {
                    ADD_INJURY(RANDOM_BODY_PART, RANDOM_OPEN_WOUND, 1);
                }:
            };

        };
        case "backblast": {
            if (random(1)>=0.5) then {
                ADD_INJURY(RANDOM_BODY_PART, BRUISES, 1);
            };
        };
        case "unknown": {
            ADD_INJURY(_bodyPartn, RANDOM_OPEN_WOUND, 1);
        };
        case "vehiclecrash": {
            if (random(1)>=0.5) then {
                ADD_INJURY(_bodyPartn, RANDOM_OPEN_WOUND, 1);
            };
            for "_i" from 0 to round(random(5)) /* step +1 */ do {
                if (random(_damage) => 0.25) then {
                    ADD_INJURY(RANDOM_BODY_PART, BRUISES, 1);
                };
            };
        };
        default {
            ADD_INJURY(_bodyPartn, RANDOM_OPEN_WOUND, 1);
            // TODO allow third party to handle this instead ?
        };
    };
    _unit setvariable [GVAR(openWounds), _openWounds, true];
};
