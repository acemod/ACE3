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

params ["_target"];

private _objectType = _target;
if (_target isEqualType objNull) then {
    _objectType = typeOf _target;
};
private _actionsVarName = format [QGVAR(Act_%1), _objectType];

// Exit if the action menu is already compiled for this class
if !(isNil {missionNamespace getVariable [_actionsVarName, nil]}) exitWith {};

private _recurseFnc = {
    params ["_actionsCfg", "_parentDistance"];
    private _actions = [];

    {
        private _entryCfg = _x;
        if(isClass _entryCfg) then {
            private _displayName = getText (_entryCfg >> "displayName");
            private _distance = _parentDistance;
            if (isNumber (_entryCfg >> "distance")) then {_distance = getNumber (_entryCfg >> "distance");};
            // if (_distance < _parentDistance) then {ACE_LOGWARNING_3("[%1] distance %2 less than parent %3", configName _entryCfg, _distance, _parentDistance);};
            private _icon = getText (_entryCfg >> "icon");
            private _statement = compile (getText (_entryCfg >> "statement"));

            // If the position entry is present, compile it
            private _position = getText (_entryCfg >> "position");
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

            private _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            // Add canInteract (including exceptions) and canInteractWith to condition
            if ((configName _entryCfg) != "ACE_MainActions") then {
                _condition = _condition + format [QUOTE( && {[ARR_3(ACE_player, _target, %1)] call EFUNC(common,canInteractWith)} ), getArray (_entryCfg >> "exceptions")];
            };

            private _insertChildren = compile (getText (_entryCfg >> "insertChildren"));
            private _modifierFunction = compile (getText (_entryCfg >> "modifierFunction"));

            private _showDisabled = (getNumber (_entryCfg >> "showDisabled")) > 0;
            private _enableInside = (getNumber (_entryCfg >> "enableInside")) > 0;
            private _canCollapse = (getNumber (_entryCfg >> "canCollapse")) > 0;
            private _runOnHover = false;
            if (isText (_entryCfg >> "runOnHover")) then {
                _runOnHover = compile getText (_entryCfg >> "runOnHover");
            } else {
                _runOnHover = (getNumber (_entryCfg >> "runOnHover")) > 0;
            };

            _condition = compile _condition;
            private _children = [_entryCfg, _distance] call _recurseFnc;

            private _entry = [
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
                            [_showDisabled,_enableInside,_canCollapse,_runOnHover, false],
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

private _actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_Actions";

TRACE_1("Building ACE_Actions",_objectType);
private _actions = [_actionsCfg, 0] call _recurseFnc;

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
            [false,false,false,false,false]
        ],
        [children actions]
    ]
]
*/
