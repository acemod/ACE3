/*
 * Author: commy2
 *
 * Compares version numbers of PBOs and DLLs.
 *
 * Argument:
 * 0: Mode (Number)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

///////////////
// check addons
///////////////
private "_version";
_version = getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr");

diag_log text format ["[ACE]: ACE is version %1", _version]; ///////////////////////////////////////////////////////////////////////////

private ["_addons", "_index"];

_addons = activatedAddons;

// speed up search. all ace pbos are loaded after ace_main.
_index = _addons find "ace_main";
reverse _addons; 
_addons resize (count _addons - _index);
_addons = [_addons, {_this find "ace_" == 0}] call FUNC(filter);

{
    if (getText (configFile >> "CfgPatches" >> _x >> "versionStr") != _version) then {
        private "_errorMsg";
        _errorMsg = format ["File %1.pbo is outdated.", _x];

        diag_log text format ["[ACE] ERROR: %1", _errorMsg];

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    };
} forEach _addons;

///////////////
// check dlls
///////////////
{
    if (_x callExtension "version" == "") then {
        private "_errorMsg";
        _errorMsg = format ["Extension %1.dll not installed.", _x];

        diag_log text format ["[ACE] ERROR: %1", _errorMsg];

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    };
} forEach getArray (configFile >> "ACE_Extensions" >> "extensions");
