#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

call FUNC(parseConfigForInjuries);

[QEGVAR(medical_engine,woundReceived), {
    params ["_unit", "_woundedHitPoint", "_receivedDamage", "", "_ammo"];

    private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
    [_unit, _woundedHitPoint, _receivedDamage, _ammo, _typeOfDamage] call FUNC(woundsHandler);

    [_unit, EGVAR(medical,STATE_MACHINE)] call EFUNC(medical,addStateHandler);
}] call CBA_fnc_addEventHandler;

ADDON = true;
