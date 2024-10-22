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

// Don't execute in scheduled environment
if (canSuspend) exitWith {
    [FUNC(checkFiles), nil] call CBA_fnc_directCall;
};

///////////////
// Check addons
///////////////
private _cfgPatches = configFile >> "CfgPatches";
private _mainVersion = getText (_cfgPatches >> "ace_main" >> "versionStr");
private _mainSource = configSourceMod (_cfgPatches >> "ace_main");

// CBA Versioning check - close main display if using incompatible version
private _cbaVersionAr = getArray (_cfgPatches >> "cba_main" >> "versionAr");
private _cbaRequiredAr = getArray (configFile >> "CfgSettings" >> "CBA" >> "Versioning" >> "ACE" >> "dependencies" >> "CBA") select 1;

private _cbaVersionStr = _cbaVersionAr joinString ".";
private _cbaRequiredStr = _cbaRequiredAr joinString ".";

INFO_3("ACE is version %1 - CBA is version %2 (min required %3)",_mainVersion,_cbaVersionStr,_cbaRequiredStr);

if ([_cbaRequiredAr, _cbaVersionAr] call CBA_versioning_fnc_version_compare) then {
    private _errorMsg = format ["CBA version %1 is outdated (required %2)", _cbaVersionStr, _cbaRequiredStr];
    ERROR(_errorMsg);

    if (hasInterface) then {
        ["[ACE] ERROR", _errorMsg] call FUNC(errorMessage);
    };
};

//private _addons = activatedAddons; // Broken with High-Command module, see #2134
private _addons = (CBA_common_addons select {(_x select [0, 4]) == "ace_"}) apply {toLowerANSI _x};

private _oldAddons = [];
private _oldSources = [];
private _oldCompats = [];

{
    private _addonCfg = configFile >> "CfgPatches" >> _x;
    private _addonVersion = getText (_addonCfg >> "versionStr");

    if (_addonVersion != _mainVersion) then {
        private _addonSource = configSourceMod _addonCfg;

        _oldSources pushBackUnique _addonSource;

        // Check ACE install
        call FUNC(checkFiles_diagnoseACE);

        // Don't block game if it's just an old compat pbo
        if ((_x select [0, 10]) != "ace_compat") then {
            _oldAddons pushBack _x;
        } else {
            _oldCompats pushBack [_x, _addonVersion];
        };
    };
} forEach _addons;

if (_oldAddons isNotEqualTo []) then {
    _oldAddons = _oldAddons apply {format ["%1.pbo", _x]};
    private _extraSources = _oldSources select {_x != _mainSource};
    private _allSources = [_mainSource] + _extraSources;

    private _errorMsg = if (count _oldAddons > 3) then {
        format ["The following files are outdated: %1, and %2 more.<br/>ACE Main version is %3 from %4.<br/><br/>All mods with ACE files: %5", (_oldAddons select [0, 3]) joinString ", ", (count _oldAddons) - 3, _mainVersion, _mainSource, _allSources joinString ", "];
    } else {
        format ["The following files are outdated: %1.<br/>ACE Main version is %2 from %3.<br/><br/>All mods with ACE files: %4", _oldAddons joinString ", ", _mainVersion, _mainSource, _allSources joinString ", "];
    };
    if (_extraSources isNotEqualTo []) then {
        _errorMsg = _errorMsg + "<br/><br/>Reason: Conflicting ACE installations (see list above).<br/><br/>Fix: Make sure to only load one version of ACE.";
    } else {
        _errorMsg = _errorMsg + "<br/><br/>Reason: Mismatched addon versions within the same installation, it is likely corrupted.<br/><br/>Fix: Repair ACE or update your repack.";
    };

    if (hasInterface) then {
        ["[ACE] ERROR", _errorMsg] call FUNC(errorMessage);
    };

    ERROR(_errorMsg);
};

if (_oldCompats isNotEqualTo []) then {
    _oldCompats = _oldCompats apply {format ["%1 (%2)", _x select 0, _x select 1]};

    [{
        // Lasts for ~10 seconds
        ERROR_WITH_TITLE_3("The following ACE compatiblity PBOs are outdated","%1. ACE Main version is %2 from %3.",_this select 0,_this select 1,_this select 2);
    }, [_oldCompats, _mainVersion, _mainSource], 1] call CBA_fnc_waitAndExecute;
};

///////////////
// Check extensions
///////////////
private _platform = toLowerANSI (productVersion select 6);

if (_platform in ["linux", "osx"]) then {
    // Linux and OSX client ports do not support extensions at all
    if (hasInterface) then {
        WARNING("Operating system does not support extensions");
    } else {
        INFO("Operating system does not support extensions");
    };
} else {
    ("ace" callExtension ["version", []]) params [["_versionEx", "", [""]], ["_returnCode", -1, [-1]]];

    if (_returnCode != 0 || {_versionEx == ""}) then {
        private _errorMsg = format ["Extension not found. [Return Code: %1]", _returnCode];
        ERROR(_errorMsg);

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg] call FUNC(errorMessage);
        };
    } else {
        _versionEx = _versionEx select [0, 8]; // git hash
        INFO_1("Extension [Version: %1]",_versionEx);
    };
};


///////////////
// Check server version/addons
///////////////
if (isMultiplayer) then {
    // Don't check optional addons
    _addons = _addons select {getNumber (_cfgPatches >> _x >> "ACE_isOptional") != 1};

    if (isServer) then {
        // Send server's version of ACE to all clients
        GVAR(serverVersion) = _mainVersion;
        GVAR(serverAddons) = _addons;
        GVAR(serverSource) = _mainSource;

        publicVariable QGVAR(serverVersion);
        publicVariable QGVAR(serverAddons);
        publicVariable QGVAR(serverSource);
    } else {
        GVAR(clientVersion) = _mainVersion;
        GVAR(clientAddons) = _addons;

        private _fnc_check = {
            if (GVAR(clientVersion) != GVAR(serverVersion)) then {
                private _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.<br/>Server modDir: %3<br/><br/>Reason: Either client or server is outdated.<br/><br/>Fix: Make sure versions and distribution of both match.", GVAR(serverVersion), GVAR(clientVersion), GVAR(serverSource)];

                // Check ACE install
                call FUNC(checkFiles_diagnoseACE);

                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg] call FUNC(errorMessage);
                };
            };

            private _addons = GVAR(clientAddons) - GVAR(serverAddons);

            if (_addons isNotEqualTo []) then {
                private _errorMsg = if (count _addons > 3) then {
                    format ["Client/Server Addon Mismatch. Client has additional addons: %1, and %2 more.<br/>Server modDir: %3", (_addons select [0, 3]) joinString ", ", (count _addons) - 3, GVAR(serverSource)];
                } else {
                    format ["Client/Server Addon Mismatch. Client has additional addons: %1.<br/>Server modDir: %2", _addons joinString ", ", GVAR(serverSource)];
                };
                private _additionalCompats = _addons select {(_x select [0, 10]) == "ace_compat"};
                private _additionalComponents = _addons - _additionalCompats;
                if (_additionalCompats isNotEqualTo []) then { // CDLC/content mod is loaded when it shouldn't be
                    private _loadedModsInfo = getLoadedModsInfo;
                    private _defaultModDirs = [_mainSource] + (_loadedModsInfo select {_x select 2} apply {_x select 1});
                    private _additionalMods = [];
                    { // O(n^fuckyou) loop. If you hit this then you're not going to play anyway. Suffer the stutter. Fix your mods. Stop using HostHavoc.
                        {
                            private _sourceModDir = configSourceMod (_cfgPatches >> _x);
                            if !(_sourceModDir in _defaultModDirs) then {
                                _additionalMods pushBackUnique (_loadedModsInfo select {_x select 1 == _sourceModDir} select 0 select 0);
                            };
                        } forEach (getArray (_cfgPatches >> _x >> "requiredAddons"));
                    } forEach _additionalCompats;
                    _errorMsg = _errorMsg + format ["<br/><br/>Additional compatibility is being loaded for: %1", _additionalMods joinString ", "];
                    _errorMsg = _errorMsg + "<br/><br/>Reason: Client has extra mods requiring compats loaded (see list above).<br/><br/>Fix: Make sure your mod list matches. Check your server files if you're the administrator.";
                } else { // Different ACE installation
                    _errorMsg = _errorMsg + "<br/><br/>Reason: Client and Server have different ACE distributions.<br/><br/>Fix: Make sure you're using the same distribution.";
                };

                // Check ACE install
                call FUNC(checkFiles_diagnoseACE);

                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg] call FUNC(errorMessage);
                };
            };
        };

        // Clients have to wait for the variables
        if (isNil QGVAR(serverVersion) || isNil QGVAR(serverAddons)) then {
            GVAR(serverVersion) addPublicVariableEventHandler _fnc_check;
        } else {
            call _fnc_check;
        };
    };
};
