#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(mapIllumination),
    "CHECKBOX",
    [localize LSTRING(MapIllumination_DisplayName), localize LSTRING(MapIllumination_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(mapGlow),
    "CHECKBOX",
    [localize LSTRING(MapGlow_DisplayName), localize LSTRING(MapGlow_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(mapShake),
    "CHECKBOX",
    [localize LSTRING(MapShake_DisplayName), localize LSTRING(MapShake_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    true,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(mapLimitZoom),
    "CHECKBOX",
    [localize LSTRING(MapLimitZoom_DisplayName), localize LSTRING(MapLimitZoom_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(mapShowCursorCoordinates),
    "CHECKBOX",
    [localize LSTRING(MapShowCursorCoordinates_DisplayName), localize LSTRING(MapShowCursorCoordinates_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    false,
    true
] call CBA_settings_fnc_init;

[
    QGVAR(DefaultChannel),
    "LIST",
    [localize LSTRING(DefaultChannel_DisplayName), localize LSTRING(DefaultChannel_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    [[-1, 0, 1, 2, 3, 4, 5], [ELSTRING(common,Disabled), "STR_channel_global", "STR_channel_side", "STR_channel_command", "STR_channel_group", "STR_channel_vehicle", "STR_channel_direct"], 0],
    true
] call CBA_settings_fnc_init;

ADDON = true;
