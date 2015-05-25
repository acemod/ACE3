/*
 * Author: NouberNou and esteldunedain
 * Compile the action menu from config for an object's class
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

private ["_objectType","_actionsVarName","_isMan"];
_objectType = _target;
_isMan = false;
if (typeName _target == "OBJECT") then {
    _objectType = typeOf _target;
    _isMan = _target isKindOf "CAManBase";
};
_actionsVarName = format [QGVAR(Act_%1), _objectType];

// Exit if the action menu is already compiled for this class
if !(isNil {missionNamespace getVariable [_actionsVarName, nil]}) exitWith {};

private "_recurseFnc";
_recurseFnc = {
    private ["_actions", "_displayName", "_distance", "_icon", "_statement", "_position", "_condition", "_showDisabled", "_enableInside", "_canCollapse", "_runOnHover", "_children", "_entry", "_entryCfg", "_insertChildren", "_modifierFunction", "_i"];
    EXPLODE_1_PVT(_this,_actionsCfg);
    _actions = [];

    for "_i" from 0 to (count _actionsCfg) - 1 do {
        _entryCfg = _actionsCfg select _i;
        if(isClass _entryCfg) then {
            _displayName = getText (_entryCfg >> "displayName");
            _distance = getNumber (_entryCfg >> "distance");
            _icon = getText (_entryCfg >> "icon");
            _statement = compile (getText (_entryCfg >> "statement"));

            // If the position entry is present, compile it
            _position = getText (_entryCfg >> "position");
            if (_position != "") then {
                _position = compile _position;
            } else {
                // If the not, but the selection entry is present use that
                _position = getText (_entryCfg >> "selection");
                if (_position != "") then {
                    _position = compile format ["_target selectionPosition '%1'", _position];
                } else {
                    // Otherwise, just use the origin
                    _position = {[0,0,0]};
                };
            };

            _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            // Add canInteract (including exceptions) and canInteractWith to condition
            if ((configName _entryCfg) != "ACE_MainActions") then {
                _condition = _condition + format [QUOTE( && {[ARR_3(ACE_player, _target, %1)] call EFUNC(common,canInteractWith)} ), getArray (_entryCfg >> "exceptions")];
            };

            _insertChildren = compile (getText (_entryCfg >> "insertChildren"));
            _modifierFunction = compile (getText (_entryCfg >> "modifierFunction"));

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
                            _position,
                            _distance,
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover],
                            _modifierFunction
                        ],
                        _children
                    ];
            _actions pushBack _entry;
        };
    };
    _actions
};

private ["_actionsCfg","_actions"];
_actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_Actions";

// If the classname inherits from CAManBase, just copy it's menu without recompiling a new one
_actions = if (_isMan) then {
    + (missionNamespace getVariable QGVAR(Act_CAManBase))
} else {
    [_actionsCfg] call _recurseFnc
};
missionNamespace setVariable [_actionsVarName, _actions];

/*
[
    [
        [
            "MyAction",
            "My Action",
            "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa",
            { (_this select 0) setVelocity [0,0,10]; },
            { true },
            {},
            [],
            {[0,0,0]},
            1,
            [false,false,false]
        ],
        [children actions]
    ]
]
*/
