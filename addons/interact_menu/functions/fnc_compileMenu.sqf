/*
 * Author: NouberNou and CAA-Picard
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

private ["_objectType","_actionsVarName"];
_objectType = _target;
if (typeName _target == "OBJECT") then {
    _objectType = typeOf _target;
};
_actionsVarName = format [QGVAR(Act_%1), _objectType];

// Exit if the action menu is already compiled for this class
if !(isNil {missionNamespace getVariable [_actionsVarName, nil]}) exitWith {};

private "_recurseFnc";
_recurseFnc = {
    private ["_actions", "_displayName", "_distance", "_icon", "_statement", "_selection", "_condition", "_showDisabled",
            "_enableInside", "_canCollapse", "_runOnHover", "_children", "_entry", "_entryCfg", "_fullPath"];
    EXPLODE_2_PVT(_this,_actionsCfg,_parentPath);
    _actions = [];

    for "_i" from 0 to (count _actionsCfg) - 1 do {
        _entryCfg = _actionsCfg select _i;
        if(isClass _entryCfg) then {
            _displayName = getText (_entryCfg >> "displayName");
            _distance = getNumber (_entryCfg >> "distance");
            _icon = getText (_entryCfg >> "icon");
            _statement = compile (getText (_entryCfg >> "statement"));
            _selection = getText (_entryCfg >> "selection");
            if (_selection == "") then {
                _selection = [0,0,0];
            };
            _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            // Add canInteract (including exceptions) and canInteractWith to condition
            _condition = _condition + format [QUOTE( && {%1 call EGVAR(common,canInteract)} && {[ARR_2(ACE_player, _target)] call EFUNC(common,canInteractWith)} ), getArray (_entryCfg >> "exceptions")];

            _showDisabled = (getNumber (_entryCfg >> "showDisabled")) > 0;
            _enableInside = (getNumber (_entryCfg >> "enableInside")) > 0;
            _canCollapse = (getNumber (_entryCfg >> "canCollapse")) > 0;
            _runOnHover = (getNumber (_entryCfg >> "runOnHover")) > 0;

            _fullPath = (+ _parentPath);
            _fullPath pushBack (configName _entryCfg);

            _condition = compile _condition;
            _children = [_entryCfg, _fullPath] call _recurseFnc;

            _entry = [
                        [
                            _displayName,
                            _icon,
                            _selection,
                            _statement,
                            _condition,
                            _distance,
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover],
                            _fullPath
                        ],
                        _children
                    ];
            _actions pushBack _entry;
        };
    };
    _actions
};

private "_actionsCfg";
_actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_Actions";

missionNamespace setVariable [_actionsVarName, [_actionsCfg, []] call _recurseFnc];

/*
[
    [
        [
            "My Action",
            "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa",
            [0,0,0],
            { (_this select 0) setVelocity [0,0,10]; },
            { true },
            1,
            [false,false,false]
            ["ACE_MainActions","TeamManagement","MyAction"]
        ],
        [children actions]
    ]
]
*/
