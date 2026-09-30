#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Called on object init; checks config if LWS enabled and sets up vehicle for it
 *
 * Arguments:
 * 0: Object to check <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [MyCar] call ace_laser_warning_fnc_initialiseObject;
 *
 * Public: No
 */
params ["_object"];

private _fnc_getConfigPosition = {
    params ["_object", "_config"];
    private _offset = [0, 0, 0];
    if (isText _config) then {
        _offset = _object selectionPosition getText _config
    };
    if (isArray _config) then {
        _offset = getArray _config;
    };
    _offset
};

private _config = configOf _object;
(GVAR(initialisedObjects) getOrDefaultCall [
    _config,
    {
        TRACE_1("Initialising",_config);
        private _config = _config >> QUOTE(ADDON);
        private _state = [
            [0, 0, 0],                                  // Detection position offset
            0,                                          // Detection Radius
            false call FUNC(default_boxState),          // Box settings
            false call FUNC(default_soundState),        // Audio
            false call FUNC(default_hunterKillerState)  // Hunter Killer
        ];
        if (isNull _config) exitWith {
            TRACE_3("",_config,false,_state);
            [false, _state]
        };
        private _enabled = 1 == getNumber (_config >> "enabled");
        private _detectorPosition = [_object, _config >> "position"] call _fnc_getConfigPosition;
        private _detectorRadius = getNumber (_config >> "detectionRadius");

        _state set [0, _detectorPosition];
        _state set [1, _detectorRadius];

        if (_enabled) then {
            for "_i" from 0 to count (_config >> "components") do {
                private _component = (_config >> "components") select _i;
                switch (configName _component) do {
                    case "audio": {
                        private _offset = [_object, _component >> "speakerSelection"] call _fnc_getConfigPosition;
                        private _onlyCrew = 1 == getNumber (_component >> "crewOnly");
                        private _soundState = false call FUNC(default_soundState);
                        _soundState set [0, true];
                        _soundState set [1, _offset];
                        _soundState set [2, _onlyCrew];
                        TRACE_1("has audio",_soundState);
                        _state set [3, _soundState];
                    };
                    case "hunter_killer_slew": {
                        private _automatic = 1 == getNumber (_component >> "allowAutomatic");
                        private _hkState = false call FUNC(default_hunterKillerState);
                        _hkState set [0, ["ace_hunterkiller"] call EFUNC(common,isModLoaded)];
                        _hkState set [1, _automatic];
                        TRACE_1("has hk",_hkState);
                        _state set [4, _hkState];
                    };
                    default {
                        TRACE_2("Unknown Component",_config,_component);
                    };
                }
            };
        };
        TRACE_3("",_config,_enabled,_state);
        [_enabled, _state]
    },
    true
]) params ["_enabled", "_lwsState"];

if (_enabled) then {
    _object setVariable [QGVAR(detectionParameters), [_lwsState select 0, _lwsState select 1], true];
    _object setVariable [QGVAR(state_box), _lwsState select 2, true];
    _object setVariable [QGVAR(state_audio), _lwsState select 3, true];
    _object setVariable [QGVAR(state_hunterKiller), _lwsState select 4, true];
    _object setVariable [QGVAR(enabled), _enabled, true];

    GVAR(objects) pushBack _object;
};