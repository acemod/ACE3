/*
 * Author: Glowbal
 * initalize vehicle. Adds open caro menu action if available
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * None
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
            private ["_className", "_amount","_position","_object"];
            _className = getText (_x >> "type");
            _amount = getNumber (_x >> "amount");
            _position = getPos _vehicle;
            _position set [1, (_position select 1) + 1];
            _position set [2, (_position select 2) + 7.5];
            for "_i" from 1 to _amount do {
                _object = createVehicle [_className, _position, [], 0, "CAN_COLLIDE"];
                if !([_object, _vehicle] call FUNC(loadItem)) exitwith {
                    deleteVehicle _object;
                };
            };
        };
        nil
    } count ("true" configClasses (configFile >> "CfgVehicles" >> _type >> "ACE_Cargo" >> "Cargo"));
};

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};
// set class as initialized
_initializedClasses pushBack _type;
SETMVAR(GVAR(initializedClasses),_initializedClasses);

if (getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(hasCargo)) != 1) exitwith {};

private ["_text", "_condition", "_statement", "_icon", "_action"];
_condition = {GVAR(enable)};
_text = localize LSTRING(openMenu);
_statement = {GVAR(interactionVehicle) = _target; createDialog QGVAR(menu);};
_icon = "";

_action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
