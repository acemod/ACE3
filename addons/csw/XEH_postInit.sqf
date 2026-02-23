#include "script_component.hpp"

GVAR(vehicleMagCache) = createHashMap;

["CBA_settingsInitialized", {
    TRACE_3("settingsInit",GVAR(defaultAssemblyMode),GVAR(handleExtraMagazines),GVAR(ammoHandling));
    ["StaticWeapon", "Init", {
        // needs a small delay for network syncing, or we end up with duplicate mags with ammo handling
        [LINKFUNC(initVehicle), _this, 1] call CBA_fnc_waitAndExecute;
    }, true, [], true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;

// Also triggered at mission start
["CBA_SettingChanged", {
    GVAR(quickmountEnabled) = (
        missionNamespace getVariable [QEGVAR(quickmount,enabled), false] &&
        {(missionNamespace getVariable [QEGVAR(quickmount,enableMenu), -1]) in [1,3]}
    );

    // Do not allow no ammo handling when advanced assembly is enabled
    // Reason: When using advanced assembly, the amount of ammo is not stored anywhere, so when you reassemble a static, it will spawn full ammo
    if (GVAR(defaultAssemblyMode) && GVAR(ammoHandling) == 0) then {
        if (isServer) then {
            [QGVAR(ammoHandling), 2, 2, "server"] call CBA_settings_fnc_set;
        };

        // Notify everyone about change
        [QEGVAR(common,displayTextStructured), [composeText [
            lineBreak,
            parseText format [
                "<t align='center'>%1</t>", format ["%1 requires %2 to be set higher than 0.", QGVAR(defaultAssemblyMode), QGVAR(ammoHandling)]
            ],
            lineBreak,
            parseText format ["<t align='center'>%1</t>", "No mission restart is required."]
        ], 4]] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addEventHandler;

// Event handlers:
[QGVAR(addTurretMag), LINKFUNC(reload_handleAddTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(removeTurretMag), LINKFUNC(reload_handleRemoveTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(returnAmmo), LINKFUNC(reload_handleReturnAmmo)] call CBA_fnc_addEventHandler;
[QGVAR(autofire_fire), LINKFUNC(autofire_fire)] call CBA_fnc_addEventHandler;


#ifdef DEBUG_MODE_FULL
call compile preprocessFileLineNumbers QPATHTOF(dev\checkStaticWeapons.sqf);
#endif
