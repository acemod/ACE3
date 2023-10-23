#include "..\script_component.hpp"
/*
 * Author: commy2
 * Compares version numbers of PBOs and DLLs.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_common_fnc_checkFiles
 *
 * Public: No
 */

///////////////
// check addons
///////////////
private _mainCfg = configFile >> "CfgPatches" >> "ace_main";
private _mainVersion = getText (_mainCfg >> "versionStr");
private _mainSource = configSourceMod _mainCfg;

//CBA Versioning check - close main display if using incompatible version
private _cbaVersionAr = getArray (configFile >> "CfgPatches" >> "cba_main" >> "versionAr");
private _cbaRequiredAr = getArray (configFile >> "CfgSettings" >> "CBA" >> "Versioning" >> "ACE" >> "dependencies" >> "CBA") select 1;

private _cbaVersionStr = _cbaVersionAr joinString ".";
private _cbaRequiredStr = _cbaRequiredAr joinString ".";

INFO_3("ACE is version %1 - CBA is version %2 (min required %3)",_mainVersion,_cbaVersionStr,_cbaRequiredStr);

if ([_cbaRequiredAr, _cbaVersionAr] call cba_versioning_fnc_version_compare) then {
    private _errorMsg = format ["CBA version %1 is outdated (required %2)", _cbaVersionStr, _cbaRequiredStr];
    ERROR(_errorMsg);
    if (hasInterface) then {
        ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
    };
};

//private _addons = activatedAddons; // broken with High-Command module, see #2134
private _addons = (cba_common_addons select {(_x select [0,4]) == "ace_"}) apply {toLower _x};
private _oldAddons = [];
private _oldSources = [];
private _oldCompats = [];
{
    private _addonCfg = configFile >> "CfgPatches" >> _x;
    private _addonVersion = getText (_addonCfg >> "versionStr");
    if (_addonVersion != _mainVersion) then {
        private _addonSource = configSourceMod _addonCfg;
        _oldSources pushBackUnique _addonSource;
        call FUNC(checkFiles_diagnoseACE);

        if ((_x select [0, 10]) != "ace_compat") then {
            if (hasInterface) then {
                _oldAddons pushBack _x;
            };
        } else {
            _oldCompats pushBack [_x, _addonVersion];  // Don't block game if it's just an old compat pbo
        };
    };
} forEach _addons;

if (_oldAddons isNotEqualTo []) then {
    _oldAddons = _oldAddons apply {"%1.pbo", _x};
    private _errorMsg = "";
    if (count _oldAddons > 3) then {
        _errorMsg = format ["The following files are outdated: %1, and %2 more.<br/>ACE Main version is %3 from %4.<br/>Loaded mods with outdated ACE files: %5", (_oldAddons select [0, 3]) joinString ", ", (count _oldAddons) -3, _mainVersion, _mainSource, (_oldSources joinString ", ")];
    } else {
        _errorMsg = format ["The following files are outdated: %1.<br/>ACE Main version is %2 from %3.<br/>Loaded mods with outdated ACE files: %4", (_oldAddons) joinString ", ", _mainVersion, _mainSource, (_oldSources) joinString ", "];
    };
    if (hasInterface) then {
        ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
    };
    ERROR(_errorMsg);
};

if (_oldCompats isNotEqualTo []) then {
    _oldCompats = _oldCompats apply {format ["%1 (%2)", _x select 0, _x select 1]};
    [{
        // Lasts for ~10 seconds
        ERROR_WITH_TITLE_3("The following ACE compatiblity PBOs are outdated", "%1. ACE Main version is %2 from %3.",_this select 0,_this select 1,_this select 2);
    }, [_oldCompats, _mainVersion, _mainSource], 1] call CBA_fnc_waitAndExecute;
};

///////////////
// check server version/addons
///////////////
if (isMultiplayer) then {
    // don't check optional addons
    _addons = _addons select {getNumber (configFile >> "CfgPatches" >> _x >> "ACE_isOptional") != 1};

    if (isServer) then {
        // send servers version of ACE to all clients
        GVAR(ServerVersion) = _mainVersion;
        GVAR(ServerAddons) = _addons;
        publicVariable QGVAR(ServerVersion);
        publicVariable QGVAR(ServerAddons);
    } else {
        // clients have to wait for the variables
        [{
            if (isNil QGVAR(ServerVersion) || isNil QGVAR(ServerAddons)) exitWith {};

            (_this select 0) params ["_mainVersion", "_addons"];

            if (_mainVersion != GVAR(ServerVersion)) then {
                private _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), _mainVersion];

                call FUNC(checkFiles_diagnoseACE);
                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            _addons = _addons - GVAR(ServerAddons);
            if (_addons isNotEqualTo []) then {
                private _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.",_addons];

                call FUNC(checkFiles_diagnoseACE);
                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;
        }, 1, [_mainVersion,_addons]] call CBA_fnc_addPerFrameHandler;
    };
};
