#include "script_component.hpp"
/*
 * Author: Salbei
 * Automatic creation of a path to surface texture.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [TrenchObj, ACE_player] call ace_trenches_fnc_automaticFilePath
 *
 * Public: No
 */

// Check if there is a config entry for the map
if (
        (isText (configFile >> "CfgWorldTexture" >> worldName >> "surfaceTextureBasePath")) ||
        {"surfaceTexture" in (uiNamespace getVariable ["Intercept_cba_capabilities",[]])}
    ) exitWith {};
private _config = configfile >> "CfgWorldTexture" >> worldName >> "OutsideTerrain" >> "Layers" >> "Layer0" >> "texture";
if !(isText (_config)) exitWith {
    LOG("GRAD Trenches: Found no OutsideTerrain texture for Map %1, automatic file path not possible!");
};

// Check if the path leads to A3 files
private _path = getText (_config);
if (_path find "A3\Map_Data\" >= -1) exitWith {
    LOG("GRAD Trenches: Found OutsideTerrain texture not matching path for Map %1, automatic file path not possible!");
};

// Split the path and remove the texture
private _split = _path splitString "\";
private _count = ((count _split) -1);
private _texture = _split select _count;
_split deleteAt _count;
_path = _split joinString "\";


// Check the path for the right ending
private _suffix = ".paa";
if ((_texture find "co.paa" >= -1)|| {_texture find "ca.paa" >= -1}) then {
    _split = _texture splitString "_";
    _suffix = _split select ((count _split) -1);
};

// Setup the GVAR
GVAR(automaticFileSetup) = [_path, _suffix];
publicVariable QGVAR(automaticFileSetup);
