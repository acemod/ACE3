#include "script_component.hpp"

["ace_settingsInitialized", {
    TRACE_2("ace_settingsInitialized",GVAR(advancedCorrections),GVAR(disableArtilleryComputer));

    if (hasInterface) then {
        // Add hud overlay for actuall azimuth and elevation:
        GVAR(pfID) = -1;
        ["turret", LINKFUNC(turretChanged), true] call CBA_fnc_addPlayerEventHandler;

        // Add ability to dynamically open rangetables:
        ["ace_interactMenuOpened", LINKFUNC(interactMenuOpened)] call CBA_fnc_addEventHandler;
    };

    if (GVAR(advancedCorrections)) then {
        [{ // add a frame later to allow other modules to set variables
            ["LandVehicle", "init", {
                params ["_vehicle"];
                private _enabled = _vehicle getVariable [QGVAR(enabled), getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "artilleryScanner")];
                if (_enabled in [0, false]) exitWith {};
                if (1 == getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(skipCorrections))) exitWith {};
                
                TRACE_3("enabled",_vehicle,typeOf _vehicle,_enabled);
                _vehicle addEventHandler ["Fired", {call FUNC(firedEH)}];
            }, true, [], true] call CBA_fnc_addClassEventHandler;
        }, []] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
#include "dev\showShotInfo.sqf"
#endif
