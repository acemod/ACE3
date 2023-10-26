#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    // Master Count - only on server and needed before postInit
    GVAR(intelCount) = 0;

    // Map of all magazine ids and their corresponding intel index
    GVAR(intelMap) = [true] call CBA_fnc_createNamespace;
    publicVariable QGVAR(intelMap);

    // Namespace of intel indices and their corresponding data
    GVAR(intelData) = [true] call CBA_fnc_createNamespace;
    publicVariable QGVAR(intelData);

    [QGVAR(handleMagIndex), FUNC(handleMagIndex)] call CBA_fnc_addEventHandler;
    [QGVAR(setObjectData), FUNC(setObjectData)] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    // Array of all open controls groups
    GVAR(controlsGroups) = [];

    // Hash to track controls group positions on map between closing
    GVAR(controlsData) = [] call CBA_fnc_hashCreate;
};

ADDON = true;
