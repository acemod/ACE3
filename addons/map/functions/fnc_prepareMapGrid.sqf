#include "script_component.hpp"

//--- Extract grid values from world config (Borrowed from BIS_fnc_gridToPos)
//
_cfgGrid = configfile >> "CfgWorlds" >> worldname >> "Grid";
_offsetX = getnumber (_cfgGrid >> "offsetX");
_offsetY = getnumber (_cfgGrid >> "offsetY");
_zoomMax = 1e99;
_format = "";
_formatX = "";
_formatY = "";
_stepX = 1e10;
_stepY = 1e10;
{
    _zoom = getnumber (_x >> "zoomMax");
    if (_zoom < _zoomMax) then {
        _zoomMax = _zoom;
        _format = gettext (_x >> "format");
        _formatX = gettext (_x >> "formatX");
        _formatY = gettext (_x >> "formatY");
        _stepX = getnumber (_x >> "stepX");
        _stepY = getnumber (_x >> "stepY");
    };
} foreach configproperties [_cfgGrid,"isclass _x",false];

_heightOffset = 500;
_startGrid = mapGridPosition [0, _heightOffset];
_originGrid = _startGrid;
while {_startGrid == _originGrid} do {
    _heightOffset = _heightOffset + 1;
    _originGrid = mapGridPosition [0, _heightOffset];
};

_realOffsetY = parseNumber (_originGrid select [(count _formatX), (count _formatY)]) * _stepY + _heightOffset - 1;

_stepXat5 = _stepX * 10 ^ ((count _formatX) - 5);
_stepYat5 = -1 * _stepY * 10 ^ ((count _formatY) - 5);

GVAR(mapGridData) = [_offsetX, _realOffsetY, _stepXat5, _stepYat5];
