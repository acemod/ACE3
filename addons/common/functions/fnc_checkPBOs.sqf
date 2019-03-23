#include "script_component.hpp"
/*
 * Author: commy2
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

//lowercase and convert whiteList String into array of strings:
_whitelist = toLower _whitelist;
_whitelist = _whitelist splitString "[,""']";
TRACE_1("Array",_whitelist);

ACE_Version_CheckAll = _checkAll;
ACE_Version_Whitelist = _whitelist;

if (!_checkAll) exitWith {}; //ACE is checked by FUNC(checkFiles)

if (!isServer) then {
    [{
        if (isNil "ACE_Version_ClientErrors") exitWith {};

        ACE_Version_ClientErrors params ["_missingAddon", "_missingAddonServer", "_oldVersionClient", "_oldVersionServer"];

        (_this select 0) params ["_mode", "_checkAll", "_whitelist"];

        // Display error message.
        if (_missingAddon || {_missingAddonServer} || {_oldVersionClient} || {_oldVersionServer}) then {
            private _text = "[ACE] Version mismatch:<br/><br/>";
            private _error = format ["ACE version mismatch: %1: ", profileName];

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

            //[QGVAR(systemChatGlobal), _error] call CBA_fnc_globalEvent;

            ERROR(_error);

            if (_mode < 2) then {
                _text = composeText [lineBreak, parseText format ["<t align='center'>%1</t>", _text]];

                private _rscLayer = "ACE_RscErrorHint" call BIS_fnc_rscLayer;
                _rscLayer cutRsc ["ACE_RscErrorHint", "PLAIN", 0, true];

                disableSerialization;
                private _ctrlHint = uiNamespace getVariable "ACE_ctrlErrorHint";
                _ctrlHint ctrlSetStructuredText _text;

                if (_mode == 0) then {
                    [{
                        params ["_rscLayer"];
                        TRACE_2("Hiding Error message after 10 seconds",time,_rscLayer);
                        _rscLayer cutFadeOut 0.2;
                    }, [_rscLayer], 10] call CBA_fnc_waitAndExecute;
                };
            };

            if (_mode == 2) then {
                [{alive player}, { // To be able to show list if using checkAll
                    params ["_text"];
                    TRACE_2("Player is alive, showing msg and exiting",time,_text);
                    _text = composeText [parseText format ["<t align='center'>%1</t>", _text]];
                    ["[ACE] ERROR", _text, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                }, [_text]] call CBA_fnc_waitUntilAndExecute;
            };
        };

        [_this select 1] call CBA_fnc_removePerFrameHandler;
    }, 1, [_mode, _checkAll, _whitelist]] call CBA_fnc_addPerFrameHandler;
};

if (_checkAll) then {
    0 spawn COMPILE_FILE(scripts\checkVersionNumber); // @todo
};
