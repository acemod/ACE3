//fnc_compileMenu.sqf
#include "script_component.hpp";
// diag_log text format["COMPILE ACTIONS: %1", _this];

_object = _this select 0;
_objectType = typeOf _object;


/*
displayName = "$STR_ACE_Interaction_TeamManagement";
distance = 4;
condition = QUOTE(alive _target && {!isPlayer _target} && {_target in units group _player} && {GVAR(EnableTeamManagement)});
statement = "";
showDisabled = 0;
priority = 3.2;
icon = PATHTOF(UI\team\team_management_ca.paa);
subMenu[] = {"ACE_TeamManagement", 0};
hotkey = "M";
enableInside = 1;
*/

/*
[
    [
        "Launch",
        "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa",
        [0,0,0],
        { (_this select 0) setVelocity [0,0,10]; },
        { true },
        1,
        []
    ]
]
*/

_actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_Actions";


_recurseFnc = {
    private ["_actions", "_displayName", "_distance", "_icon", "_statement", "_selection", "_condition", "_showDisabled",
            "_enableInside", "_children", "_entry", "_actionsCfg"];
    _actions = [];
    _actionsCfg = _this select 0;
    for "_i" from 0 to (count _actionsCfg)-1 do {
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

            _showDisabled = getNumber (_entryCfg >> "showDisabled");
            _enableInside = getNumber (_entryCfg >> "enableInside");

            _condition = compile _condition;
            _children = [_entryCfg] call _recurseFnc;
            _entry = [
                        _displayName,
                        _icon,
                        _selection,
                        _statement,
                        _condition,
                        _distance,
                        _children,
                        GVAR(uidCounter)
                    ];
            diag_log _entry;
            GVAR(uidCounter) = GVAR(uidCounter) + 1;
            _actions pushBack _entry;
        };
    };
    _actions
};

_actions = [_actionsCfg] call _recurseFnc;
//diag_log _actions;
// Backward-compat, filter only base actions that have a selection
private ["_newActions","_oldActions","_selection"];
_filteredActions = [];
{
    _selection = _x select 2;
    if (typeName _selection == "STRING") then {
        _filteredActions pushBack _x;
    };
} forEach _actions;

/*
_actions = [[
    "Interactions",
    "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa",
    "Spine3",
    { true },
    { true },
    5,
    _actions,
    GVAR(uidCounter)
]
];
GVAR(uidCounter) = GVAR(uidCounter) + 1;
*/
_object setVariable [QUOTE(GVAR(actionData)), _filteredActions];