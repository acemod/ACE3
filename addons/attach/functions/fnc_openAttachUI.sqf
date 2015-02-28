/*
 * Author: Garth de Wet (LH)
 * Opens the UI for attaching objects.
 *
 * Arguments:
 * 0: unit <STRING>
 * 1: target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_actions", "_attachables", "_item"];

PARAMS_2(_unit,_target);

GVAR(attachTarget) = _target;
_listed = [];
_attachables = magazines _unit;
_actions = [localize "STR_ACE_Attach_AttachDetach", localize "STR_ACE_Attach_Attach"] call EFUNC(interaction,prepareSelectMenu);
{
    if !(_x in _listed) then {
        _item = ConfigFile >> "CfgMagazines" >> _x;
        if (getNumber (_item >> "ACE_Attachable") == 1) then {
            _actions = [
            _actions,
            getText(_item >> "displayName"),
            getText(_item >> "picture"),
            _x
            ] call EFUNC(interaction,addSelectableItem);
        };
        _listed pushBack _x;
    };
} forEach _attachables;
_attachables = items _unit;
{
    if !(_x in _listed) then {
        _item = ConfigFile >> "CfgWeapons" >> _x;
        if (getNumber (_item >> "ACE_Attachable") == 1) then {
            _actions = [
            _actions,
            getText(_item >> "displayName"),
            getText(_item >> "picture"),
            _x
            ] call EFUNC(interaction,addSelectableItem);
        };
        _listed pushBack _x;
    };
} forEach _attachables;

[
    _actions,
    {
        [ACE_player, GVAR(attachTarget), _this] call FUNC(attach);
        call EFUNC(interaction,hideMenu);
    },
    {
        call EFUNC(interaction,hideMenu);
        if !(profileNamespace getVariable [QEGVAR(interaction,AutoCloseMenu), false]) then {"Default" call EFUNC(interaction,openMenuSelf)};
    }
] call EFUNC(interaction,openSelectMenu);
