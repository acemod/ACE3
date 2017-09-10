/*
 * Author: 654wak654
 * Handles the closing of the dialog.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onButtonClose
 *
 * Public: No
 */

[GVAR(currentAircraft), "blockEngine", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
closeDialog 2;
