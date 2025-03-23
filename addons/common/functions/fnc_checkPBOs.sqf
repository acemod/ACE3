#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43, Timi007
 * Used to execute the checkPBOs module without placing the module. Don't use this together with the module.
 * Checks PBO versions and compares to the one running on server.
 *
 * Arguments:
 * 0: Mode <NUMBER>
 *   0 = Warn once
 *   1 = Warn permanently
 *   2 = Kick
 * 1: Check all PBOs? <BOOL> (default: false)
 * 2: Whitelist as list of addons. Regex patterns can be used to match addons. Addon name will be matched case-insensitive by default. <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [0, true, "acex_headless,cba_.*"] call ace_common_fnc_checkPBOs
 *
 * Public: Yes
 */

params ["_mode", ["_checkAll", false], ["_whitelist", "", [""]]];
TRACE_3("params",_mode,_checkAll,_whitelist);

// Convert whitelist string into array of strings
_whitelist = _whitelist splitString "[,""']";
TRACE_1("whitelist",_whitelist);

ACE_Version_CheckAll = _checkAll;
ACE_Version_Whitelist = _whitelist;

// ACE is checked by FUNC(checkFiles)
if (!_checkAll) exitWith {};

if (!isServer) then {
    ["ace_versioning_clientCheckDone", {
        // Don't let this event get triggered again
        [_thisType, _thisId] call CBA_fnc_removeEventHandler;

        params ["_clientErrors"];
        _clientErrors params ["_missingAddonClient", "_additionalAddonClient", "_olderVersionClient", "_newerVersionClient"];
        _thisArgs params ["_mode"];

        // Display error message(s)
        if (_missingAddonClient || {_additionalAddonClient} || {_olderVersionClient} || {_newerVersionClient}) then {
            private _errorMsg = "[ACE] Version mismatch:<br/><br/>";
            private _error = [];

            if (_missingAddonClient) then {
                _errorMsg = _errorMsg + "Detected missing addon on client<br/>";
                _error pushBack "Missing file(s)";
            };

            if (_additionalAddonClient) then {
                _errorMsg = _errorMsg + "Detected additional addon on client<br/>";
                _error pushBack "Additional file(s)";
            };

            if (_olderVersionClient) then {
                _errorMsg = _errorMsg + "Detected older client version<br/>";
                _error pushBack "Older version";
            };

            if (_newerVersionClient) then {
                _errorMsg = _errorMsg + "Detected newer client version<br/>";
                _error pushBack "Newer version";
            };

            ERROR_2("[ACE] Version mismatch: %1: %2",profileName,_error joinString ", ");

            _errorMsg = parseText format ["<t align='center'>%1</t>", _errorMsg];

            // Warn
            if (_mode < 2) then {
                private _rscLayer = "ACE_RscErrorHint" call BIS_fnc_rscLayer;
                _rscLayer cutRsc ["ACE_RscErrorHint", "PLAIN", 0, true];

                (uiNamespace getVariable "ACE_ctrlErrorHint") ctrlSetStructuredText composeText [lineBreak, _errorMsg];

                if (_mode == 0) then {
                    [{
                        TRACE_2("Hiding Error message after 10 seconds",time,_this);
                        _this cutFadeOut 0.2;
                    }, _rscLayer, 10] call CBA_fnc_waitAndExecute;
                };
            } else {
                // Kick
                ["[ACE] ERROR", composeText [_errorMsg]] call FUNC(errorMessage);
            };
        };
    }, [_mode]] call CBA_fnc_addEventHandlerArgs;
};

// Check file version numbers
[_whitelist] call FUNC(checkVersionNumber);
