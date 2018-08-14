/*
 * Author: voiper
 * Draw nearby lighting and sexy flashlight beams on main map.
 *
 * Arguments:
 * 0: Map control <CONTROL>
 * 1: Map zoom level <NUMBER>
 * 2: Current map centre <ARRAY>
 * 3: Light level from ace_map_fnc_determineMapLight <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 5, [5, 4, 6], []] call ace_map_fnc_simulateMapLight
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_mapCtrl", "_mapScale", "_mapCentre", "_lightLevel"];

private _unitLight = ACE_player getVariable [QGVAR(flashlight), ["", objNull]];
_unitLight params ["_flashlight", ""];

//map width (on screen) in pixels
private _screenSize = 640 * safeZoneWAbs;

//resolution params (every frame in case resolution change)
getResolution params ["_resX", "_resY", "_viewPortX", "_viewPortY", "", "_uiScale"];

//engine rounds the viewport ratios, when they should be fractions; this can cause problems
private _realViewPortY = _resY * _uiScale;
private _realViewPortX = _realViewPortY * 4/3;

//textures
private _fillTex = "#(rgb,8,8,3)color(0,0,0,1)";

//colour/alpha
_lightLevel params ["_r", "_g", "_b", "_a"];
private _colourAlpha = (_r + _g + _b) min _a;
private _shadeAlpha = _a;

private _colourList = [_r, _g, _b];
_colourList sort false;
private _maxColour = _colourList select 0;

//ambient colour fill
_mapCtrl drawIcon ["#(rgb,8,8,3)color(1,1,1,1)", [_r / _maxColour, _g / _maxColour, _b / _maxColour, _colourAlpha], _mapCentre, _screenSize, _screenSize, 0, "", 0];

if (_flashlight == "") then {
    //ambient shade fill
    _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], _mapCentre, _screenSize, _screenSize, 0, "", 0];
} else {
    private _mousePos = GVAR(mousePos);

    //flashlight settings
    private _cfg = (configFile >> "CfgWeapons" >> _flashlight >> "ItemInfo" >> "FlashLight");
    private _size = getNumber (_cfg >> "ACE_Flashlight_Size");
    private _flashTex = getText (_cfg >> "ACE_Flashlight_Beam");
    private _beamSize = (safeZoneW/safeZoneWAbs) * _screenSize / _size;

    //after 5x zoom, it's simulated to be fixed (it actually gets bigger relative to zoom)
    if (_mapScale < 0.2) then {_beamSize = _beamSize / (_mapScale * (1 / 0.2))};

    //assign corrective ratio to fix sub-pixel gaps/overlaps (symptom of viewport * X/Y resolution rounding)
    private _viewPortRatioFixY = if (_realViewPortY != _viewPortY) then {
        _realViewPortX / (_realViewPortY / _viewPortY * _viewPortX)
    } else {
        if (_realViewPortX != _viewPortX) then {
            _realViewPortX / _viewPortX
        } else {
            1
        };
    };

    //offset the elements
    private _offsetX = _mapScale * GVAR(worldSize) * (_screenSize * 2 + _beamSize);
    private _offsetYDown = _mapScale * GVAR(worldSize) * (_screenSize + _beamSize) * _viewPortRatioFixY;
    //up is bigger because of a potential exploit
    private _offsetYUp = _mapScale * GVAR(worldSize) * (_screenSize * 4 + _beamSize) * _viewPortRatioFixY;

    //draw the matrix /whoa
    _mapCtrl drawIcon [_flashTex, [1,1,1,_shadeAlpha], _mousePos, _beamSize, _beamSize, 0, "", 0]; //centre beam
    _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0) - _offsetX, (_mousePos select 1)], _screenSize * 2, _beamSize, 0, "", 0]; //left
    _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0) + _offsetX, (_mousePos select 1)], _screenSize * 2, _beamSize, 0, "", 0]; //right
    _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0), (_mousePos select 1) - _offsetYDown], _screenSize * 4, _screenSize, 0, "", 0]; //down
    _mapCtrl drawIcon [_fillTex, [1,1,1,_shadeAlpha], [(_mousePos select 0), (_mousePos select 1) + _offsetYUp], _screenSize * 4, _screenSize * 4, 0, "", 0]; //up
};
