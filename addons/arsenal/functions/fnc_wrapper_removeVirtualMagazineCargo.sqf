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
 * [cursorObject, "MiniGrenade"] call ace_arsenal_fnc_wrapper_removeVirtualMagazineCargo
 *
 * Public: No
*/
#include "script_component.hpp"

USE_WRAPPER(removeVirtualMagazineCargo,removeVirtualItemCargo);
