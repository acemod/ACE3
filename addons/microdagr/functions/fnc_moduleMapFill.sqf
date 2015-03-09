/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0:logic <OBJECT>
 * 1: synced units-not used <ARRAY>
 * 2: Module Activated <BOOL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_logic,_syncedUnits,_activated);

if (!_activated) exitWith {WARNING("Module Placed but not active");};

if (isServer) then {
  [_logic, QGVAR(MapDataAvailable), "MapDataAvailable"] call EFUNC(common,readSettingFromModule);
};
