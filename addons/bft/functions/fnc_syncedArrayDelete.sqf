#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: varName <STRING>
 * 1: data ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_varName", "_dataID"];

["bft_syncedArrayDelete", [_varName, _dataID]] call CBA_fnc_globalEvent;
