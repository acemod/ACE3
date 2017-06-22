/*
 * Author: KoffeinFlummi, Glowbal
 * Callback when repair fails.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Unit that does the repairing <OBJECT>
 *   1: Vehicle to repair <OBJECT
 *   2: Selected hitpoint or hitpointIndex <STRING>or<NUMBER>
 *   3: Repair Action Classname <STRING>
 *   4: None
 *   5: Items available <ARRAY>
 *   6: Claimed Repair Objects <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[unit, vehicle, "hitpoint", "classname", nil, [items], [aWheel]]] call ace_repair_fnc_repair_failure
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args"];
_args params ["_caller", "_target","_selectionName","_className","","_usersOfItems", "_claimedObjects"];
TRACE_5("params",_caller,_target,_selectionName,_className,_usersOfItems);

private ["_config","_callback", "_usersOfItems", "_weaponSelect"];

if (primaryWeapon _caller == "ACE_FakePrimaryWeapon") then {
    _caller removeWeapon "ACE_FakePrimaryWeapon";
};
if (vehicle _caller == _caller) then {
    [_caller, _caller getVariable [QGVAR(repairPrevAnimCaller), ""], 2] call EFUNC(common,doAnimation);
};
_caller setVariable [QGVAR(repairPrevAnimCaller), nil];

_weaponSelect = (_caller getVariable [QGVAR(selectedWeaponOnrepair), ""]);
if (_weaponSelect != "") then {
    _caller selectWeapon _weaponSelect;
} else {
    _caller action ["SwitchWeapon", _caller, _caller, 299];
};

{
    (_x select 0) addItem (_x select 1);
} forEach _usersOfItems;

//Unclaim repair objects:
{
    TRACE_2("Releasing", _x, (typeOf _x));
    [objNull, _x, false] call EFUNC(common,claim);
} forEach _claimedObjects;


// Record specific callback
_config = (ConfigFile >> "ACE_Repair" >> "Actions" >> _className);

_callback = getText (_config >> "callbackFailure");
if (isNil _callback) then {
    _callback = compile _callback;
} else {
    _callback = missionNamespace getVariable _callback;
};
if (!(_callback isEqualType {})) then {_callback = {TRACE_1("callback was NOT code",_callback)};};

_args call _callback;

//todo: repair litter?
