#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(DefaultChannel),
    "LIST",
    [localize LSTRING(DefaultChannel_DisplayName), localize LSTRING(DefaultChannel_Description)],
    format["ACE %1", localize LSTRING(Module_DisplayName)],
    [[-1, 0, 1, 2, 3, 4, 5], [ELSTRING(common,Disabled), "STR_channel_global", "STR_channel_side", "STR_channel_command", "STR_channel_group", "STR_channel_vehicle", "STR_channel_direct"], 0],
    true
] call CBA_settings_fnc_init;

ADDON = true;
