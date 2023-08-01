#include "script_component.hpp"
/*
 * Author: commy2, johnb43
 * Compares version numbers from loaded addons.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _whitelist = missionNamespace getVariable ["ACE_Version_Whitelist", []];

private _files = CBA_common_addons select {
    (_x select [0, 3] != "a3_") &&
    {_x select [0, 4] != "ace_"} &&
    {!((toLower _x) in _whitelist)}
};

private _cfgPatches = configFile >> "CfgPatches";
private _version = -1;
private _versions = [];

{
    (getText (_cfgPatches >> _x >> "version") splitString ".") params [["_major", "0"], ["_minor", "0"]];
    _version = parseNumber _major + parseNumber _minor / 100;
    _versions pushBack _version;
} forEach _files;

if (isServer) exitWith {
    ACE_Version_ServerVersions = [_files, _versions];
    publicVariable "ACE_Version_ServerVersions";

    // Raise event when done
    ["ace_versioning_serverCheckDone", [+ACE_Version_ServerVersions]] call CBA_fnc_localEvent;
};

// Begin client version check
ACE_Version_ClientVersions = [_files, _versions];

private _fnc_check = {
    ACE_Version_ClientVersions params [["_files", []], ["_versions", []]];
    ACE_Version_ServerVersions params [["_serverFiles", []], ["_serverVersions", []]];

    // Compare client and server files and versions
    private _client = profileName;
    private _missingAddons = [];
    private _oldVersionsClient = [];
    private _oldVersionsServer = [];

    private _clientVersion = -1;
    private _serverVersion = -1;
    private _index = -1;

    {
        _serverVersion = _serverVersions select _forEachIndex;

        _index = _files find _x;

        if (_index == -1) then {
            if (_x != "ace_server") then {
                _missingAddons pushBack _x;
            };
        } else {
            _clientVersion = _versions select _index;

            if (_clientVersion < _serverVersion) then {
                _oldVersionsClient pushBack [_x, _clientVersion, _serverVersion];
            };

            if (_clientVersion > _serverVersion) then {
                _oldVersionsServer pushBack [_x, _clientVersion, _serverVersion];
            };
        };
    } forEach _serverFiles;

    // Find client files which the server doesn't have
    private _missingAddonsServer = [];

    {
        if ((_serverFiles find _x) == -1) then {
            _missingAddonsServer pushBack _x;
        };
    } forEach _files;

    // Client missing addon
    private _missingAddon = _missingAddons isNotEqualTo [];

    if (_missingAddon) then {
        private _error = [format ["[ACE] %1: ERROR client missing addon(s): ", _client]];
        private _cutComma = true;

        {
            if (_forEachIndex >= 11) exitWith {
                _error pushBack format ["and %1 more.", (count _missingAddons) - 11];
                _cutComma = false;
            };

            _error pushBack format ["%1, ", _x];
        } forEach _missingAddons;

        _error = _error joinString "";

        // Remove last comma and whitespace
        if (_cutComma) then {
            _error = _error select [0, count _error - 2];
        };

        // Display and log error messages
        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    // Server missing addon
    private _missingAddonServer = _missingAddonsServer isNotEqualTo [];

    if (_missingAddonServer) then {
        private _error = [format ["[ACE] %1: ERROR server missing addon(s): ", _client]];
        private _cutComma = true;

        {
            if (_forEachIndex >= 11) exitWith {
                _error pushBack format ["and %1 more.", (count _missingAddonsServer) - 11];
                _cutComma = false;
            };

            _error pushBack format ["%1, ", _x];
        } forEach _missingAddonsServer;

        _error = _error joinString "";

        // Remove last comma and whitespace
        if (_cutComma) then {
            _error = _error select [0, count _error - 2];
        };

        // Display and log error messages
        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    // Client outdated addon
    private _oldVersionClient = _oldVersionsClient isNotEqualTo [];

    if (_oldVersionClient) then {
        private _error = [format ["[ACE] %1: ERROR outdated client addon(s): ", _client]];
        private _cutComma = true;

        {
            if (_forEachIndex >= 11) exitWith {
                _error pushBack format ["and %1 more.", (count _oldVersionsClient) - 11];
                _cutComma = false;
            };

            _error pushBack format ["%1 (client: %2, server: %3), ", _x select 0, _x select 1, _x select 2];
        } forEach _oldVersionsClient;

        _error = _error joinString "";

        // Remove last comma and whitespace
        if (_cutComma) then {
            _error = _error select [0, count _error - 2];
        };

        // Display and log error messages
        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    // Server outdated addon
    private _oldVersionServer = _oldVersionsServer isNotEqualTo [];

    if (_oldVersionServer) then {
        private _error = [format ["[ACE] %1: ERROR outdated server addon(s): ", _client]];
        private _cutComma = true;

        {
            if (_forEachIndex >= 11) exitWith {
                _error pushBack format ["and %1 more.", (count _oldVersionsServer) - 11];
                _cutComma = false;
            };

            _error pushBack format ["%1 (client: %2, server: %3), ", _x select 0, _x select 1, _x select 2];
        } forEach _oldVersionsServer;

        _error = _error joinString "";

        // Remove last comma and whitespace
        if (_cutComma) then {
            _error = _error select [0, count _error - 2];
        };

        // Display and log error messages
        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    ACE_Version_ClientErrors = [_missingAddon, _missingAddonServer, _oldVersionClient, _oldVersionServer];

    // Raise event when done
    ["ace_versioning_clientCheckDone", [+ACE_Version_ClientErrors]] call CBA_fnc_localEvent;
};

// Wait for server to send the servers files and version numbers
if (isNil "ACE_Version_ServerVersions") then {
    ACE_Version_ServerVersions addPublicVariableEventHandler _fnc_check;
} else {
    call _fnc_check;
};
