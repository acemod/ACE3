#include "script_component.hpp"
/*
* Author: chris579, Salbei
* Gets the path to the ground texture under the object.
*
* Arguments:
* 0: Trench <OBJECT>
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
if !((isNil QGVAR(automaticFileSetup)) && {isText (configFile >> "CfgWorldTexture" >> worldName >> "surfaceTextureBasePath")}) exitWith {DEFAULT_TEXTURE};

private _surfaceType = surfaceType (position _object);

private _getTexturePath = {
    params["_surfaceType", "_basePath", "_suffix"];

    // remove leading #
    private _parsedSurfaceType = _surfaceType select [1, count _surfaceType];
    // check for overridden surface paths
    private _overrideCfg = configFile >> "CfgWorldTexture" >> worldName >> "Surfaces" >> _parsedSurfaceType >> "texturePath";
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

    format["%1\%2%3", _basePath, (_fileNameArr joinString ""), _suffix];
};

private _result = if !(isNil QGVAR(automaticFileSetup)) then {
   GVAR(automaticFileSetup) params ["_basePath", "_suffix"];

   [_surfaceType, _basePath, _suffix] call _getTexturePath;
} else {
   private _basePath = getText (configFile >> "CfgWorldTexture" >> "Altis" >> "surfaceTextureBasePath");
   if ((_surfaceType find "#Gdt" == -1) || {worldName == "Tanoa"} || {worldName == "Enoch"}) then {
       _basePath = getText (configFile >> "CfgWorldTexture" >> worldName >> "surfaceTextureBasePath")
   };

   [_surfaceType, _basePath, getText(configFile >> "CfgWorldTexture" >> worldName >> "suffix")] call _getTexturePath;
};

_result
