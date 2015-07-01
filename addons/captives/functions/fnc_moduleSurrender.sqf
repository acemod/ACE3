/*
 * Author: PabstMirror
 * Module Function to make a unit surrender (can be called from editor, or placed with zeus)
 *
 * Arguments:
 * 0: The Module Logic Object <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Called from module
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_logic,_units,_activated);
private ["_bisMouseOver", "_mouseOverObject"];

if (!_activated) exitWith {};

if (local _logic) then {
    //Modules run before postInit can instal the event handler, so we need to wait a little bit
    [{
        PARAMS_1(_units);
        {
            ["SetSurrendered", [_x], [_x, true]] call EFUNC(common,targetEvent);
        } forEach _units;
    }, [_units], 0.05, 0.05]call EFUNC(common,waitAndExecute);

    deleteVehicle _logic;
};
