#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_2("CBA_settingsInitialized",GVAR(advancedCorrections),GVAR(disableArtilleryComputer));

    if (hasInterface) then {
        // Add hud overlay for actuall azimuth and elevation:
        GVAR(pfID) = -1;
        ["turret", LINKFUNC(turretChanged), true] call CBA_fnc_addPlayerEventHandler;

        // Add ability to dynamically open rangetables:
        ["ace_interactMenuOpened", LINKFUNC(interactMenuOpened)] call CBA_fnc_addEventHandler;
    };

    if (GVAR(advancedCorrections)) then {
        ["LandVehicle", "init", {
            params ["_vehicle"];
            private _vehicleCfg = configOf _vehicle;
            // config "ace_artillerytables_applyCorrections" [0 disabled, 1 enabled] falls back to artilleryScanner
            private _applyCorrections = if (isNumber (_vehicleCfg >> QGVAR(applyCorrections))) then {
                getNumber (_vehicleCfg >> QGVAR(applyCorrections))
            } else {
                getNumber (_vehicleCfg >> "artilleryScanner")
            };
            if (_applyCorrections == 1) then {
                TRACE_2("adding firedEH",_vehicle,configName _vehicleCfg);
                _vehicle addEventHandler ["Fired", {call FUNC(firedEH)}];
            };
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    };
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
#include "dev\showShotInfo.sqf"
#include "dev\checkConfigs.sqf"
#endif
