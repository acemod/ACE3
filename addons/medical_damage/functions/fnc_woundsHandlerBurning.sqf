#include "..\script_component.hpp"
/*
 * Author: Pterolatypus
 * Custom wound handler for burns. Stores up small damage events until there's enough to create a wound.
 *
 * Arguments:
 * 0: Unit That Was Hit <OBJECT>
 * 1: Damage done to each body part <ARRAY>
 * 2: Type of the damage done <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, [[0.5, "Body", 0.5]], "burning"] call ace_medical_damage_fnc_woundsHandlerBurning
 *
 * Public: No
 */
params ["_unit", "_allDamages", "_typeOfDamage"];
TRACE_3("woundsHandlerBurning",_unit,_allDamages,_typeOfDamage);

#define FIRE_DAMAGE_INTERVAL 1

{
    _x params ["_damage", "_bodyPart"];

    if (_bodyPart != "#structural") then {
        continue
    };

    private _storedDamage = _unit getVariable [QGVAR(storedBurnDamage), 0];
    private _newDamage = _storedDamage + _damage;

    // schedule a task to convert stored damage to wounds after a delay
    // the task resets stored damage to zero, so if it isn't currently zero that means there is a task already waiting
    if (_storedDamage == 0 && _newDamage > 0) then {
        [{
            params ["_unit"];

            _bodyPart = selectRandom ["body", "leftleg", "rightleg"];
            private _storedDamage = _unit getVariable [QGVAR(storedBurnDamage), 0];
            [QEGVAR(medical,woundReceived), [_unit, [[_storedDamage, _bodyPart, _storedDamage]], _unit, "burn"]] call CBA_fnc_localEvent;
            _unit setVariable [QGVAR(storedBurnDamage), 0, true];
        },
        [_unit], FIRE_DAMAGE_INTERVAL] call CBA_fnc_waitAndExecute;
    };

    _unit setVariable [QGVAR(storedBurnDamage), _newDamage];
} forEach _allDamages;

[] //return, no further damage handling for this event
