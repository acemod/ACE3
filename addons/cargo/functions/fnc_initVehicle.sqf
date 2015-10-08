/*
 * Author: Glowbal
 * Initializes vehicle, adds open cargo menu action if available.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_cargo_fnc_initVehicle
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params", _vehicle);

private ["_type", "_initializedClasses"];
_type = typeOf _vehicle;
_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

if (isServer) then {
    {
        if (isClass _x) then {
            private ["_cargoClassname", "_cargoCount"];
            _cargoClassname = getText (_x >> "type");
            _cargoCount = getNumber (_x >> "amount");
            TRACE_3("adding ACE_Cargo", (configName _x), _cargoClassname, _cargoCount);
            ["AddCargoByClass", [_cargoClassname, _vehicle, _cargoCount]] call EFUNC(common,localEvent);
        };
    } count ("true" configClasses (configFile >> "CfgVehicles" >> _type >> "ACE_Cargo" >> "Cargo"));
};

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};
// set class as initialized
_initializedClasses pushBack _type;
SETMVAR(GVAR(initializedClasses),_initializedClasses);

if (getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(hasCargo)) != 1) exitWith {};

private ["_text", "_condition", "_statement", "_icon", "_action"];
_condition = {
    params ["_target", "_player"];
    GVAR(enable) && {locked _target < 2} && {alive _target} && {[_player, _target, []] call EFUNC(common,canInteractWith)}
};
_text = localize LSTRING(openMenu);
_statement = {GVAR(interactionVehicle) = _target; createDialog QGVAR(menu);};
_icon = "";

_action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
