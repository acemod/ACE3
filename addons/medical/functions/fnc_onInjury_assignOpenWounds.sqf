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

private ["_unit", "_amountOfDamage", "_typeOfInjury", "_bodyPartn"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_typeOfInjury = _this select 2;
_bodyPartn = _this select 3;

if (_amountOfDamage > 0.05) exitwith {
    switch (toLower _typeOfInjury) do {
        case "bullet": {
             [_unit, _bodyPartn, round(random(2)), 1, false] call FUNC(addOpenWounds);
        };
        case "grenade": {
            [_unit, _bodyPartn, round(random(2)), 1] call FUNC(addOpenWounds);
            for "_i" from 0 to round(random(3)) /* step +1 */ do {
                [_unit, round(random(6)), round(random(2)), 1, false] call FUNC(addOpenWounds);
            };
        };
        case "explosive": {
            [_unit, _bodyPartn, round(random(2)), 1] call FUNC(addOpenWounds);
            for "_i" from 0 to round(random(4)) /* step +1 */ do {
                [_unit, round(random(6)), round(random(2)), 1, false] call FUNC(addOpenWounds);
            };
        };
        case "shell": {
            [_unit, _bodyPartn, round(random(2)), 1] call FUNC(addOpenWounds);
            for "_i" from 0 to round(random(5)) /* step +1 */ do {
                [_unit, round(random(6)), round(random(2)), 1, false] call FUNC(addOpenWounds);
            };
        };
        case "backblast": {
            if (random(1)>=0.5) then{
                [_unit, _bodyPartn, round(random(1)), 1, false] call FUNC(addOpenWounds);
            };
        };
        case "unknown": {
            [_unit, _bodyPartn, round(random(1)), 1, false] call FUNC(addOpenWounds);
        };
        case "vehiclecrash": {
            if (random(1)>=0.5) then{
                [_unit, _bodyPartn, round(random(1)), 1, false] call FUNC(addOpenWounds);
            };
        };
        default {
            [_unit, _bodyPartn, round(random(1)), 1, false] call FUNC(addOpenWounds);
        };
    };

    // one more call to broadcast the new injuries
    [_unit, _bodyPartn, 0, 0, true] call FUNC(addOpenWounds);

    true;
};

false;