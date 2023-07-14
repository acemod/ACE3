#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_3("settingsInit",GVAR(defaultAssemblyMode),GVAR(handleExtraMagazines),GVAR(ammoHandling));
    ["StaticWeapon", "init", LINKFUNC(staticWeaponInit), true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;


// Event handlers:
[QGVAR(disableVanillaAssembly), {
    params ["_staticWeapon"];
    TRACE_1("disableVanillaAssembly eh",_staticWeapon);
    _staticWeapon enableWeaponDisassembly false;
}] call CBA_fnc_addEventHandler;

[QGVAR(addTurretMag), LINKFUNC(reload_handleAddTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(removeTurretMag), LINKFUNC(reload_handleRemoveTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(returnAmmo), LINKFUNC(reload_handleReturnAmmo)] call CBA_fnc_addEventHandler;
[QGVAR(ai_reload), LINKFUNC(ai_reload)] call CBA_fnc_addEventHandler;

[QEGVAR(artilleryTables,doArtilleryFireComplete), {
    params ["_vehicle"];
    if !(local _vehicle) exitWith {};

    _vehicle setVariable [QGVAR(forcedMag), nil, true];
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
call compile preprocessFileLineNumbers QPATHTOF(dev\checkStaticWeapons.sqf);
#endif
