/*
 * Author: commy2
 *
 * Compares version numbers of PBOs and DLLs.
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

///////////////
// check addons
///////////////
private ["_version", "_addons"];
_version = getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr");

diag_log text format ["[ACE]: ACE is version %1.", _version];

_addons = activatedAddons;
_addons = [_addons, {_this find "ace_" == 0}] call FUNC(filter);

{
    if (getText (configFile >> "CfgPatches" >> _x >> "versionStr") != _version) then {
        private "_errorMsg";
        _errorMsg = format ["File %1.pbo is outdated.", _x];

        diag_log text format ["[ACE] ERROR: %1", _errorMsg];

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    };
} count _addons;

///////////////
// check dlls
///////////////
{
    private "version";
    _version = _x callExtension "version";
    if (_version == "") then {
        private "_errorMsg";
        _errorMsg = format ["Extension %1.dll not installed.", _x];

        diag_log text format ["[ACE] ERROR: %1", _errorMsg];

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    } else {
        // Print the current extension version
        diag_log text format ["[ACE] Extension version: %1: %2", _x, _version];
    };
} count getArray (configFile >> "ACE_Extensions" >> "extensions");

///////////////
// check server version/addons
///////////////
if (isMultiplayer) then {
    if (isServer) then {
        // send servers version of ACE to all clients
        GVAR(ServerVersion) = _version;
        GVAR(ServerAddons) = _addons;
        publicVariable QGVAR(ServerVersion);
        publicVariable QGVAR(ServerAddons);
    } else {
        // clients have to wait for the variables
        [{
            if (isNil QGVAR(ServerVersion) || isNil QGVAR(ServerAddons)) exitWith {};

            private "_errorMsg";
            params ["_args", "_idPFH"];
            _args params ["_version","_addons"];

            if (_version != GVAR(ServerVersion)) then {
                _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), _version];

                diag_log text format ["[ACE] ERROR: %1", _errorMsg];

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            _addons = _addons - GVAR(ServerAddons);
            if !(_addons isEqualTo []) then {
                _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.",_addons];

                diag_log text format ["[ACE] ERROR: %1", _errorMsg];

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            [_idPFH] call CBA_fnc_removePerFrameHandler;
        }, 1, [_version,_addons]] call CBA_fnc_addPerFrameHandler;
    };
};
