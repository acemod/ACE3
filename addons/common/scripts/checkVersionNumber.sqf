// by commy2
#include "script_component.hpp"

private _aceWhitelist = missionNamespace getVariable ["ACE_Version_Whitelist", []];
private _files = CBA_common_addons select {
    (_x select [0,3] != "a3_") &&
    {_x select [0,4] != "ace_"} &&
    {!((toLower _x) in _aceWhitelist)}
};

private _versions = [];
{
    getText (configFile >> "CfgPatches" >> _x >> "version") splitString "." params [["_major", "0"], ["_minor", "0"]];
    private _version = parseNumber _major + parseNumber _minor/100;
    _versions set [_forEachIndex, _version];
} forEach _files;

if (isServer) then {
    ACE_Version_ServerVersions = [_files, _versions];
    publicVariable "ACE_Version_ServerVersions";
} else {
    ACE_Version_ClientVersions = [_files, _versions];
};

// Begin client version check
if (!isServer) then {
    // Wait for server to send the servers files and version numbers
    waitUntil {
        sleep 1;
        !isNil "ACE_Version_ClientVersions" && {!isNil "ACE_Version_ServerVersions"}
    };

    private _client = profileName;

    _files = ACE_Version_ClientVersions select 0;
    _versions = ACE_Version_ClientVersions select 1;

    private _serverFiles = ACE_Version_ServerVersions select 0;
    private _serverVersions = ACE_Version_ServerVersions select 1;

    // Compare client and server files and versions
    private _missingAddons = [];
    private _oldVersionsClient = [];
    private _oldVersionsServer = [];
    {
        private _serverVersion = _serverVersions select _forEachIndex;

        private _index = _files find _x;
        if (_index == -1) then {
                if (_x != "ace_server") then {_missingAddons pushBack _x;};
        } else {

            private _clientVersion = _versions select _index;

            if (_clientVersion < _serverVersion) then {
                _oldVersionsClient pushBack [_x, _clientVersion, _serverVersion];
            };

            if (_clientVersion > _serverVersion) then {
                _oldVersionsServer pushBack [_x, _clientVersion, _serverVersion];
            };
        };
    } forEach _serverFiles;

    // find client files which the server doesn't have
    private _missingAddonsServer = [];
    {
        private _index = _serverFiles find _x;
        if (_index == -1) then {
            _missingAddonsServer pushBack _x;
        }
    } forEach _files;

    // display and log error messages
    private _fnc_cutComma = {
        private _string = _this;
        _string = toArray _string;

        private _count = count _string;
        _string set [_count - 2, toArray "." select 0];
        _string set [_count - 1, -1];
        _string = _string - [-1];

        toString _string;
    };

    private _missingAddon = false;
    if (count _missingAddons > 0) then {
        _missingAddon = true;

        private _error = format ["[ACE] %1: ERROR client missing addon(s): ", _client];
        {
            _error = _error + format ["%1, ", _x];

            if (_forEachIndex > 9) exitWith {};
        } forEach _missingAddons;

        _error = _error call _fnc_cutComma;

        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    private _missingAddonServer = false;
    if (count _missingAddonsServer > 0) then {
        _missingAddonServer = true;

        private _error = format ["[ACE] %1: ERROR server missing addon(s): ", _client];
        {
            _error = _error + format ["%1, ", _x];

            if (_forEachIndex > 9) exitWith {};
        } forEach _missingAddonsServer;

        _error = _error call _fnc_cutComma;

        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    private _oldVersionClient = false;
    if (count _oldVersionsClient > 0) then {
        _oldVersionClient = true;

        private _error = format ["[ACE] %1: ERROR outdated client addon(s): ", _client];
        {
            _error = _error + format ["%1 (client: %2, server: %3), ", _x select 0, _x select 1, _x select 2];

            if (_forEachIndex > 9) exitWith {};
        } forEach _oldVersionsClient;

        _error = _error call _fnc_cutComma;

        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    private _oldVersionServer = false;
    if (count _oldVersionsServer > 0) then {
        _oldVersionServer = true;

        private _error = format ["[ACE] %1: ERROR outdated server addon(s): ", _client];
        {
            _error = _error + format ["%1 (client: %2, server: %3), ", _x select 0, _x select 1, _x select 2];

            if (_forEachIndex > 9) exitWith {};
        } forEach _oldVersionsServer;

        _error = _error call _fnc_cutComma;

        diag_log text _error;
        [QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;
        [QGVAR(serverLog), _error] call CBA_fnc_serverEvent;
    };

    ACE_Version_ClientErrors = [_missingAddon, _missingAddonServer, _oldVersionClient, _oldVersionServer];
};
