/*
 * Author: Glowbal
 * Handling of the fracture injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Body Part <STRING>
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

params ["_unit", "_bodyPart", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage"];

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

private _fractureType = 1;

if (_amountOfDamage > 0.05) then {
    // TODO specify fractures based off typeOfInjury details better.
    switch (_typeOfDamage) do {
        case "Bullet": {
            _fractureType = round(random(2));
        };
        case "Grenade": {
            _fractureType = round(random(2));
            if (_fractureType < 1) then {
                _fractureType = 1;
            };
        };
        case "Explosive": {
            _fractureType = round(random(2));
            if (_fractureType < 1) then {
                _fractureType = 1;
            };
        };
        case "Shell": {
            _fractureType = round(random(2));
            if (_fractureType < 1) then {
                _fractureType = 1;
            };
        };
        case "Unknown": {
            _fractureType = round(random(1));
        };
        case "VehicleCrash": {
            _fractureType = round(random(0));
        };
        default {
            _fractureType = round(random(1));
        };
    };

    private _fractures = _unit getVariable[QGVAR(fractures), []];
    private _fractureID = 1;
    private _amountOf = count _fractures;

    if (_amountOf > 0) then {
        _fractureID = (_fractures select (_amountOf - 1) select 0) + 1;
    };

    _fractures pushBack [_fractureID, _fractureType, _partIndex, 1 /* percentage treated */];
    _unit setVariable [QGVAR(fractures), _fractures, true];
};
