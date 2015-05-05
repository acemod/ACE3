/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_varName", "_dataID"];
_varName = _this select 0;
_dataID = _this select 1;

["bft_syncedArrayDelete", [_varName, _dataID]] call EFUNC(common,globalEvent);
