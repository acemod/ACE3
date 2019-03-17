#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Executes code after setting are initilized.
 *
 * Arguments:
 * 0: Code to execute <CODE>
 * 1: Parameters to run the code with <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{if (GVAR(setting) then {x} else {y};}, []] call ace_common_fnc_runAfterSettingsInit
 *
 * Public: No
 */

params ["_func", "_params"];

if (GVAR(settingsInitFinished)) then {
    //Setting Already Finished, Direct Run the code
    _params call _func;
} else {
    //Waiting on settings, throw it on the delayed run array
    GVAR(runAtSettingsInitialized) pushBack [_func, _params];
};
