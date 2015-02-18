//fnc_compileMenuSelfAction.sqf
#include "script_component.hpp";
// diag_log text format["COMPILE ACTIONS: %1", _this];

_object = _this select 0;
_objectType = typeOf _object;


/*
displayName = "$STR_ACE_Hearing_Earbuds_On";
condition = QUOTE( !([_player] call FUNC(hasEarPlugsIn)) && {'ACE_EarBuds' in items _player} );
statement = QUOTE( [_player] call FUNC(putInEarPlugs) );
showDisabled = 0;
priority = 2.5;
icon = PATHTOF(UI\ACE_earplugs_x_ca.paa);
hotkey = "E";
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

_actionsCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_SelfActions";


_recurseFnc = {
    private ["_actions", "_displayName", "_distance", "_icon", "_statement", "_condition", "_showDisabled",
            "_enableInside", "_children", "_entry", "_actionsCfg"];
    _actions = [];
    _actionsCfg = _this select 0;
    for "_i" from 0 to (count _actionsCfg)-1 do {
        _entryCfg = _actionsCfg select _i;
        if(isClass _entryCfg) then {
            _displayName = getText (_entryCfg >> "displayName");
            _icon = getText (_entryCfg >> "icon");
            _statement = compile (getText (_entryCfg >> "statement"));

            _condition = getText (_entryCfg >> "condition");
            if (_condition == "") then {_condition = "true"};

            // Add canInteract (including exceptions) and canInteractWith to condition
            _condition = _condition + format [QUOTE( && {%1 call EGVAR(common,canInteract)} && {[ARR_2(ACE_player, _target)] call EFUNC(common,canInteractWith)} ), getArray (_entryCfg >> "exceptions")];

            _showDisabled = getNumber (_entryCfg >> "showDisabled");
            _enableInside = getNumber (_entryCfg >> "enableInside");

            _condition = compile _condition;
            // diag_log text format["_condition: %1", _condition];
            _children = [];
            if(isArray (_entryCfg >> "subMenu")) then {
                _subMenuDef = getArray (_entryCfg >> "subMenu");
                _childMenuName = _subMenuDef select 0;
                _childMenuCfg = configFile >> "CfgVehicles" >> _objectType >> "ACE_SelfActions" >> _childMenuName;
                _children = [_childMenuCfg] call _recurseFnc;
            };
            _entry = [
                        _displayName,
                        _icon,
                        [0,0,0],
                        _statement,
                        _condition,
                        3, //distace
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
    "Self Actions",
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

_object setVariable [QUOTE(GVAR(selfActionData)), _actions];
