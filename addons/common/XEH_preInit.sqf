// by commy2
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(syncedEvents) = [] call CBA_fnc_hashCreate;
GVAR(showHudHash) = [] call CBA_fnc_hashCreate;

GVAR(settingsInitFinished) = false;
GVAR(runAtSettingsInitialized) = [];

// @todo: Generic local-managed global-synced objects (createVehicleLocal)

//Debug
ACE_COUNTERS = [];

// Load ace_settings into CBA Settings
[] call FUNC(cbaSettings);

GVAR(statusEffect_Names) = [];
GVAR(statusEffect_isGlobal) = [];

GVAR(setHearingCapabilityMap) = [];

//////////////////////////////////////////////////
// Set up PlayerChanged eventhandler for pre init (EH is installed in postInit)
//////////////////////////////////////////////////

ACE_player = objNull;
uiNamespace setVariable ["ACE_player", objNull];

// Init toHex
[0] call FUNC(toHex);

isHC = !hasInterface && !isDedicated; // deprecated because no tag
missionNamespace setVariable ["ACE_isHC", ACE_isHC];
uiNamespace setVariable ["ACE_isHC", ACE_isHC];

[
    QGVAR(persistentLaserEnabled),
    "CHECKBOX",
    [localize LSTRING(SettingPersistentLaserName), localize LSTRING(SettingPersistentLaserDesc)],
    localize LSTRING(ACEKeybindCategoryWeapons),
    false,
    false,
    LINKFUNC(switchPersistentLaser)
] call CBA_settings_fnc_init;

ADDON = true;
