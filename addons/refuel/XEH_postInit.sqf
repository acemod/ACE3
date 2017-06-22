#include "script_component.hpp"

["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;
["weapon", FUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
};

[QGVAR(resetLocal), {
    _this call FUNC(resetLocal);
}] call CBA_fnc_addEventHandler;

// workaround for static fuel stations
if (hasInterface) then {
    {
        if (
            configName _x isKindOf "Building" &&
            {isClass (_x >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(Refuel))} &&
            {getNumber (_x >> "scope") == 2}
        ) then {
            TRACE_1("Compiling menu",configName _x);
            [configName _x] call EFUNC(interact_menu,compileMenu);
        };
    } count ('true' configClasses (configFile >> "CfgVehicles"));
};


#ifdef DEBUG_MODE_FULL
diag_log text format ["[ACE-refuel] Showing CfgVehicles with vanilla transportFuel"];
private _fuelTrucks = configProperties [configFile >> "CfgVehicles", "(isClass _x) && {(getNumber (_x >> 'transportFuel')) > 0}", true];
{
    if ((configName _x) isKindOf "Car") then {
        diag_log text format ["Car [%1] needs config [fuel: %2]", configName _x, getNumber (_x >> 'transportFuel')];
    } else {
        diag_log text format ["Non-car? [%1] needs config [fuel: %2]", configName _x, getNumber (_x >> 'transportFuel')];
    };
} forEach _fuelTrucks;
#endif
