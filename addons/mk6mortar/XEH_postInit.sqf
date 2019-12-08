#include "script_component.hpp"

if (hasInterface) then {
    ["ace_infoDisplayChanged", FUNC(turretDisplayLoaded)] call CBA_fnc_addEventHandler;
};

["ace_settingsInitialized", {
    TRACE_1("ace_settingsInitialized",GVAR(useAmmoHandling));

    ["vehicle", FUNC(handlePlayerVehicleChanged), true] call CBA_fnc_addPlayerEventHandler;
}] call CBA_fnc_addEventHandler;
