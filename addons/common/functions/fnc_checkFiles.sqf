#include "script_component.hpp"
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
private _version = getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr");

//CBA Versioning check - close main display if using incompatible version
private _cbaVersionAr = getArray (configFile >> "CfgPatches" >> "cba_main" >> "versionAr");
private _cbaRequiredAr = getArray (configFile >> "CfgSettings" >> "CBA" >> "Versioning" >> "ACE" >> "dependencies" >> "CBA") select 1;

private _cbaVersionStr = _cbaVersionAr joinString ".";
private _cbaRequiredStr = _cbaRequiredAr joinString ".";

INFO_3("ACE is version %1 - CBA is version %2 (min required %3)",_version,_cbaVersionStr,_cbaRequiredStr);

if ([_cbaRequiredAr, _cbaVersionAr] call cba_versioning_fnc_version_compare) then {
    private _errorMsg = format ["CBA version %1 is outdated (required %2)", _cbaVersionStr, _cbaRequiredStr];
    ERROR(_errorMsg);
    if (hasInterface) then {
        ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
    };
};

//private _addons = activatedAddons; // broken with High-Command module, see #2134
private _addons = (cba_common_addons select {(_x select [0,4]) == "ace_"}) apply {toLower _x};

private _oldCompats = [];
{
    if (getText (configFile >> "CfgPatches" >> _x >> "versionStr") != _version) then {
        private _errorMsg = format ["File %1.pbo is outdated.", _x];

        ERROR(_errorMsg);

        if ((_x select [0, 10]) != "ace_compat") then {
            if (hasInterface) then {
                ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
            };
        } else {
            _oldCompats pushBack _x;  // Don't block game if it's just an old compat pbo
        };
    };
    false
} count _addons;
if (!(_oldCompats isEqualTo [])) then {
    [{
        // Lasts for ~10 seconds
        ERROR_WITH_TITLE_1("The following ACE compatiblity PBOs are outdated", "%1", _this);
    }, _oldCompats, 1] call CBA_fnc_waitAndExecute;
};

///////////////
// check extensions
///////////////
private _platform = toLower (productVersion select 6);
if (!isServer && {_platform in ["linux", "osx"]}) then {
    // Linux and OSX client ports do not support extensions at all
    INFO("Operating system does not support extensions");
} else {
    {
        private _extension = configName _x;
        private _isWindows = _platform == "windows" && {getNumber (_x >> "windows") == 1};
        private _isLinux = _platform == "linux" && {getNumber (_x >> "linux") == 1};
        private _isClient = hasInterface && {getNumber (_x >> "client") == 1};
        private _isServer = !hasInterface && {getNumber (_x >> "server") == 1};

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
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
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
// check server version/addons
///////////////
if (isMultiplayer) then {
    // don't check optional addons
    _addons = _addons select {getNumber (configFile >> "CfgPatches" >> _x >> "ACE_isOptional") != 1};

    if (isServer) then {
        // send servers version of ACE to all clients
        GVAR(ServerVersion) = _version;
        GVAR(ServerAddons) = _addons;
        publicVariable QGVAR(ServerVersion);
        publicVariable QGVAR(ServerAddons);
    } else {
        // clients have to wait for the variables
        [{
            if (isNil QGVAR(ServerVersion) || isNil QGVAR(ServerAddons)) exitWith {};

            (_this select 0) params ["_version", "_addons"];

            if (_version != GVAR(ServerVersion)) then {
                private _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), _version];

                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            _addons = _addons - GVAR(ServerAddons);
            if !(_addons isEqualTo []) then {
                private _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.",_addons];

                ERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;
        }, 1, [_version,_addons]] call CBA_fnc_addPerFrameHandler;
    };
};
