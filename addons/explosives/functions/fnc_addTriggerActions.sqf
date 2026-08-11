#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Opens the UI for explosive trigger selection.
 *
 * Arguments:
 * 0: Explosive magazine <STRING>
 * 1: Explosive <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * ["SatchelCharge_Remote_Mag", cursorObject] call ace_explosives_fnc_addTriggerActions
 *
 * Public: No
 */

params ["_magazine", "_explosive"];
TRACE_2("params",_magazine,_explosive);

private _isAttached = !isNull (attachedTo _explosive);
private _detonators = ACE_player call FUNC(getDetonators);
private _magTriggers = configFile >> "CfgMagazines" >> _magazine >> "ACE_Triggers";
private _children = [];

{
    // Check if unit has all required detonators for specific trigger
    private _hasRequiredItems = (getArray (_x >> "requires")) findIf {!((_x call EFUNC(common,getConfigName)) in _detonators)} == -1;

    if (_hasRequiredItems && {!_isAttached || {getNumber (_x >> "isAttachable") == 1}}) then {
        private _configName = configName _x;
        private _config = _magTriggers >> _configName;

        _children pushBack [
            [
                format [QGVAR(trigger_%1), _forEachIndex],
                if (isText (_config >> "displayName")) then {
                    getText (_config >> "displayName")
                } else {
                    getText (_x >> "displayName")
                },
                if (isText (_config >> "picture")) then {
                    getText (_config >> "picture")
                } else {
                    getText (_x >> "picture")
                },
                {(_this select 2) call FUNC(selectTrigger)},
                {true},
                {},
                [_explosive, _magazine, _configName]
            ] call EFUNC(interact_menu,createAction),
            [],
            ACE_player
        ];
    };
} forEach (_magazine call FUNC(triggerType));

_children // return
