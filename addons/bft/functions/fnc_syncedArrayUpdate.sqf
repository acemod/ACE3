#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: varName <STRING>
 * 1: data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_varName", "_data"];

if (typeName _data == "ARRAY" && {_data isEqualTo []}) exitwith {};

["bft_syncedArrayUpdate", _this] call CBA_fnc_globalEvent;
