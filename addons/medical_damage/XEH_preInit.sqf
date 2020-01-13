#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

call FUNC(parseConfigForInjuries);

addMissionEventHandler ["Loaded",{
    INFO("Mission Loaded - Reloading medical configs for extension");
    // Reload configs into extension (handle full game restart)
    call FUNC(parseConfigForInjuries);
}];

// decide which woundsHandler to use by whether the extension is present or not
// if ("ace_medical" callExtension "version" != "") then {

    // DFUNC(woundsHandlerActive) = LINKFUNC(woundsHandler);
// } else {
    INFO("Using woundsHandlerSQF");
    DFUNC(woundsHandlerActive) = LINKFUNC(woundsHandlerSQF);
// };

[QEGVAR(medical,woundReceived), {
    params ["_unit", "_woundedHitPoint", "_receivedDamage", "", "_ammo", "_damageSelectionArray"];

    private _typeOfDamage = _ammo call FUNC(getTypeOfDamage);
    [_unit, _woundedHitPoint, _receivedDamage, _typeOfDamage, _damageSelectionArray] call FUNC(woundsHandlerActive);
}] call CBA_fnc_addEventHandler;

ADDON = true;
