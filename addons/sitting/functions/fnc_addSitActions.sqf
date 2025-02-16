#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Adds sit actions.
 *
 * Arguments:
 * 0: Seat <OBJECT or STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_sitting_fnc_addSitActions
 *
 * Public: No
 */

// Only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(addSitActions), _this];
};

params ["_seat"];

private _type = _seat;
if (_seat isEqualType objNull) then {
    _type = typeOf _seat;
};

private _configFile = configFile >> "CfgVehicles" >> _type;

// Exit if sitting disabled or the object is not specified as a seat
if (!XGVAR(enable) || {getNumber (_configFile >> QXGVAR(canSit)) != 1}) exitWith {};

// Exit if class already initialized
if (_type in GVAR(initializedClasses)) exitWith {};
GVAR(initializedClasses) pushBack _type;

TRACE_1("Adding Sit Action",_type);

private _sitPosition = getArray (_configFile >> QXGVAR(sitPosition));
private _interactPosition = getArray (_configFile >> QXGVAR(interactPosition));

if (count _sitPosition != count _interactPosition) exitWith {
    WARNING_1("Invalid sitting configuration of %1!",_type);
};

if !((_sitPosition select 0) isEqualType []) then {
    _sitPosition = [_sitPosition];
    _interactPosition = [_interactPosition];
};

{
    private _menuPosition = [0,0,0];
    private _menuType = ["ACE_MainActions"];
    if (count _interactPosition >= _forEachIndex) then {
        _menuPosition = _interactPosition select _forEachIndex;
        _menuType = [];
    };

    TRACE_3("Menu Position",_menuPosition,_menuType,_forEachIndex);

    private _sitAction = [
        format [QGVAR(Sit_%1), _forEachIndex],
        LLSTRING(Sit),
        QUOTE(PATHTOF(UI\sit_ca.paa)),
        {call FUNC(sit)},
        {call FUNC(canSit)},
        {},
        _forEachIndex,
        _menuPosition,
        1.5
    ] call EFUNC(interact_menu,createAction);
    [_type, 0, _menuType, _sitAction] call EFUNC(interact_menu,addActionToClass);
} forEach _sitPosition;

nil // return
