/*
 * Author: Dystopian
 * Initializes animation based interactions.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_interaction_fnc_initAnimActions
 *
 * Public: No
 */
#include "script_component.hpp"

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_anim", "_phase", "_items", "_duration"];
    [
        _duration,
        [_target, _player, _anim, _phase, _items],
        {
            (_this select 0) params ["_target", "_player", "_anim", "_phase", "_items"];
            scopeName "main";
            if !(_items isEqualTo []) then {
                private _emptyPosAGL = [_target, _items select 0, _player] call EFUNC(common,findUnloadPosition);
                if (_emptyPosAGL isEqualTo []) then {
                    [localize ELSTRING(common,NoRoomToUnload)] call EFUNC(common,displayTextStructured);
                    breakOut "main";
                };
                {
                    (createVehicle [_x, _emptyPosAGL, [], 0, "NONE"]) setPosASL (AGLtoASL _emptyPosAGL);
                } forEach _items;
            };
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
    private _vehicleConfig = configFile >> "CfgVehicles" >> typeOf _target;
    private _animConfig = _vehicleConfig >> "AnimationSources" >> _anim;

    isClass _animConfig
    && {0 != [_animConfig >> "scope", "number", 1] call CBA_fnc_getConfigEntry}
    && {0 != [_vehicleConfig >> QGVAR(anims) >> _anim >> "enabled", "number", 1] call CBA_fnc_getConfigEntry}
    && {_target animationPhase _anim != _phase}
    && {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
};

{
    if (isClass (_x >> QGVAR(anims))) then {
        private _vehicleConfig = _x;
        private _vehicle = configName _vehicleConfig;
        {
            scopeName "animLoop";
            private _anim = configName _x;
            private _animConfigParent = inheritsFrom _vehicleConfig >> QGVAR(anims) >> _anim;
            if (
                !isClass _animConfigParent
                || {_x != _animConfigParent && {0 == [_animConfigParent >> "inherit", "number", 1] call CBA_fnc_getConfigEntry}}
            ) then {
                private _positions = [_x >> "position"] call BIS_fnc_getCfgData;
                if (isNil "_positions") then {
                    if ("" == getText (_x >> "selection")) then {
                        ERROR_2("No action position for vehicle %1 anim %2",_vehicle,_anim);
                        breakTo "animLoop";
                    } else {
                        _positions = [compile format [
                            QUOTE(_target selectionPosition getText (configFile >> 'CfgVehicles' >> typeOf _target >> QQGVAR(anims) >> '%1' >> 'selection')),
                            _anim
                        ]];
                    };
                } else {
                    if (_positions isEqualType "") then {
                        _positions = [compile format [
                            QUOTE(call compile getText (configFile >> 'CfgVehicles' >> typeOf _target >> QQGVAR(anims) >> '%1' >> 'position')),
                            _anim
                        ]];
                    };
                };

                private _phase = [_x >> "phase", "number", 1] call CBA_fnc_getConfigEntry;
                private _name = [_x >> "name", "text", localize "str_a3_cfgactions_unmountitem0"] call CBA_fnc_getConfigEntry;
                private _icon = [_x >> "icon", "text", "\A3\ui_f\data\igui\cfg\actions\take_ca.paa"] call CBA_fnc_getConfigEntry;
                private _items = [_x >> "item"] call BIS_fnc_getCfgData;
                if (isNil "_items") then {
                    _items = [];
                } else {
                    if (_items isEqualType "") then {_items = [_items]};
                };
                private _duration = [_x >> "duration", "number", 10] call CBA_fnc_getConfigEntry;
                private _inherit = 0 != [_x >> "inherit", "number", 1] call CBA_fnc_getConfigEntry;
                {
                    private _action = [
                        format ["%1%2", _anim, _forEachIndex],
                        _name, _icon, _statement, _condition, {},
                        [_anim, _phase, _items, _duration],
                        _x
                    ] call EFUNC(interact_menu,createAction);
                    [_vehicle, 0, [], _action, _inherit] call EFUNC(interact_menu,addActionToClass);
                    TRACE_3("",_vehicle,_anim,_x);
                } forEach _positions;
            };
        } forEach ('true' configClasses (_x >> QGVAR(anims)));
    };
} forEach ('true' configClasses (configFile >> "CfgVehicles"));
