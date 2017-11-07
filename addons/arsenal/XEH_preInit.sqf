#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Arsenal
GVAR(modList) = ["","curator","kart","heli","mark","expansion","expansionpremium"];

[QGVAR(camInverted), "CHECKBOX", localize LSTRING(invertCameraSetting), "ACE3 Arsenal", false] call CBA_Settings_fnc_init;
[QGVAR(canUseCurrentMagTab), "CHECKBOX", localize LSTRING(currentMagTabSetting), "ACE3 Arsenal", false] call CBA_Settings_fnc_init;
[QGVAR(enableModIcons), "CHECKBOX", localize LSTRING(modIconsSetting), "ACE3 Arsenal", true] call CBA_Settings_fnc_init;
[QGVAR(fontHeight), "SLIDER", localize LSTRING(fontHeightSetting), "ACE3 Arsenal", [1, 10, 4.5, 1]] call CBA_Settings_fnc_init;

// Arsenal loadouts
[QGVAR(allowDefaultLoadouts), "CHECKBOX", localize LSTRING(allowDefaultLoadoutsSetting), "ACE3 Arsenal", true, true] call CBA_Settings_fnc_init;
[QGVAR(allowSharedLoadouts), "CHECKBOX", localize LSTRING(allowSharingSetting), "ACE3 Arsenal", true, true] call CBA_Settings_fnc_init;
[QGVAR(allowSharedLoadouts), "CHECKBOX", localize LSTRING(printToRPTSetting), "ACE3 Arsenal", true, true] call CBA_Settings_fnc_init;

ADDON = true;
