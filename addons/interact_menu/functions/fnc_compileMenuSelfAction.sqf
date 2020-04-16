#include "script_component.hpp"
/*
 * Author: NouberNou and esteldunedain
 * Compile the self action menu from config for an object's class
 *
 * Arguments:
 * 0: Object or class name <OBJECT> or <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_interact_menu_fnc_compileMenuSelfAction
 *
 * Public: No
 */

params ["_target"];

private _objectType = _target;
if (_target isEqualType objNull) then {
    _objectType = typeOf _target;
};
private _namespace = GVAR(ActSelfNamespace);

// Exit if the action menu is already compiled for this class
if (!isNil {_namespace getVariable _objectType}) exitWith {};


private _recurseFnc = {
    params ["_actionsCfg"];

    private _actions = [];

    {
        private _entryCfg = _x;
        if (isClass _entryCfg) then {
            private _displayName = getText (_entryCfg >> "displayName");

            private _icon = if (isArray (_entryCfg >> "icon")) then {
                getArray (_entryCfg >> "icon");
            } else {
                [getText (_entryCfg >> "icon"), "#FFFFFF"];
            };
            private _statement = compile (getText (_entryCfg >> "statement"));

            private _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            // Add canInteract (including exceptions) and canInteractWith to condition
            _condition = _condition + format [QUOTE( && {[ARR_3(ACE_player, _target, %1)] call EFUNC(common,canInteractWith)} ), getArray (_entryCfg >> "exceptions")];

            private _insertChildren = compile (getText (_entryCfg >> "insertChildren"));
            private _modifierFunction = compile (getText (_entryCfg >> "modifierFunction"));

            private _showDisabled = (getNumber (_entryCfg >> "showDisabled")) > 0;
            private _enableInside = (getNumber (_entryCfg >> "enableInside")) > 0;
            private _canCollapse = (getNumber (_entryCfg >> "canCollapse")) > 0;
            private _runOnHover = true;
            if (isText (_entryCfg >> "runOnHover")) then {
                _runOnHover = compile getText (_entryCfg >> "runOnHover");
            } else {
                _runOnHover = (getNumber (_entryCfg >> "runOnHover")) > 0;
            };

            _condition = compile _condition;
            private _children = [_entryCfg] call _recurseFnc;

            private _entry = [
                        [
                            configName _entryCfg,
                            _displayName,
                            _icon,
                            _statement,
                            _condition,
                            _insertChildren,
                            [],
                            [0,0,0],
                            10, //distace
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover, true],
                            _modifierFunction
                        ],
                        _children
                    ];
            _actions pushBack _entry;
        };
        nil
    } count (configProperties [_actionsCfg, "isClass _x", true]);
    _actions
};

private _actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_SelfActions";

private _baseDisplayName = "";
private _baseIcon = "";
if (_objectType isKindOf "CAManBase") then {
    _baseDisplayName = localize LSTRING(SelfActionsRoot);
    _baseIcon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
} else {
    _baseDisplayName = getText (configFile >> "CfgVehicles" >> _objectType >> "displayName");
    //Alt would be to just use a static text, if veh names end up being too long:
    // _baseDisplayName = localize LSTRING(VehicleActionsRoot);

    //Pull the icon from the vehicle's config:
    _baseIcon = getText (configFile >> "CfgVehicles" >> _objectType >> "Icon");
    //icon could be a CfgVehicleIcons
    if isText (configFile >> "CfgVehicleIcons" >> _baseIcon) then {
        _baseIcon = getText (configFile >> "CfgVehicleIcons" >> _baseIcon);
    };
};

TRACE_1("Building ACE_SelfActions",_objectType);
// Create a master action to base on self action
private _actions = [
        [
            [
                "ACE_SelfActions",
                _baseDisplayName,
                _baseIcon,
                {
                    // Dummy statement so it's not collapsed when there's no available actions
                    true
                },
                {[ACE_player, _target, ["isNotInside","isNotDragging", "isNotCarrying", "isNotSwimming", "notOnMap", "isNotEscorting", "isNotSurrendering", "isNotSitting", "isNotOnLadder", "isNotRefueling"]] call EFUNC(common,canInteractWith)},
                {},
                {},
                "Spine3",
                10,
                [false,true,false,false,false]
            ],
            [_actionsCfg] call _recurseFnc
        ]
    ];

_namespace setVariable [_objectType, _actions];
