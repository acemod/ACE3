#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Reads gun list entries from the config and appends them to the gun list
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_read_gun_list_entries_from_config
 *
 * Public: No
 */

private _validate_preset = {
    private _valid = true;
    if (count _this != 20) then {
        private _errorMsg = format ["Invalid preset array size: %1", count _this];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 0 == "") then {
        ERROR("Invalid gun profile name");
        _valid = false;
    };
    if (count (_this select 0) > 14) then {
        WARNING("Gun profile name too long (max. allowed 14 characters)");
    };
    if (_this select 1 < 0 || _this select 1 > 1400) then {
        private _errorMsg = format ["Invalid muzzle velocity: %1", _this select 1];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 2 < 25 || _this select 2 > 1000) then {
        private _errorMsg = format ["Invalid zero range: %1", _this select 2];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 4 > 0) then {
        private _errorMsg = format ["Invalid airFriction value: %1", _this select 4];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 5 < 0.1 || _this select 5 > 10) then {
        private _errorMsg = format ["Invalid bore height value: %1", _this select 4];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 12 < 1 || _this select 12 > 100) then {
        private _errorMsg = format ["Invalid bullet weight: %1", _this select 12];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 13 < 1 || _this select 13 > 25) then {
        private _errorMsg = format ["Invalid bullet diameter: %1", _this select 13];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 14 < 1 || _this select 14 > 75) then {
        private _errorMsg = format ["Invalid rifle twist: %1", _this select 14];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 15 < 0.1 || _this select 15 > 2.0) then {
        private _errorMsg = format ["Invalid ballistic coefficient: %1", _this select 15];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (_this select 16 != 1) then {
        private _errorMsg = format ["Invalid drag model: %1", _this select 16];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (!((_this select 17) in ["ASM", "ICAO"])) then {
        private _errorMsg = format ["Invalid atmosphere model: %1", _this select 17];
        ERROR(_errorMsg);
        _valid = false;
    };
    if (count (_this select 18) != 7) then {
        private _errorMsg = format ["Invalid muzzle velocity table array size: %1", count (_this select 18)];
        ERROR(_errorMsg);
        _valid = false;
    } else {
        {
            if (count _x != 2) exitWith {
                private _errorMsg = format ["Invalid muzzle velocity table subarray size: %1", count _x];
                ERROR(_errorMsg);
                _valid = false;
            };
        } forEach (_this select 18);
    };
    if (count (_this select 19) != 7) then {
        private _errorMsg = format ["Invalid drag coefficient table array size: %1", count (_this select 19)];
        ERROR(_errorMsg);
        _valid = false;
    } else {
        {
            if (count _x != 2) exitWith {
                private _errorMsg = format ["Invalid drag coefficient table subarray size: %1", count _x];
                ERROR(_errorMsg);
                _valid = false;
            };
        } forEach (_this select 19);
    };
    _valid
};

{
    private _preset = _x >> "preset";

    if (isArray(_preset)) then {
        private _gun = getArray _preset;

        if (_gun call _validate_preset) then {
            _gun set [0, (_gun select 0) select [0, 14]];
            _gun set [20, false];
            GVAR(gunList) = GVAR(gunList) + [_gun];
        };
    };
} forEach ("true" configClasses (configFile >> "ACE_ATragMX_Presets"));
