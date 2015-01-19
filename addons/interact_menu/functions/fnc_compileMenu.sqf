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
    private ["_actions", "_displayName", "_distance", "_icon", "_statement", "_condition", "_showDisabled",
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
            
            _condition = getText (_entryCfg >> "condition");
            
            _showDisabled = getNumber (_entryCfg >> "showDisabled");
            _enableInside = getNumber (_entryCfg >> "enableInside");
            
            _condition = compile _condition;
            // diag_log text format["_condition: %1", _condition];
            _children = [];
            if(isArray (_entryCfg >> "subMenu")) then {
                _subMenuDef = getArray (_entryCfg >> "subMenu");
                _childMenuName = _subMenuDef select 0;
                _childMenuCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_Actions" >> _childMenuName;
                _children = [_childMenuCfg] call _recurseFnc;
            };
            _entry = [
                        _displayName,
                        _icon,
                        [0,0,0],
                        _statement,
                        _condition,
                        _distance,
                        _children,
                        GVAR(uidCounter)
                    ];
            GVAR(uidCounter) = GVAR(uidCounter) + 1;        
            _actions pushBack _entry;
        };
    };
    _actions
};

_actions = [_actionsCfg] call _recurseFnc;

_actions = [[
    "TEST!",
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

_object setVariable [QUOTE(GVAR(actionData)), _actions];