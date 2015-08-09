/*
 * Author: SilentSpike
 * Compile the zeus action menu (only to be done once)
 *
 * Argument:
 * nil
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp";

// Exit if the action menu is already compiled for zeus
if !(isNil {missionNamespace getVariable [QGVAR(ZeusActions), nil]}) exitWith {};

private "_recurseFnc";
_recurseFnc = {
    private ["_actions", "_displayName", "_icon", "_statement", "_condition", "_showDisabled",
            "_enableInside", "_canCollapse", "_runOnHover", "_children", "_entry", "_entryCfg", "_insertChildren", "_modifierFunction"];
    params ["_actionsCfg"];
    _actions = [];

    {
        _entryCfg = _x;
        if(isClass _entryCfg) then {
            _displayName = getText (_entryCfg >> "displayName");

            _icon = getText (_entryCfg >> "icon");
            _statement = compile (getText (_entryCfg >> "statement"));

            _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            _insertChildren = compile (getText (_entryCfg >> "insertChildren"));
            _modifierFunction = compile (getText (_entryCfg >> "modifierFunction"));

            _showDisabled = (getNumber (_entryCfg >> "showDisabled")) > 0;
            _enableInside = (getNumber (_entryCfg >> "enableInside")) > 0;
            _canCollapse = (getNumber (_entryCfg >> "canCollapse")) > 0;
            _runOnHover = true;
            if (isText (_entryCfg >> "runOnHover")) then {
                _runOnHover = compile getText (_entryCfg >> "runOnHover");
            } else {
                _runOnHover = (getNumber (_entryCfg >> "runOnHover")) > 0;
            };

            _condition = compile _condition;
            _children = [_entryCfg] call _recurseFnc;

            _entry = [
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
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover],
                            _modifierFunction
                        ],
                        _children
                    ];
            _actions pushBack _entry;
        };
    } forEach (configProperties [_actionsCfg, "isClass _x", true]);
    _actions
};

private ["_actionsCfg"];
_actionsCfg = configFile >> "ACE_ZeusActions";

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
            [false,true,false]
        ],
        [_actionsCfg] call _recurseFnc
    ]
];
