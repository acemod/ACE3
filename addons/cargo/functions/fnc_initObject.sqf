#include "..\script_component.hpp"
/*
 * Author: Glowbal, kymckay
 * Initializes variables for loadable objects. Called from init EH.
 *
 * Arguments:
 * 0: Item <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cargo_fnc_initObject
 *
 * Public: No
 */

// Dedicated servers and HCs do not require action menus
if (!hasInterface) exitWith {};

params ["_item"];
private _type = typeOf _item;
TRACE_2("params",_item,_type);

// If object had size given to it via eden/public, then override config canLoad setting
private _canLoadPublic = _item getVariable QGVAR(canLoad);
private _canLoadPublicDefined = !isNil "_canLoadPublic";

if (_canLoadPublicDefined && {!(_canLoadPublic isEqualType false)}) then {
    WARNING_4("%1[%2] - Variable %3 is %4 - Should be bool",_item,_type,QGVAR(canLoad),_canLoadPublic);
};

private _canLoadConfig = getNumber (configOf _item >> QGVAR(canLoad)) == 1;

// Nothing to do here if object can't be loaded
if !((_canLoadPublicDefined && {_canLoadPublic in [true, 1]}) || {!_canLoadPublicDefined && {_canLoadConfig}}) exitWith {};

// Unnecessary to add actions to an object class that's already got them
if (_type in GVAR(initializedItemClasses)) exitWith {};
if (_item getVariable [QGVAR(initObject),false]) exitWith {};

// Objects given size via eden have their actions added to the object
// So this function may run for multiple of the same class in that case
if (_canLoadConfig) then {
    GVAR(initializedItemClasses) pushBack _type;

    TRACE_1("Adding load cargo action to class",_type);

    {
        [_type, 0, ["ACE_MainActions"], _x] call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(objectActions);
} else {
    _item setVariable [QGVAR(initObject), true];

    TRACE_1("Adding load cargo action to object",_item);

    {
        [_item, 0, ["ACE_MainActions"], _x] call EFUNC(interact_menu,addActionToObject);
    } forEach GVAR(objectActions);
};
