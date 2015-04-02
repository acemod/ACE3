/*
 * Author: NouberNou and esteldunedain
 * Compile the self action menu from config for an object's class
 *
 * Argument:
 * 0: Object or class name <OBJECT> or <STRING>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp";

EXPLODE_1_PVT(_this,_target);

private ["_objectType","_actionsVarName"];
_objectType = _target;
if (typeName _target == "OBJECT") then {
    _objectType = typeOf _target;
};
_actionsVarName = format [QGVAR(SelfAct_%1), _objectType];

// Exit if the action menu is already compiled for this class
if !(isNil {missionNamespace getVariable [_actionsVarName, nil]}) exitWith {};

private "_recurseFnc";
_recurseFnc = {
    private ["_actions", "_displayName", "_distance", "_icon", "_statement", "_selection", "_condition", "_showDisabled",
            "_enableInside", "_canCollapse", "_runOnHover", "_children", "_entry", "_entryCfg", "_insertChildren"];
    EXPLODE_1_PVT(_this,_actionsCfg);
    _actions = [];

    for "_i" from 0 to (count _actionsCfg) - 1 do {
        _entryCfg = _actionsCfg select _i;
        if(isClass _entryCfg) then {
            _displayName = getText (_entryCfg >> "displayName");

            _icon = getText (_entryCfg >> "icon");
            _statement = compile (getText (_entryCfg >> "statement"));

            _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            // Add canInteract (including exceptions) and canInteractWith to condition
            _condition = _condition + format [QUOTE( && {[ARR_3(ACE_player, _target, %1)] call EFUNC(common,canInteractWith)} ), getArray (_entryCfg >> "exceptions")];

            _insertChildren = compile (getText (_entryCfg >> "insertChildren"));

            _showDisabled = (getNumber (_entryCfg >> "showDisabled")) > 0;
            _enableInside = (getNumber (_entryCfg >> "enableInside")) > 0;
            _canCollapse = (getNumber (_entryCfg >> "canCollapse")) > 0;
            _runOnHover = (getNumber (_entryCfg >> "runOnHover")) > 0;

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
                            [],
                            [0,0,0],
                            10, //distace
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover]
                        ],
                        _children
                    ];
            _actions pushBack _entry;
        };
    };
    _actions
};

private "_actionsCfg";
_actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_SelfActions";

private ["_baseDisplayName", "_baseIcon"];
_baseDisplayName = "";
_baseIcon = "";
if (_objectType isKindOf "CAManBase") then {
    _baseDisplayName = "Self Actions";
    _baseIcon = "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa";
} else {
    _baseDisplayName = getText (configFile >> "CfgVehicles" >> _objectType >> "displayName");
    _baseIcon = getText (configFile >> "CfgVehicles" >> _objectType >> "Icon");
};

// Create a master action to base on self action
_actions = [
    [
        [
            "ACE_SelfActions",
            _baseDisplayName,
            _baseIcon,
            {
                // Dummy statement so it's not collapsed when there's no available actions
                true
            },
            {[ACE_player, _target, ["isNotInside","isNotDragging", "isNotCarrying", "isNotSwimming", "notOnMap", "isNotEscorting", "isNotSurrendering"]] call EFUNC(common,canInteractWith)},
            {},
            [],
            "Spine3",
            10,
            [false,true,false]
        ],
        [_actionsCfg] call _recurseFnc
    ]
];

missionNamespace setVariable [_actionsVarName, _actions];
