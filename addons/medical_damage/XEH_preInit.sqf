#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

call FUNC(parseConfigForInjuries);

// decide which woundsHandler to use by whether the extension is present or not
if ("ace_medical" callExtension "version" != "") then {
    DFUNC(woundsHandlerActive) = FUNC(woundsHandlerSQF); //FUNC(woundsHandler);
} else {
    DFUNC(woundsHandlerActive) = FUNC(woundsHandlerSQF);
};

[QEGVAR(medical_engine,woundReceived), {
    params ["_unit", "_woundedHitPoint", "_receivedDamage", "", "_ammo"];

    private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
    [_unit, _woundedHitPoint, _receivedDamage, _ammo, _typeOfDamage] call FUNC(woundsHandlerActive); // TODO also support the sqf variant

    [_unit, EGVAR(medical,STATE_MACHINE)] call EFUNC(medical,addStateHandler);
}] call CBA_fnc_addEventHandler;

ADDON = true;
