/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive trigger selection
 *
 * Arguments:
 * 0: Explosive Magazine <STRING>
 * 1: Explosive <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [lbData [8866, lbCurSel 8866], _explosive] call ACE_Explosives_fnc_addTriggerActions;
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_hasRequiredItems","_triggerTypes", "_children", "_detonators", "_required", "_magTriggers", "_isAttached"];
EXPLODE_2_PVT(_this,_magazine,_explosive);

_isAttached = !isNull (attachedTo _explosive);
_detonators = [ACE_player] call FUNC(getDetonators);
_triggerTypes = [_magazine] call FUNC(triggerType);
_magTriggers = ConfigFile >> "CfgMagazines" >> _magazine >> "ACE_Triggers";
_children = [];
{
    _required = getArray (_x >> "requires");
    _hasRequiredItems = true;
    {
        if !(_x in _detonators) exitWith {
            _hasRequiredItems = false;
        };
    } count _required;
    if (_hasRequiredItems && {(!_isAttached) || {(getNumber (_x >> "isAttachable")) == 1}}) then {
        _children pushBack
            [
                [
                    format ["Trigger_%1", _forEachIndex],
                    if(isText(_magTriggers >> configName _x >> "displayName"))then
                        {getText(_magTriggers >> configName _x >> "displayName")}
                        else{getText(_x >> "displayName")},
                    if(isText(_magTriggers >> configName _x >> "picture"))then
                        {getText(_magTriggers >> configName _x >> "picture")}
                        else{getText(_x >> "picture")},
                    {(_this select 2) call FUNC(selectTrigger);},
                    {true},
                    {},
                    [_explosive, _magazine, configName _x]
                ] call EFUNC(interact_menu,createAction),
                [],
                ACE_Player
            ];
    };
} foreach _triggerTypes;

_children
