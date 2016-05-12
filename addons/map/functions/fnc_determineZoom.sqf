/*
* Author: Rocko
* Calculate the maximum zoom level allowed for the current map
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

private ["_grids", "_fourSize", "_sixSize", "_continue", "_size", "_i"];
_grids = (configFile >> "CfgWorlds" >> worldName >> "Grid");
_fourSize = -1;
_sixSize = -1;
for "_i" from 1 to 10 do {
    _continue = false;
    if (isClass(_grids >> format["Zoom%1", _i])) then {
        _continue = true;
        _size = getText(_grids >> format["Zoom%1", _i] >> "formatX");
        if ((count toArray(_size)) == 2) then {
            _fourSize = getNumber(_grids >> format["Zoom%1", _i] >> "zoomMax");
        };
        if ((count toArray(_size)) == 3) then {
            _sixSize = getNumber(_grids >> format["Zoom%1", _i] >> "zoomMax");
        };
        if (_fourSize != -1 && {_sixSize != -1}) then {
            _continue = false;
        };
    };
    if (!_continue) exitWith {};
};

if(_fourSize != -1 && {_sixSize != -1}) then {
    if (isNil QGVAR(minMapSize)) then {
        GVAR(minMapSize) = _sixSize + 0.01
    } else {
        GVAR(minMapSize) = -1
    };
};
