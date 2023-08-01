#include "script_component.hpp"
/*
 * Author: commy2, johnb43
 * Used to execute the checkPBOs module without placing the module. Don't use this together with the module.
 * Checks PBO versions and compares to the one running on server.
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *   0 = Warn once
 *   1 = Warn permanently
 *   2 = Kick
 * 1: Check all PBOs? (default: false) <BOOL>
 * 2: Whitelist (default: "") <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, false, ""] call ace_common_fnc_checkPBOs
 *
 * Public: Yes
 */

params ["_mode", ["_checkAll", false], ["_whitelist", "", [""]]];
TRACE_3("params",_mode,_checkAll,_whitelist);

// Lowercase and convert whiteList string into array of strings:
_whitelist = toLower _whitelist;
_whitelist = _whitelist splitString "[,""']";
TRACE_1("Array",_whitelist);

ACE_Version_CheckAll = _checkAll;
ACE_Version_Whitelist = _whitelist;

// ACE is checked by FUNC(checkFiles)
if (!_checkAll) exitWith {};

if (!isServer) then {
    ["ace_versioning_clientCheckDone", {
        // Don't let this event get triggered again
        [_thisType, _thisId] call CBA_fnc_removeEventHandler;

        params ["_clientErrors"];
        _clientErrors params ["_missingAddon", "_missingAddonServer", "_oldVersionClient", "_oldVersionServer"];
        _thisArgs params ["_mode"];

        // Display error message(s)
        if (_missingAddon || {_missingAddonServer} || {_oldVersionClient} || {_oldVersionServer}) then {
            private _errorMsg = "[ACE] Version mismatch:<br/><br/>";
            private _error = format ["ACE version mismatch: %1: ", profileName];

            if (_missingAddon) then {
                _errorMsg = _errorMsg + "Detected missing addon on client<br/>";
                _error = _error + "Missing file(s); ";
            };

            if (_missingAddonServer) then {
                _errorMsg = _errorMsg + "Detected missing addon on server<br/>";
                _error = _error + "Additional file(s); ";
            };

            if (_oldVersionClient) then {
                _errorMsg = _errorMsg + "Detected old client version<br/>";
                _error = _error + "Older version; ";
            };

            if (_oldVersionServer) then {
                _errorMsg = _errorMsg + "Detected old server version<br/>";
                _error = _error + "Newer version; ";
            };

            ERROR(_error);

            // Warn
            if (_mode < 2) then {
                _errorMsg = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _errorMsg]];

                private _rscLayer = "ACE_RscErrorHint" call BIS_fnc_rscLayer;
                _rscLayer cutRsc ["ACE_RscErrorHint", "PLAIN", 0, true];

                disableSerialization;

                private _ctrlHint = uiNamespace getVariable "ACE_ctrlErrorHint";
                _ctrlHint ctrlSetStructuredText _errorMsg;

                if (_mode == 0) then {
                    [{
                        TRACE_2("Hiding Error message after 10 seconds",time,_this);
                        _this cutFadeOut 0.2;
                    }, _rscLayer, 10] call CBA_fnc_waitAndExecute;
                };
            } else {
                // Kick
                [{alive player}, {
                    TRACE_2("Player is alive, showing msg and exiting",time,_this);
                    private _errorMsg = composeText [parseText format ["<t align='center'>%1</t>", _this]];
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}, {findDisplay 46 closeDisplay 0}, nil, [true, false]] call FUNC(errorMessage);
                }, _errorMsg] call CBA_fnc_waitUntilAndExecute;
            };
        };
    }, [_mode]] call CBA_fnc_addEventHandlerArgs;
};

// Check file version numbers
[_whitelist] call FUNC(checkVersionNumber);
