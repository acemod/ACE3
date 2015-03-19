/*
 * Author: CAA-Picard
 * Creates an isolated ACE action
 * Note: This function is NOT global.
 *
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Position (Position or Selection Name) <POSITION> or <STRING>
 * 4: Statement <CODE>
 * 5: Condition <CODE>
 * 6: Distance <NUMBER>
 * 7: Other parameters <ARRAY> (Optional)
 * 8: Insert children code <CODE> (Optional)
 * 9: Action parameters <ANY> (Optional)
 *
 * Return value:
 * Action
 *
 * Example:
 * [[VulcanPinch"],"Vulcan Pinch","",[0,0,0],{_target setDamage 1;},{true},100,{},[parameters]] call ace_interact_menu_fnc_addAction;
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_7_PVT(_this,_fullPath,_displayName,_icon,_position,_statement,_condition,_distance);

private ["_actions","_params","_insertChildren","_parameters","_entry"];

_params = [false,false,false,false];
if (count _this > 7) then {
    _params = _this select 7;
};

_insertChildren = {};
if (count _this > 8) then {
    _insertChildren = _this select 8;
};

_parameters = [];
if (count _this > 9) then {
    _parameters = _this select 9;
};

_entry = [
            [
                _displayName,
                _icon,
                _position,
                _statement,
                _condition,
                _distance,
                _params,
                + _fullPath,
                _insertChildren,
                _parameters
            ],
            []
        ];

_entry
