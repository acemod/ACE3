#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(woundReceived), {
    params ["_unit", "_woundedHitPoint", "_receivedDamage", "", "_ammo"];

    private _selectionName = EGVAR(medical,SELECTIONS) param [EGVAR(medical,HITPOINTS) find _woundedHitPoint]; // @todo
    private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
    [_unit, _selectionName, _receivedDamage, _ammo, _typeOfDamage] call FUNC(woundsHandler); // TODO also support the sqf variant
}] call CBA_fnc_addEventHandler;

ADDON = true;
