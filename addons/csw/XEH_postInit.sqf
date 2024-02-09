#include "script_component.hpp"

GVAR(vehicleMagCache) = createHashMap;

["CBA_settingsInitialized", {
    TRACE_3("settingsInit",GVAR(defaultAssemblyMode),GVAR(handleExtraMagazines),GVAR(ammoHandling));
    ["StaticWeapon", "Init", {
        // needs a small delay for network syncing, or we end up with duplicate mags with ammo handling
        [LINKFUNC(initVehicle), _this, 1] call CBA_fnc_waitAndExecute;
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    GVAR(quickmountEnabled) = (
        missionNamespace getVariable [QEGVAR(quickmount,enabled), false] &&
        {(missionNamespace getVariable [QEGVAR(quickmount,enableMenu), -1]) in [1,3]}
    );
}] call CBA_fnc_addEventHandler;

["CBA_SettingChanged", {
    GVAR(quickmountEnabled) = (
        missionNamespace getVariable [QEGVAR(quickmount,enabled), false] &&
        {(missionNamespace getVariable [QEGVAR(quickmount,enableMenu), -1]) in [1,3]}
    );
}] call CBA_fnc_addEventHandler;

// Event handlers:
[QGVAR(addTurretMag), LINKFUNC(reload_handleAddTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(removeTurretMag), LINKFUNC(reload_handleRemoveTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(returnAmmo), LINKFUNC(reload_handleReturnAmmo)] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
call compile preprocessFileLineNumbers QPATHTOF(dev\checkStaticWeapons.sqf);
#endif
