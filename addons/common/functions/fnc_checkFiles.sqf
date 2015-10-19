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
 * Public: No
 */
#include "script_component.hpp"

///////////////
// check addons
///////////////
private "_version";
_version = getText (configFile >> "CfgPatches" >> "ace_main" >> "versionStr");

ACE_LOGINFO_1("ACE is version %1.",_version);

private "_addons";
//_addons = activatedAddons; // broken with High-Command module, see #2134
_addons = "true" configClasses (configFile >> "CfgPatches");//
_addons = [_addons, {toLower configName _this}] call FUNC(map);//
_addons = [_addons, {_this find "ace_" == 0}] call FUNC(filter);

{
    if (getText (configFile >> "CfgPatches" >> _x >> "versionStr") != _version) then {
        private "_errorMsg";
        _errorMsg = format ["File %1.pbo is outdated.", _x];

        ACE_LOGERROR(_errorMsg);

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    };
    false
} count _addons;

///////////////
// check dlls
///////////////
{
    private "_versionEx";
    _versionEx = _x callExtension "version";

    if (_versionEx == "") then {
        private "_errorMsg";
        _errorMsg = format ["Extension %1.dll not installed.", _x];

        ACE_LOGERROR(_errorMsg);

        if (hasInterface) then {
            ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    } else {
        // Print the current extension version
        ACE_LOGINFO_2("Extension version: %1: %2",_x,_versionEx);
    };
    false
} count getArray (configFile >> "ACE_Extensions" >> "extensions");

///////////////
// check server version/addons
///////////////
if (isMultiplayer) then {
    // don't check optional addons
    _addons = [_addons, {getNumber (configFile >> "CfgPatches" >> _this >> "ACE_isOptional") != 1}] call FUNC(filter);

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
                private "_errorMsg";
                _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), _version];

                ACE_LOGERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            _addons = _addons - GVAR(ServerAddons);
            if !(_addons isEqualTo []) then {
                _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.",_addons];

                ACE_LOGERROR(_errorMsg);

                if (hasInterface) then {
                    ["[ACE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            [_this select 1] call CBA_fnc_removePerFrameHandler;
        }, 1, [_version,_addons]] call CBA_fnc_addPerFrameHandler;
    };
};
