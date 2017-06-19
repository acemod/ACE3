/*
 * Author: Glowbal
 * Handling of the airway injuries upon the handleDamage eventhandler.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Name Of Hit Selection <STRING>
 * 2: Amount Of Damage <NUMBER>
 * 3: Shooter or source of the damage <OBJECT>
 * 4: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "leg", 2, kevin, "shot"] call ACE_medical_fnc_airway
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_selectionName", "_amountOfDamage", "_sourceOfDamage", "_typeOfDamage"];
private _bodyPartn = [_selectionName] call FUNC(selectionNameToNumber);

if (_bodyPartn > 1) exitWith {};

if (_amountOfDamage > 0.5) then {
    if (random(1) >= 0.8) then {
        if !(_unit getVariable[QGVAR(airwayCollapsed), false]) then {
            _unit setVariable [QGVAR(airwayCollapsed), true, true];
        };
    };
};
