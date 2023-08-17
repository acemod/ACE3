#include "script_component.hpp"
/*
 * Author: KJW
 * Updates selected category and page variables on new category selection Used in GUI statements.
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["triage"] call ace_medical_gui_fnc_onCategorySelected
 *
 * Public: No
 */

 params ["_category"];

if (GVAR(selectedCategory) isEqualTo 'triage') then {
    GVAR(selectedCategory) = _category;
    GVAR(page) = GVAR(page) + 1;
} else {
    GVAR(selectedCategory) = _category;
};
