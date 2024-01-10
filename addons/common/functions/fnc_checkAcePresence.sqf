#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Used to check if ACE is loaded. If ACE is not present, an error message is shown.
 * This function is sent by the server to the client, client runs the function.
 *
 * Arguments:
 * 0: Unique name of the error message function sent by the server <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "ace_common_fnc_checkErrorMessage" call ace_common_fnc_checkAcePresence
 *
 * Public: No
 */

params ["_fncNameCheckErrorMessage"];

INFO("Checking for ACE presence");

private _cfgPatches = configFile >> "CfgPatches";

if (
    getText (_cfgPatches >> "ace_main" >> "versionStr") == "" ||
    {getText (_cfgPatches >> QUOTE(ADDON) >> "versionStr") == ""} ||
    {getArray (_cfgPatches >> "cba_main" >> "versionAr") isEqualTo []} ||
    {getArray (configFile >> "CfgSettings" >> "CBA" >> "Versioning" >> "ACE" >> "dependencies" >> "CBA") isEqualTo []}
) exitWith {
    INFO("ACE was not detected");

    ["[ACE] ERROR", "ACE is not present or outdated past version 3.X.X", _fncNameCheckErrorMessage] call (missionNamespace getVariable [_fncNameCheckErrorMessage, ""]);
};

INFO("ACE was detected");
