#include "script_component.hpp"
/*
 * Author: Dystopian
 * Wrapper for BIS_fnc_removeVirtual*Cargo.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Items <STRING, ARRAY, BOOL>
 * 2: Remove globally <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "B_Carryall_oli"] call ace_arsenal_fnc_wrapper_removeVirtualBackpackCargo
 *
 * Public: No
*/

WAIT_AND_CHECK_SETTING(removeVirtualBackpackCargo);

USE_WRAPPER(removeVirtualItemCargo);
