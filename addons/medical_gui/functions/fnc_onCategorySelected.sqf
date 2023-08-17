#include "script_component.hpp"
/*
 * Author: KJW
 * Updates selected category and page variables on new category selection
 *
 * Arguments:
 * 0: Category <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["triage"] call ace_medical_gui_fnc_updateCategories
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
