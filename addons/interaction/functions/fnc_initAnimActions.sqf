#include "script_component.hpp"
/*
 * Author: Dystopian
 * Initializes object interactions based on animations.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_interaction_fnc_initAnimActions
 *
 * Public: No
 */

params ["_object"];

private _class = typeOf _object;
if (!GVAR(enableAnimActions) || {_class in GVAR(initializedAnimClasses)}) exitWith {};
GVAR(initializedAnimClasses) pushBack _class;

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_anim", "_phase", "_duration"];
    TRACE_5("statement",_target,_player,_anim,_phase,_duration);
    [
        _duration,
        [_target, _player, _anim, _phase],
        {
            (_this select 0) params ["_target", "_player", "_anim", "_phase"];
            private _items = _target getVariable [
                format [QGVAR(animsItems_%1), _anim],
                getArray (configOf _target >> QGVAR(anims) >> _anim >> "items")
            ];
            private _success = true;
            if (_items isNotEqualTo []) then {
                if (_items isEqualType "") then {_items = [_items]};
                private _emptyPosAGL = [_target, _items select 0, _player] call EFUNC(common,findUnloadPosition);
                if (_emptyPosAGL isEqualTo []) exitWith {
                    [LELSTRING(common,NoRoomToUnload)] call EFUNC(common,displayTextStructured);
                    _success = false;
                };
                private ["_weaponHolder"];
                {
                    switch true do {
                        case (1 == getNumber (configFile >> "CfgVehicles" >> _x >> "isBackpack")): {
                            if (isNil "_weaponHolder") then {
                                _weaponHolder = createVehicle ["GroundWeaponHolder", _emptyPosAGL, [], 0, "CAN_COLLIDE"];
                            };
                            _weaponHolder addBackpackCargoGlobal [_x, 1];
                        };
                        case (getNumber (configfile >> "CfgWeapons" >> _x >> "type") in [TYPE_BINOCULAR_AND_NVG, TYPE_ITEM]): {
                            if (isNil "_weaponHolder") then {
                                _weaponHolder = createVehicle ["GroundWeaponHolder", _emptyPosAGL, [], 0, "CAN_COLLIDE"];
                            };
                            _weaponHolder addItemCargoGlobal [_x, 1];
                        };
                        default {
                            createVehicle [_x, _emptyPosAGL];
                        };
                    };
                } forEach _items;
            };
            if (!_success) exitWith {};
            _target animate [_anim, _phase, true];
        },
        {},
        nil,
        {
            (_this select 0) params ["_target", "", "_anim", "_phase"];
            _target animationPhase _anim != _phase
        },
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
};

private _condition = {
    params ["_target", "_player", "_params"];
    _params params ["_anim", "_phase"];

    GVAR(enableAnimActions)
    && {_target animationPhase _anim != _phase}
    && {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
};

private _config = configOf _object;

{
    private _animConfig = _x;
    private _anim = configName _animConfig;

    private _animationSourcesConfig = _config >> "AnimationSources" >> _anim;

    if !(
        isClass _animationSourcesConfig // anim exist
        && {0 != [_animationSourcesConfig >> "scope", "number", 1] call CBA_fnc_getConfigEntry} // anim not hidden
        && {isNumber (_animationSourcesConfig >> "initPhase")} // anim correct (some CUP anims are inherited and cleared)
        && {0 != [_animConfig >> "enabled", "number", 1] call CBA_fnc_getConfigEntry} // anim enabled
    ) then {continue};

    private _positions = [];
    {
        if (_x isEqualType "") then {
            _positions pushBack compile _x;
        } else {
            _positions pushBack _x;
        };
    } forEach getArray (_animConfig >> "positions");

    _positions append getArray (_animConfig >> "selections");

    if (_positions isEqualTo []) then {
        ERROR_2("No action position for _class %1 anim %2",_class,_anim);
        continue;
    };

    private _phase = [_animConfig >> "phase", "number", 1] call CBA_fnc_getConfigEntry;
    private _name = [_animConfig >> "name", "text", localize "str_a3_cfgactions_unmountitem0"] call CBA_fnc_getConfigEntry;
    private _icon = [_animConfig >> "icon", "text", "\A3\ui_f\data\igui\cfg\actions\take_ca.paa"] call CBA_fnc_getConfigEntry;
    private _duration = [_animConfig >> "duration", "number", 10] call CBA_fnc_getConfigEntry;
    {
        private _action = [
            format [QGVAR(anim_%1_%2), _anim, _forEachIndex],
            _name, _icon, _statement, _condition, {},
            [_anim, _phase, _duration],
            _x
        ] call EFUNC(interact_menu,createAction);
        [_class, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
        TRACE_3("add anim",_class,_anim,_x);
    } forEach _positions;
} forEach configProperties [_config >> QGVAR(anims), "isClass _x"];
