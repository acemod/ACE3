#include "script_component.hpp"
/*
 * Author: veteran29
 * Handle player unit animation changes.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Current animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [newbob, "amovpercmtacslowwrfldf_ver2"] call ace_ui_fnc_onAnimChanged
 *
 * Public: No
 */

(_this select 1) call FUNC(handleSpeedIndicator);
