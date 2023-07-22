#include "script_component.hpp"

#include "XEH_PREP.hpp"

if (isFilePatchingEnabled) then {
    private _notLoaded = configProperties [configfile >> "ace_notLoaded", "isText _x"];
    {
        INFO_2("%1 not loaded because %2",configName _x, getText _x);
    } forEach _notLoaded;
};

// These functions are used for the ace arsenal, one of which are called in preStart (ace_arsenal_fnc_scanConfig)
// Cache for FUNC(getAddon)
uiNamespace setVariable [QGVAR(addonCache), createHashMap];

// Cache for FUNC(getConfigName)
uiNamespace setVariable [QGVAR(configNames), createHashMap];
