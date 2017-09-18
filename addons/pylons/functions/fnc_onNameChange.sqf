/*
 * Author: 654wak654
 * Called when current loadout name is changed.
 * Prevents default presets from gettings deleted / overwritten.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onNameChange
 *
 * Public: No
 */
#include "script_component.hpp"

if ((ctrlText ID_EDIT_LOADOUTNAME) in GVAR(defaultLoadoutNames)) then {
    ctrlEnable [ID_BUTTON_SAVE, false];
    ctrlEnable [ID_BUTTON_DELETE, false];
} else {
    ctrlEnable [ID_BUTTON_SAVE, true];
    ctrlEnable [ID_BUTTON_DELETE, true];
};
