#include "..\script_component.hpp"
/*
 * Author: Jonpas, LinkIsGrim
 * Returns base attachment for CBA scripted attachment
 * Adapted from CBA_fnc_switchableAttachments
 *
 * Arguments:
 * 0: Attachment <STRING>
 *
 * Return Value:
 * Base attachment <STRING>
 *
 * Example:
 * "ACE_acc_pointer_green_IR" call ace_arsenal_fnc_baseAttachment
 *
 * Public: Yes
 */

params [["_item", "", [""]]];

TRACE_1("looking up base attachment",_item);

private _switchableClasses = [];

private _cfgWeapons = configfile >> "CfgWeapons";
private _config = _cfgWeapons >> _item;
_item = configName _config;

while {
    _config = _cfgWeapons >> getText (_config >> "MRT_SwitchItemNextClass");
    isClass _config && {_switchableClasses pushBackUnique configName _config != -1}
} do {};

_config = _cfgWeapons >> _item;
private _backward = [];
while {
    _config = _cfgWeapons >> getText (_config >> "MRT_SwitchItemPrevClass");
    isClass _config && {_backward pushBackUnique configName _config != -1}
} do {};

_switchableClasses append _backward;
_switchableClasses = _switchableClasses arrayIntersect _switchableClasses;

{
    if (getNumber (_cfgWeapons >> _x >> "scope") == 2) exitWith {
        TRACE_2("found class",_item,_x);
        _item = _x;
    };
} forEach _switchableClasses;

_item
