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
 * [cursorObject, "MiniGrenade"] call ace_arsenal_fnc_wrapper_addVirtualMagazineCargo
 *
 * Public: No
*/

WAIT_AND_CHECK_SETTING(addVirtualMagazineCargo);

USE_WRAPPER(addVirtualItemCargo);
