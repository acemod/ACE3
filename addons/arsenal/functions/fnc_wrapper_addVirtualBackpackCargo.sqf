#include "script_component.hpp"
/*
 * Author: Dystopian
 * Wrapper for BIS_fnc_addVirtual*Cargo.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Items <STRING, ARRAY, BOOL>
 * 2: Add globally <BOOL> (default: false)
 * 3: Init box <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "B_Carryall_oli"] call ace_arsenal_fnc_wrapper_addVirtualBackpackCargo
 *
 * Public: No
*/

WAIT_AND_CHECK_SETTING(addVirtualBackpackCargo);

USE_WRAPPER(addVirtualItemCargo);
