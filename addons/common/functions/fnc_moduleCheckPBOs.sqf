/*
 * Author: KoffeinFlummi
 *
 * Initializes the check-PBOs module.
 *
 * Arguments:
 * Whatever the module provides. (I dunno.)
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

private["_activated", "_checkAll", "_ctrlHint", "_error", "_logic", "_missingAddon", "_missingAddonServer", "_mode", "_oldVersionClient", "_oldVersionServer", "_rscLayer", "_text", "_units", "_whitelist"];

_logic = _this select 0;
_units = _this select 1;
_activated = _this select 2;

if !(_activated) exitWith {};

_mode = parseNumber (_logic getVariable "Action");
_checkAll = _logic getVariable ["CheckAll", false];
_whitelist = call compile (_logic getVariable ["Whitelist", "[]"]);

if (isNil "_whitelist") then {
    _whitelist = [];
};

_whitelist = [_whitelist, {toLower _this}] call FUNC(map);

ACE_Version_CheckAll = _checkAll;
ACE_Version_Whitelist = _whitelist;

if (!isServer) then {
    [_mode, _checkAll, _whitelist] spawn {
        _mode = _this select 0;
        _checkAll = _this select 1;
        _whitelist = _this select 2;

        waitUntil {
            sleep 1;
            !isNil "ACE_Version_ClientErrors"
        };

        _missingAddon = ACE_Version_ClientErrors select 0;
        _missingAddonServer = ACE_Version_ClientErrors select 1;
        _oldVersionClient = ACE_Version_ClientErrors select 2;
        _oldVersionServer = ACE_Version_ClientErrors select 3;

        // Display error message.
        if (_missingAddon || {_missingAddonServer} || {_oldVersionClient} || {_oldVersionServer}) then {
            _text = "[ACE] Version mismatch:<br/><br/>";
            _error = format ["ACE version mismatch: %1: ", profileName];

            if (_missingAddon) then {
                _text = _text + "Detected missing addon on client<br/>";
                _error = _error + "Missing file(s); ";
            };
            if (_missingAddonServer) then {
                _text = _text + "Detected missing addon on server<br/>";
                _error = _error + "Additional file(s); ";
            };
            if (_oldVersionClient) then {
                _text = _text + "Detected old client version<br/>";
                _error = _error + "Older version; ";
            };
            if (_oldVersionServer) then {
                _text = _text + "Detected old server version<br/>";
                _error = _error + "Newer version; ";
            };

            //[_error, "{systemChat _this}"] call FUNC(execRemoteFnc);
            diag_log text _error;

            _text = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _text]];

            _rscLayer = "ACE_RscErrorHint" call BIS_fnc_rscLayer;
            _rscLayer cutRsc ["ACE_RscErrorHint", "PLAIN", 0, true];

            disableSerialization;
            _ctrlHint = uiNamespace getVariable "ACE_ctrlErrorHint";
            _ctrlHint ctrlSetStructuredText _text;

            if (_mode == 0) then {
                sleep 10;
                _rscLayer cutFadeOut 0.2;
            };

            if (_mode == 2) then {
                sleep 10;
                waitUntil {alive player};
                [player] call FUNC(adminKick);
            };
        };
    };
};

diag_log text format ["[ACE]: Check-PBOs Module Initialized. Mode: %1.", _mode];

if (_checkAll) then {
    0 spawn COMPILE_FILE(scripts\Version\checkVersionNumber);
};
