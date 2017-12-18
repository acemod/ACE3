/*
 * Author: chris579
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
#include "script_component.hpp"
params [
    ["_object", objnull, [objNull]]
];
if (isNull _object) exitWith {};

if (!isText (configFile >> "CfgWorlds" >> worldName >> QGVAR(camouflageObjects))) exitWith {DEFAULT_TEXTURE};

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

    format["%1%2%3", _basePath, (_fileNameArr joinString ""), _filePrefix];
};

private _basePath = getText (configFile >> "CfgWorlds" >> "Altis" >> QGVAR(camouflageObjects));
if ((_surfaceType find "#Gdt" == -1) || {worldName == "Tanoa"}) then {
    _basePath = getText (configFile >> "CfgWorlds" >> worldName >> QGVAR(camouflageObjects))
};

private _result = [_surfaceType, _basePath, getText(configFile >> "CfgWorlds" >> worldName >> QGVAR(filePrefix))] call _getTexturePath;

if (isNil {_result}) then {
    _result = DEFAULT_TEXTURE;
};

TRACE_5("Calculcated texture path",typeof _object,position _object,worldName,_surfaceType,_result);

_result;
