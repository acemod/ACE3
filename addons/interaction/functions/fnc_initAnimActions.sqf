#include "..\script_component.hpp"
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

if (_class in GVAR(initializedAnimClasses)) exitWith {};

GVAR(initializedAnimClasses) set [_class, nil];

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_anim", "_phase", "_duration", "_text"];
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

            // If 1 object was spawned in, consider it a success
            private _success = false;

            if (_items isNotEqualTo []) then {
                if (_items isEqualType "") then {
                    _items = [_items];
                };

                private _weaponHolder = objNull;

                {
                    private _type = (_x call EFUNC(common,getItemType)) select 0;

                    if (_type == "") then {
                        private _emptyPosAGL = [];

                        // This covers testing vehicle stability and finding a safe position
                        for "_i" from 1 to 3 do {
                            _emptyPosAGL = [_target, _x, _player] call EFUNC(common,findUnloadPosition);

                            if (_emptyPosAGL isNotEqualTo []) exitWith {};
                        };

                        // If still no valid position, try the next item
                        if (_emptyPosAGL isEqualTo []) then {
                            [LELSTRING(common,NoRoomToUnload)] call EFUNC(common,displayTextStructured);

                            continue;
                        };

                        private _object = createVehicle [_x, _emptyPosAGL, [], 0, "CAN_COLLIDE"];

                        if (!isNull _object) then {
                            // Prevent items from taking damage when unloaded
                            [_object, "blockDamage", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
                            [EFUNC(common,statusEffect_set), [_object, "blockDamage", QUOTE(ADDON), false], 2] call CBA_fnc_waitAndExecute;

                            _success = true;
                        } else {
                            WARNING_1("Failed to create object of type '%1'",_x);
                        };

                        continue;
                    };

                    // Functions/code below are guaranteed to spawn in objects
                    _success = true;

                    // getItemType considers backpacks as weapons, so handle them first
                    if (getNumber (configFile >> "CfgVehicles" >> _x >> "isBackpack") == 1) then {
                        if (backpack _player == "") then {
                            _player addBackpackGlobal _x;
                        } else {
                            if (isNull _weaponHolder) then {
                                _weaponHolder = nearestObject [_player, "WeaponHolder"];

                                if (isNull _weaponHolder || {_player distance _weaponHolder > 2}) then {
                                    _weaponHolder = createVehicle ["GroundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
                                    _weaponHolder setPosASL getPosASL _player;
                                };
                            };

                            _weaponHolder addBackpackCargoGlobal [_x, 1];
                        };

                        continue;
                    };

                    switch (_type) do {
                        case "weapon": {
                            [_player, _x, true] call CBA_fnc_addWeapon;
                        };
                        case "item": {
                            [_player, _x, true] call CBA_fnc_addItem;
                        };
                        case "magazine": {
                            [_player, _x, -1, true] call CBA_fnc_addMagazine;
                        };
                    };
                } forEach _items;
            } else {
                [LELSTRING(common,disabled)] call EFUNC(common,displayTextStructured);
            };

            if (!_success) exitWith {};

            _target animate [_anim, _phase, true];
        },
        {},
        _text,
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

    _target animationPhase _anim != _phase
    && {[_player, _target, ["isNotSwimming"]] call EFUNC(common,canInteractWith)}
};

private _config = configOf _object;

{
    private _animConfig = _x;
    private _anim = configName _animConfig;

    private _animationSourcesConfig = _config >> "AnimationSources" >> _anim;

    if !(
        isClass _animationSourcesConfig // anim exist
        && {0 != [_animationSourcesConfig >> "scope", "NUMBER", 1] call CBA_fnc_getConfigEntry} // anim not hidden
        && {isNumber (_animationSourcesConfig >> "initPhase")} // anim correct (some CUP anims are inherited and cleared)
        && {0 != [_animConfig >> "enabled", "NUMBER", 1] call CBA_fnc_getConfigEntry} // anim enabled
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

    private _phase = [_animConfig >> "phase", "NUMBER", 1] call CBA_fnc_getConfigEntry;
    private _name = [_animConfig >> "name", "TEXT", localize "str_a3_cfgactions_unmountitem0"] call CBA_fnc_getConfigEntry;
    private _icon = [_animConfig >> "icon", "TEXT", "\A3\ui_f\data\igui\cfg\actions\take_ca.paa"] call CBA_fnc_getConfigEntry;
    private _duration = [_animConfig >> "duration", "NUMBER", 10] call CBA_fnc_getConfigEntry;
    private _text = getText (_animConfig >> "text");
    private _distance = [_animConfig >> "distance", "NUMBER", 2] call CBA_fnc_getConfigEntry;

    {
        private _action = [
            format [QGVAR(anim_%1_%2), _anim, _forEachIndex],
            _name,
            _icon,
            _statement,
            _condition,
            {},
            [_anim, _phase, _duration, _text],
            _x,
            _distance
        ] call EFUNC(interact_menu,createAction);
        [_class, 0, [], _action] call EFUNC(interact_menu,addActionToClass);
        TRACE_3("add anim",_class,_anim,_x);
    } forEach _positions;
} forEach configProperties [_config >> QGVAR(anims), "isClass _x"];
