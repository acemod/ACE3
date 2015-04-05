/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * none
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

GVAR(ClientSettingsExportIncluded) = !(GVAR(ClientSettingsExportIncluded));

private "_settingsMenu";
disableSerialization;
_settingsMenu = uiNamespace getVariable 'ACE_serverSettingsMenu';
if (GVAR(ClientSettingsExportIncluded)) then {
    (_settingsMenu displayCtrl 1102) ctrlSetText localize ("STR_ACE_OptionsMenu_exClientSettings");
} else {
    (_settingsMenu displayCtrl 1102) ctrlSetText localize ("STR_ACE_OptionsMenu_inClientSettings");
};

[] call FUNC(onServerSettingsMenuOpen);
