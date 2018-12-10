#include "script_component.hpp"
/*
* Author: chris579, Salbei
* Gets the path to the ground texture under the object
*
* Arguments:
* 0: trench <OBJECT>
*
* Return Value:
* Surface path <STRING>
*
* Example:
* [TrenchObj] call ace_trenches_fnc_getSurfaceTexturePath
*
* Public: No
*/

params [
    ["_object", objnull, [objNull]]
];

if (isNull _object) exitWith {};
if !((isNil QGVAR(automaticFileSetup)) && (isText (configFile >> "CfgWorlds" >> worldName >> "surfaceTextureBasePath"))) exitWith {DEFAULT_TEXTURE};

private _surfaceType = surfaceType (position _object);

private _getTexturePath = {
    params["_surfaceType", "_basePath", "_filePrefix"];

    // remove leading #
    private _parsedSurfaceType = _surfaceType select [1, count _surfaceType];
    // check for overridden surface paths
    private _overrideCfg = configFile >> "CfgWorlds" >> worldName >> "Surfaces" >> _parsedSurfaceType >> "texturePath";
    if (isText (_overrideCfg)) exitWith {
        getText(_overrideCfg)
    };
    // get config file wildcard
    private _fileWildcard = getText(configfile >> "CfgSurfaces" >> _parsedSurfaceType >> "files");
    // remove * in file wildcard
    private _fileNameArr = _fileWildcard splitString "";
    if (_fileNameArr find "*" > -1) then {
        _fileNameArr deleteAt (_fileNameArr find "*");
    };

    format["%1\%2%3", _basePath, (_fileNameArr joinString ""), _filePrefix];
};

private _result = if !(isNil QGVAR(automaticFileSetup)) then {
   GVAR(automaticFileSetup) params ["_basePath", "_filePrefix"];

   [_surfaceType, _basePath, _filePrefix] call _getTexturePath;
} else {
   private _basePath = getText (configFile >> "CfgWorlds" >> "Altis" >> "surfaceTextureBasePath");
   if ((_surfaceType find "#Gdt" == -1) || {worldName == "Tanoa"}) then {
       _basePath = getText (configFile >> "CfgWorlds" >> worldName >> "surfaceTextureBasePath")
   };

   [_surfaceType, _basePath, getText(configFile >> "CfgWorlds" >> worldName >> "filePrefix")] call _getTexturePath;
};

_result
