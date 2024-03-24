#include "..\script_component.hpp"
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
 * Example:
 * call ace_common_fnc_checkVersionNumber
 *
 * Public: No
 */

// Don't execute in scheduled environment
if (canSuspend) exitWith {
    [FUNC(checkVersionNumber), _this] call CBA_fnc_directCall;
};

params [["_whitelist", missionNamespace getVariable ["ACE_Version_Whitelist", []]]];

private _files = CBA_common_addons select {
    (_x select [0, 3] != "a3_") &&
    {_x select [0, 4] != "ace_"} &&
    {!((toLowerANSI _x) in _whitelist)}
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
    private _missingAddonsClient = [];
    private _olderVersionsClient = [];
    private _newerVersionsClient = [];

    private _clientVersion = -1;
    private _serverVersion = -1;
    private _index = -1;

    {
        _serverVersion = _serverVersions select _forEachIndex;

        _index = _files find _x;

        if (_index == -1) then {
            if (_x != "ace_server") then {
                _missingAddonsClient pushBack _x;
            };
        } else {
            _clientVersion = _versions select _index;

            if (_clientVersion < _serverVersion) then {
                _olderVersionsClient pushBack [_x, _clientVersion, _serverVersion];
            };

            if (_clientVersion > _serverVersion) then {
                _newerVersionsClient pushBack [_x, _clientVersion, _serverVersion];
            };
        };
    } forEach _serverFiles;

    // Find client files which the server doesn't have
    private _additionalAddonsClient = [];

    {
        if ((_serverFiles find _x) == -1) then {
            _additionalAddonsClient pushBack _x;
        };
    } forEach _files;


    // Check for client missing addons, server missing addons, client outdated addons and server outdated addons
    private _clientErrors = [];
    private _errorLog = [];
    private _errorMsg = "";
    private _count = 0;

    #define DISPLAY_NUMBER_ADDONS (10 + 1) // +1 to account for header
    {
        _x params ["_items", "_string"];

        // Check if something is either missing or outdated
        private _isMissingItems = _items isNotEqualTo [];

        if (_isMissingItems) then {
            // Generate error message
            _errorLog = [format ["[ACE] %1: ERROR %2 addon(s): ", _client, _string]];

            _errorLog append _items;

            // Don't display all missing items, as they are logged
            _errorMsg = (_errorLog select [0, DISPLAY_NUMBER_ADDONS]) joinString ", ";
            _errorLog = _errorLog joinString ", ";

            _count = count _items;

            if (_count > DISPLAY_NUMBER_ADDONS) then {
                _errorMsg = _errorMsg + format [", and %1 more.", _count - DISPLAY_NUMBER_ADDONS];
            };

            // Log and display error messages
            diag_log text _errorLog;
            [QGVAR(serverLog), _errorLog] call CBA_fnc_serverEvent;
            [QGVAR(systemChatGlobal), _errorMsg] call CBA_fnc_globalEvent;
        };

        _clientErrors pushBack _isMissingItems;
    } forEach [
        [_missingAddonsClient, "client missing"],
        [_additionalAddonsClient, "client additional"],
        [_olderVersionsClient, "older client"],
        [_newerVersionsClient, "newer client"]
    ];

    TRACE_4("",_missingAddonsClient,_additionalAddonsClient,_olderVersionsClient,_newerVersionsClient);

    ACE_Version_ClientErrors = _clientErrors;

    // Raise event when done
    ["ace_versioning_clientCheckDone", [+ACE_Version_ClientErrors]] call CBA_fnc_localEvent;
};

// Wait for server to send the servers files and version numbers
if (isNil "ACE_Version_ServerVersions") then {
    ACE_Version_ServerVersions addPublicVariableEventHandler _fnc_check;
} else {
    call _fnc_check;
};