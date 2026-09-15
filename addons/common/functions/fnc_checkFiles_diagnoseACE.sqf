#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Diagnoses ACE install problems, this will only be called if there is a known problem.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * ACE addons' WS IDs <HASHMAP>
 *
 * Example:
 * [] call ace_common_fnc_checkFiles_diagnoseACE
 *
 * Public: No
 */

// Only run once
if (missionNamespace getVariable [QGVAR(checkFiles_diagnoseACE), false]) exitWith {
    createHashMap // return
};

GVAR(checkFiles_diagnoseACE) = true;

private _addons = CBA_common_addons select {(_x select [0, 4]) == "ace_"};
private _cfgPatches = configFile >> "CfgPatches";
private _allMods = createHashMap;
private _getLoadedModsInfo = getLoadedModsInfo;

// Check if ACE_ADDONs are in expected mod DIR
{
    private _cfg = _cfgPatches >> _x;
    private _actualModDir = configSourceMod _cfg;
    private _expectedModDir = getText (_cfg >> "ACE_expectedModDir");

    if (_expectedModDir == "") then {
        _expectedModDir = "@ace";
    };

    private _expectedSteamID = getText (_cfg >> "ACE_expectedSteamID");

    if (_expectedSteamID == "") then {
        _expectedSteamID = "463939057"
    };

    (_allMods getOrDefault [_actualModDir, [], true]) pushBackUnique _expectedSteamID;

    if (_actualModDir != _expectedModDir) then {
        private _errorMsg = format ["%1 loading from unexpected modDir [%2]", _x, _actualModDir];
        systemChat _errorMsg;
        WARNING_1("%1",_errorMsg);
    };
} forEach _addons;

// Check if all ACE ModDirs have expected steam WS ID
{
    private _modDir = _x;

    if (count _y != 1) then {
        ERROR_2("Unexpected multiple steamIDs %1 - %2",_modDir,_y);
    };

    private _expectedSteamID = _y select 0;
    private _index = _getLoadedModsInfo findIf {_x select 1 == _modDir};
    (_getLoadedModsInfo param [_index, []]) params [["_modName", "$Error$"], "", "", "", "", "", "", ["_actualID", ""]];

    if (_actualID != _expectedSteamID) then {
        private _errorMsg = format ["%1 [%2] unexpected workshopID [%3]", _modDir, _modName, _actualID];
        systemChat _errorMsg;
        WARNING_1("%1",_errorMsg);
    };
} forEach _allMods;

_allMods // return
