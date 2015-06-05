/*
 * Author: commy2
 * Used to execute the checkPBOs module without placing the module. Don't use this together with the module.
 * Checks PBO versions and compares to the one running on server.
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *   0:  Warn once
 *   1:  Warn permanently
 *   2:  Kick
 * 1: Check all PBOs? <BOOL> (Optional - default: "[]")
 * 2: Whitelist <STRING> (Optinal - default: false)
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

private ["_mode", "_checkAll", "_whitelist"];

_mode = _this select 0;
_checkAll = if (count _this > 1) then {_this select 1} else {false};
_whitelist = if (count _this > 2) then {_this select 2} else {"[]"};

_whitelist = [_whitelist, {toLower _this}] call FUNC(map);

ACE_Version_CheckAll = _checkAll;
ACE_Version_Whitelist = _whitelist;

if (!isServer) then {
    [_mode, _checkAll, _whitelist] spawn {
        private ["_missingAddon", "_missingAddonServer", "_oldVersionClient", "_oldVersionServer", "_text", "_error", "_rscLayer", "_ctrlHint"];
        PARAMS_3(_mode,_checkAll,_whitelist);

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

if (_checkAll) then {
    0 spawn COMPILE_FILE(scripts\Version\checkVersionNumber);
};
