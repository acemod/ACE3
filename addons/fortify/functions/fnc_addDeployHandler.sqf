#include "script_component.hpp"
/*
 * Author: Cuel, mharis001
 * Adds a custom deploy handler.
 * Code needs to return BOOL: true (allowed) / false (blocked).
 *
 * Arguments:
 * 0: Code <CODE>
 *  - Passed [Unit <OBJECT>, Object being placed <OBJECT>, Cost <NUMBER>]
 *
 * Return Value:
 * None
 *
 * Example:
 * [{(_this select 0) getVariable ["isBobTheBuilder", false]}] call ace_fortify_fnc_addDeployHandler
 *
 * Public: Yes
 */

params [["_code", {}, [{}]]];

if (_code isEqualTo {} || {_code isEqualTo {true}}) exitWith {};
GVAR(deployHandlers) pushBack _code;
