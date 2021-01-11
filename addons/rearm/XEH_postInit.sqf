#include "script_component.hpp"

// need these events before enabled check for zeus rearm
[QGVAR(rearmEntireVehicleSuccessEH), LINKFUNC(rearmEntireVehicleSuccess)] call CBA_fnc_addEventHandler;
[QGVAR(rearmEntireVehicleSuccessLocalEH), LINKFUNC(rearmEntireVehicleSuccessLocal)] call CBA_fnc_addEventHandler;

if !GVAR(enabled) exitWith {};

GVAR(hardpointGroupsCache) = [] call CBA_fnc_createNamespace;
GVAR(configTypesAdded) = [];
["ace_settingsInitialized", {
    TRACE_2("settingsInit",GVAR(level),GVAR(supply));
    ["AllVehicles", "Init", {_this call FUNC(initSupplyVehicle)}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
    ["ReammoBox_F", "Init", {_this call FUNC(initSupplyVehicle)}, true, [], true] call CBA_fnc_addClassEventHandler;
    ["House", "Init", {_this call FUNC(initSupplyVehicle)}, true, [], true] call CBA_fnc_addClassEventHandler;
    // placed in editor static objects don't trigger init
    {
        _x call FUNC(initSupplyVehicle);
    } forEach allMissionObjects "Static";
}] call CBA_fnc_addEventHandler;

["ace_unconscious", LINKFUNC(handleUnconscious)] call CBA_fnc_addEventHandler;
[QGVAR(initSupplyVehicle), { 
    TRACE_1("initSupplyVehicle EH",_this);   // Warning: this can run before settings are init
    [FUNC(initSupplyVehicle), _this] call EFUNC(common,runAfterSettingsInit);
}] call CBA_fnc_addEventHandler;

["vehicle", {
    params ["_unit"];
    [_unit] call FUNC(dropAmmo);
}] call CBA_fnc_addPlayerEventHandler;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {params ["_unit"]; [_unit] call FUNC(dropAmmo)}];
};

[QGVAR(makeDummyEH), LINKFUNC(makeDummy)] call CBA_fnc_addEventHandler;
[QGVAR(rearmSuccessEH), LINKFUNC(rearmSuccess)] call CBA_fnc_addEventHandler;
[QGVAR(rearmSuccessLocalEH), LINKFUNC(rearmSuccessLocal)] call CBA_fnc_addEventHandler;


GVAR(magazineNameCache) = [] call CBA_fnc_createNamespace;
GVAR(originalMagazineNames) = [];
