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
        ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}, {findDisplay 46 closeDisplay 0}, nil, [true, false]] call FUNC(errorMessage);
    };
};

//private _addons = activatedAddons; // Broken with High-Command module, see #2134
private _addons = (CBA_common_addons select {(_x select [0, 4]) == "ace_"}) apply {toLower _x};

private _addonCfg = configNull;
private _addonVersion = "";
private _addonSource = "";

private _oldAddons = [];
private _oldSources = [];
private _oldCompats = [];

{
    _addonCfg = configFile >> "CfgPatches" >> _x;
    _addonVersion = getText (_addonCfg >> "versionStr");

    if (_addonVersion != _mainVersion) then {
        _addonSource = configSourceMod _addonCfg;

        _oldSources pushBackUnique _addonSource;

        // Check ACE install
        call FUNC(checkFiles_diagnoseACE);

        if ((_x select [0, 10]) != "ace_compat") then {
            _oldAddons pushBack _x;
        } else {
            _oldCompats pushBack [_x, _addonVersion];  // Don't block game if it's just an old compat pbo
        };
    };
} forEach _addons;

if (_oldAddons isNotEqualTo []) then {
    _oldAddons = _oldAddons apply {"%1.pbo", _x};

    private _errorMsg = if (count _oldAddons > 3) then {
        format ["The following files are outdated: %1, and %2 more.<br/>ACE Main version is %3 from %4.<br/>Loaded mods with outdated ACE files: %5", (_oldAddons select [0, 3]) joinString ", ", (count _oldAddons) - 3, _mainVersion, _mainSource, _oldSources joinString ", "];
    } else {
        format ["The following files are outdated: %1.<br/>ACE Main version is %2 from %3.<br/>Loaded mods with outdated ACE files: %4", _oldAddons joinString ", ", _mainVersion, _mainSource, _oldSources joinString ", "];
    };

    if (hasInterface) then {
        ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}, {findDisplay 46 closeDisplay 0}, nil, [true, false]] call FUNC(errorMessage);
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
// Check extensions
///////////////
private _platform = toLower (productVersion select 6);

if (!isServer && {_platform in ["linux", "osx"]}) then {
    // Linux and OSX client ports do not support extensions at all
    INFO("Operating system does not support extensions");
} else {
    private _extension = "";
    private _isWindows = false;
    private _isLinux = false;
    private _isClient = false;
    private _isServer = false;

    {
        _extension = configName _x;
        _isWindows = _platform == "windows" && {getNumber (_x >> "windows") == 1};
        _isLinux = _platform == "linux" && {getNumber (_x >> "linux") == 1};
        _isClient = hasInterface && {getNumber (_x >> "client") == 1};
        _isServer = !hasInterface && {getNumber (_x >> "server") == 1};

        if ((_isWindows || _isLinux) && {_isClient || _isServer}) then {
            private _versionEx = _extension callExtension "version";

            if (_versionEx == "") then {
                private _extensionFile = _extension;

                if (productVersion select 7 == "x64") then {
                    _extensionFile = format ["%1_x64", _extensionFile];
                };

                private _platformExt = [".dll", ".so"] select (_platform == "linux");
                _extensionFile = format ["%1%2", _extensionFile, _platformExt];

                private _errorMsg = format ["Extension %1 not found.", _extensionFile];
                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}, {findDisplay 46 closeDisplay 0}, nil, [true, false]] call FUNC(errorMessage);
                };
            } else {
                // Print the current extension version
                INFO_2("Extension version: %1: %2",_extension,_versionEx);
            };
        };
    } forEach ("true" configClasses (configFile >> "ACE_Extensions"));
};

if (isArray (configFile >> "ACE_Extensions" >> "extensions")) then {
    WARNING("extensions[] array no longer supported");
};

///////////////
// Check server version/addons
///////////////
if (isMultiplayer) then {
    // Don't check optional addons
    _addons = _addons select {getNumber (_cfgPatches >> _x >> "ACE_isOptional") != 1};

    if (isServer) then {
        // Send server's version of ACE to all clients
        GVAR(ServerVersion) = _mainVersion;
        GVAR(ServerAddons) = _addons;
        publicVariable QGVAR(ServerVersion);
        publicVariable QGVAR(ServerAddons);
    } else {
        GVAR(ClientVersion) = _version;
        GVAR(ClientAddons) = _addons;

        private _fnc_check = {
            if (GVAR(ClientVersion) != GVAR(ServerVersion)) then {
                private _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), GVAR(ClientVersion)];

                // Check ACE install
                call FUNC(checkFiles_diagnoseACE);
                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}, {findDisplay 46 closeDisplay 0}, nil, [true, false]] call FUNC(errorMessage);
                };
            };

            private _addons = GVAR(ClientAddons) - GVAR(ServerAddons);

            if (_addons isNotEqualTo []) then {
                private _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.", _addons];

                // Check ACE install
                call FUNC(checkFiles_diagnoseACE);
                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}, {findDisplay 46 closeDisplay 0}, nil, [true, false]] call FUNC(errorMessage);
                };
            };
        };

        // Clients have to wait for the variables
        if (isNil QGVAR(ServerVersion) || isNil QGVAR(ServerAddons)) then {
            GVAR(ServerVersion) addPublicVariableEventHandler _fnc_check;
        } else {
            call _fnc_check;
        };
    };
};
