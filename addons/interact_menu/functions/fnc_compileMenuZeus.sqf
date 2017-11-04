/*
 * Author: SilentSpike
 * Compile the zeus action menu (only to be done once)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_interact_menu_fnc_compileMenuZeus
 *
 * Public: No
 */
#include "script_component.hpp"

// Exit if the action menu is already compiled for zeus
if !(isNil {missionNamespace getVariable [QGVAR(ZeusActions), nil]}) exitWith {};

private _recurseFnc = {
    params ["_actionsCfg"];
    private _actions = [];

    {
        private _entryCfg = _x;
        if(isClass _entryCfg) then {
            private _displayName = getText (_entryCfg >> "displayName");

            private _icon = getText (_entryCfg >> "icon");
            private _statement = compile (getText (_entryCfg >> "statement"));

            private _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

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

            private _condition = compile _condition;
            private _children = [_entryCfg] call _recurseFnc;

            private _entry = [
                        [
                            configName _entryCfg,
                            _displayName,
                            _icon,
                            _statement,
                            _condition,
                            _insertChildren,
                            {},
                            [0,0,0],
                            10, //distace
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover,false],
                            _modifierFunction
                        ],
                        _children
                    ];
            _actions pushBack _entry;
        };
    } forEach (configProperties [_actionsCfg, "isClass _x", true]);
    _actions
};

private _actionsCfg = configFile >> "ACE_ZeusActions";

// Create a master action to base zeus actions on
GVAR(ZeusActions) = [
    [
        [
            "ACE_ZeusActions",
            localize LSTRING(ZeusActionsRoot),
            "\A3\Ui_F_Curator\Data\Logos\arma3_zeus_icon_ca.paa",
            {true},
            {true},
            {},
            {},
            {[0,0,0]},
            10,
            [false,true,false,false,false]
        ],
        [_actionsCfg] call _recurseFnc
    ]
];
