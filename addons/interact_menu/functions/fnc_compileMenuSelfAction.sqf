/*
 * Author: NouberNou and CAA-Picard
 * Compile the self action menu from config for a given object.
 *
 * Argument:
 * 0: Object <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp";

EXPLODE_1_PVT(_this,_object);

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

private ["_objectType","_recurseFnc","_actions"];
_objectType = typeOf _object;
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
            _children = [_entryCfg] call _recurseFnc;
            _entry = [
                        _displayName,
                        _icon,
                        [0,0,0],
                        _statement,
                        _condition,
                        10, //distace
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

// Create a master action to base on self action
_actions = [[
    "Self Actions",
    "\a3\ui_f\data\IGUI\Cfg\Actions\eject_ca.paa",
    "Spine3",
    { true },
    { true },
    10,
    _actions,
    GVAR(uidCounter)
]
];
GVAR(uidCounter) = GVAR(uidCounter) + 1;

_object setVariable [QUOTE(GVAR(selfActionData)), _actions];
