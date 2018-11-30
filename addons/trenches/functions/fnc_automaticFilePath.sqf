#include "script_component.hpp"

if ((isText (configFile >> "CfgWorlds" >> worldName >> "surfaceTextureBasePath")) || ("surfaceTexture" in (uiNamespace getVariable ["Intercept_cba_capabilities",[]]))) exitWith {};
private _config = configfile >> "CfgWorlds" >> worldName >> "OutsideTerrain" >> "Layers" >> "Layer0" >> "texture";
if !(isText (_config)) exitWith {
   diag_log format ["GRAD Trenches: Found no OutsideTerrain texture for Map %1, automatic file path not possible!", worldName];
};
private _path = getText (_config);
if (_path find"A3\Map_Data\" >= -1) exitWith {
   diag_log format ["GRAD Trenches: Found OutsideTerrain texture not matching path for Map %1, automatic file path not possible!", worldName];
};

private _split = _path splitString "\";
private _count = ((count _split) -1);
private _texture = _split select _count;
_split deleteAt _count;
_path = _split joinString "\";

private _filePrefix = ".paa";
if ((_texture find "co.paa" >= -1)|| _texture find "ca.paa" >= -1) then {
   _split = _texture splitString "_";
   _filePrefix = _split select ((count _split) -1);
};

GVAR(automaticFileSetup) = [_path, _filePrefix];
publicVariable QGVAR(automaticFileSetup);
