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
#include "script_component.hpp"

USE_WRAPPER(addVirtualMagazineCargo,addVirtualItemCargo);
