#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43, Timi007
 * Compares version numbers from loaded addons.
 *
 * Arguments:
 * 0: Lowercase addon whitelist <ARRAY> (default: missionNamespace getVariable ["ACE_Version_Whitelist", []])
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
TRACE_1("",_whitelist);

// Skip A3, ACE, and whitelisted addons, because we have already done the check.
private _files = CBA_common_addons select {
    private _addon = _x;

    (_addon select [0, 3] != "a3_") &&
    {_addon select [0, 4] != "ace_"} &&
    {_addon select [0, 5] != "acex_"} &&
    {_addon select [0, 12] != "CuratorOnly_"} &&
    {_whitelist findIf {_addon regexMatch _x} == -1}
};

private _cfgPatches = configFile >> "CfgPatches";
private _versions = [];

{
    // Determine the version of the addon. Parse it into a floating point number for comparison. Only major and minor are used.
    // If no version is found or a parsing error occurs, the version is zero.
    private _addonCfgPatches = _cfgPatches >> _x;
    private _versionCfg = _addonCfgPatches >> "version";
    private _version = switch (true) do {
        // Normal case. Version is defined as a floating point number -> MAJOR.MINOR
        case (isNumber _versionCfg): {
            getNumber _versionCfg
        };
        // Addon Builder converts the version into a string if it is an invalid float -> "MAJOR.MINOR.PATCH"
        case (isText _versionCfg): {
            (getText _versionCfg splitString ".") params [["_major", "0"], ["_minor", "0"]];

            parseNumber _major + parseNumber _minor / 100
        };
        // Fallback 1 (maybe versionAr is defined)
        case (isArray (_addonCfgPatches >> "versionAr")): {
            (getArray (_addonCfgPatches >> "versionAr")) params [["_major", 0], ["_minor", 0]];

            _major + _minor / 100
        };
        // Fallback 2 (maybe versionStr is defined)
        case (isText (_addonCfgPatches >> "versionStr")): {
            (getText (_addonCfgPatches >> "versionStr") splitString ".") params [["_major", "0"], ["_minor", "0"]];

            parseNumber _major + parseNumber _minor / 100
        };
        // No version found
        default { 0 };
    };

    _versions pushBack _version;
} forEach _files;

TRACE_2("Filtered files and versions",_files,_versions);

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

    {
        private _serverVersion = _serverVersions select _forEachIndex;

        private _index = _files find _x;

        if (_index == -1) then {
            if (_x != "ace_server") then {
                _missingAddonsClient pushBack _x;
            };
        } else {
            private _clientVersion = _versions select _index;

            if (_clientVersion < _serverVersion) then {
                _olderVersionsClient pushBack [_x, _clientVersion, _serverVersion];
            };

            if (_clientVersion > _serverVersion) then {
                _newerVersionsClient pushBack [_x, _clientVersion, _serverVersion];
            };
        };
    } forEach _serverFiles;

    // Find client files which the server doesn't have
    private _additionalAddonsClient = _files select {!(_x in _serverFiles)};

    // Check for client missing addons, server missing addons, client outdated addons and server outdated addons
    private _clientErrors = [];

    #define DISPLAY_NUMBER_ADDONS (10 + 1) // +1 to account for header

    {
        _x params ["_items", "_string"];

        // Check if something is either missing or outdated
        private _isMissingItems = _items isNotEqualTo [];

        if (_isMissingItems) then {
            // Generate error message
            private _errorLog = +_items;
            private _header = format [LLSTRING(isMissingItems), _client, _string];

            // Don't display all missing items, as they are logged
            private _errorMsg = _header + ((_errorLog select [0, DISPLAY_NUMBER_ADDONS]) joinString ", ");
            _errorLog = _header + (_errorLog joinString ", ");

            private _count = count _items;

            if (_count > DISPLAY_NUMBER_ADDONS) then {
                _errorMsg = _errorMsg + format [LLSTRING(andMore), _count - DISPLAY_NUMBER_ADDONS];
            };

            // Wait until in briefing screen
            [{
                getClientStateNumber >= 9 // "BRIEFING SHOWN"
            }, {
                params ["_errorLog", "_errorMsg"];

                // Log and display error messages
                diag_log text _errorLog;
                [QGVAR(serverLog), _errorLog] call CBA_fnc_serverEvent;
                [QGVAR(systemChatGlobal), _errorMsg] call CBA_fnc_globalEvent;

                // Wait until after map screen
                [{
                    !isNull (call BIS_fnc_displayMission)
                }, {
                    params ["_errorMsg", "_timeOut"];

                    // If the briefing screen was shown for less than 5 seconds, display the error message again, but locally
                    if (_timeOut < CBA_missionTime) exitWith {};

                    // Make sure systemChat is ready by waiting a bit
                    [{
                        systemChat _this;
                    }, _errorMsg, 1] call CBA_fnc_waitAndExecute;
                }, [_errorMsg, CBA_missionTime + 5]] call CBA_fnc_waitUntilAndExecute;
            }, [_errorLog, _errorMsg]] call CBA_fnc_waitUntilAndExecute;
        };

        _clientErrors pushBack _isMissingItems;
    } forEach [
        [_missingAddonsClient, LLSTRING(clientMissing)],
        [_additionalAddonsClient, LLSTRING(clientAdditional)],
        [_olderVersionsClient, LLSTRING(olderClient)],
        [_newerVersionsClient, LLSTRING(newerClient)]
    ];

    TRACE_4("",_missingAddonsClient,_additionalAddonsClient,_olderVersionsClient,_newerVersionsClient);

    ACE_Version_ClientErrors = _clientErrors;

    // Raise event when done
    ["ace_versioning_clientCheckDone", [+ACE_Version_ClientErrors]] call CBA_fnc_localEvent;
};

// Wait for server to send the servers files and version numbers
if (isNil "ACE_Version_ServerVersions") then {
    "ACE_Version_ServerVersions" addPublicVariableEventHandler _fnc_check;
} else {
    call _fnc_check;
};
