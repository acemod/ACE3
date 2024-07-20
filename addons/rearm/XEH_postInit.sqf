#include "script_component.hpp"

GVAR(configTypesAdded) = [];
GVAR(magazineNameCache) = createHashMap;
GVAR(usedMagazineNames) = createHashMap;

[QGVAR(initSupplyVehicle), {
    TRACE_1("initSupplyVehicle EH",_this);   // Warning: this can run before settings are init
    [FUNC(initSupplyVehicle), _this] call EFUNC(common,runAfterSettingsInit);
}] call CBA_fnc_addEventHandler;

["CBA_settingsInitialized", {
    TRACE_3("settingsInit",GVAR(enabled),GVAR(level),GVAR(supply));

    // need these events before enabled check for zeus rearm
    [QGVAR(rearmEntireVehicleSuccessEH), LINKFUNC(rearmEntireVehicleSuccess)] call CBA_fnc_addEventHandler;
    [QGVAR(rearmEntireVehicleSuccessLocalEH), LINKFUNC(rearmEntireVehicleSuccessLocal)] call CBA_fnc_addEventHandler;
    [QGVAR(makeDummyEH), LINKFUNC(makeDummy)] call CBA_fnc_addEventHandler;
    [QGVAR(rearmSuccessEH), LINKFUNC(rearmSuccess)] call CBA_fnc_addEventHandler;
    [QGVAR(rearmSuccessLocalEH), LINKFUNC(rearmSuccessLocal)] call CBA_fnc_addEventHandler;

    if (!GVAR(enabled)) exitWith {};

    ["AllVehicles", "Init", LINKFUNC(initSupplyVehicle), true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
    ["ReammoBox_F", "Init", LINKFUNC(initSupplyVehicle), true, [], true] call CBA_fnc_addClassEventHandler;
    ["House", "Init", LINKFUNC(initSupplyVehicle), true, [], true] call CBA_fnc_addClassEventHandler;

    // placed in editor static objects don't trigger init
    {
        _x call FUNC(initSupplyVehicle);
    } forEach allMissionObjects "Static";

    ["ace_unconscious", LINKFUNC(handleUnconscious)] call CBA_fnc_addEventHandler;

    ["vehicle", {
        params ["_unit"];
        [_unit] call FUNC(dropAmmo);
    }] call CBA_fnc_addPlayerEventHandler;

    if (isServer) then {
        addMissionEventHandler ["HandleDisconnect", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}];
    };

}] call CBA_fnc_addEventHandler;
