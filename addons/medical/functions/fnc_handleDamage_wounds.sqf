
#include "script_component.hpp"

private ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage", "_bodyPartn", "_woundType"];
_unit = _this select 0;
_selectionName = _this select 1;
_amountOfDamage = _this select 2;
_sourceOfDamage = _this select 3;
_typeOfDamage = _this select 4;
_bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

_woundType = 1;
if (_amountOfDamage > 0.05) then {

    // TODO specify openWounds based off typeOfInjury details better.
    switch (_typeOfDamage) do {
        case "Bullet": {
            _woundType = round(random(2));
        };
        case "Grenade": {
            _woundType = round(random(2));
            if (_woundType < 1) then {
                _woundType = 1;
            };
        };
        case "Explosive": {
            _woundType = round(random(2));
            if (_woundType < 1) then {
                _woundType = 1;
            };
        };
        case "Shell": {
            _woundType = round(random(2));
            if (_woundType < 1) then {
                _woundType = 1;
            };
        };
        case "Unknown": {
            _woundType = round(random(1));
        };
        case "VehicleCrash": {
            _woundType = round(random(0));
        };
        default {
            _woundType = round(random(1));
        };
    };

    private ["_wounds", "_woundID", "_amountOf"];
    _wounds = _unit getvariable[QGVAR(openWounds), []];
    _woundID = 1;
    _amountOf = count _wounds;
    if (_amountOf > 0) then {
        _woundID = (_wounds select (_amountOf - 1) select 0) + 1;
    };
    _wounds pushback [_woundID, _woundType, _bodyPartn, 1 /* percentage treated */];
    _unit setvariable [GVAR(openWounds), _wounds, true];
};