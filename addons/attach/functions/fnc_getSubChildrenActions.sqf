#include "script_component.hpp"
/*
 * Author: Slatery
 * Returns Sub actions for attachable items.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 3: ClassName <STRING>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target, _player,"ACE_IR_Strobe_Item"] call ace_attach_fnc_getSubChildrenActions
 *
 * Public: No
 */

params ["_target", "_player", "_configClass"];
_childactions = [];
if (isArray (configFile >> "CfgWeapons" >> _configClass >> "ACE_attachable_children")) then {
    {
        private _configstring = _x;
        if (gettext (configFile >> "CfgWeapons" >> _configstring >> "ACE_Attachable") != "") then {
            private _info = [_target, _player, _configstring];
            private _displayname = gettext (configFile >> "CfgWeapons" >> _configstring >> "selectname");
            private _picture = gettext (configFile >> "CfgWeapons" >> _configstring >> "picture");
            
            private _statement = {
                [{
                    _this call FUNC(attach);
                }, _this] call CBA_fnc_execNextFrame;
            };
            private _childExtra = {
                _this call FUNC(getSubChildrenActions);
            };
            private _childaction = [_configstring, _displayname, _picture, _statement, {true}, _childExtra, _x] call EFUNC(interact_menu,createAction);
            _childactions pushBack [_childaction, [], _target];
        };
    } forEach (getArray (configFile >> "CfgWeapons" >> _configClass >> "ACE_attachable_children"));
};
_childactions