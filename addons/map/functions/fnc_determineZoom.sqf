#include "script_component.hpp"
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
 * Example:
 * call ACE_map_fnc_determineZoom
 *
 * Public: No
 */

private _grids = (configFile >> "CfgWorlds" >> worldName >> "Grid");
private _fourSize = -1;
private _sixSize = -1;
for "_i" from 1 to 10 do {
    private _continue = false;
    if (isClass(_grids >> format["Zoom%1", _i])) then {
        _continue = true;
        private _size = getText(_grids >> format["Zoom%1", _i] >> "formatX");
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
