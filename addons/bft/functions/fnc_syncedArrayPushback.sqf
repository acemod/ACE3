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
_data = _this select 1;

if (typeName _data == "ARRAY" && {(count _data == 0)}) exitwith {};

systemChat format["syncedArrayPushback: %1", _this];
diag_log format["syncedArrayPushback: %1", _this];

["bft_syncedArrayPushback", [_varName, _data]] call EFUNC(common,globalEvent);
