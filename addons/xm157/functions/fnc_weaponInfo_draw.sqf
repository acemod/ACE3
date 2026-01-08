#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Draw3D event handler when scope is active
 *
 * Arguments:
 * None (implicit vars from missionEventHandler)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_xm157_fnc_weaponInfo_draw
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_thisArgs", "_thisEventHandler"]; // from missionEventHandler
_thisArgs params ["_display"];
if (isNull _display) exitWith {
    TRACE_1("cleaning up display",_thisEventHandler);
    GVAR(shown) = false;
    GVAR(timeOfFlight) = nil;
    removeMissionEventHandler ["Draw3D", _thisEventHandler];
};
private _ctrlScopeObject = _display displayCtrl IDC_SCOPE_OBJECT;
private _ctrlScreenObject = _display displayCtrl IDC_SCREEN_OBJECT;


// Hide everything when not in scope
private _isUsingOptic = ctrlShown (_display displayCtrl 154);
if (!_isUsingOptic) exitWith {
    _ctrlScopeObject ctrlShow false;
    _ctrlScreenObject ctrlShow false;
};
_ctrlScopeObject ctrlShow true;
_ctrlScreenObject ctrlShow true;
BEGIN_COUNTER(draw);

// Get common info
private _weaponVec = ace_player weaponDirection currentWeapon ace_player;
(_weaponVec call CBA_fnc_vect2Polar) params ["", "_weaponDir", "_weaponPitch"];
private _weaponBank = call cba_optics_fnc_gunBank;
private _viewBank = _weaponBank;
if (isWeaponDeployed [player, true]) then {  // prone deploy tilting is special (screen doesn't tilt, but player does)
    _weaponBank = (((vectorUp ace_player) vectorCrossProduct _weaponVec) call CBA_fnc_vect2Polar) # 2; // I think this is right?
};

(0.25 call CBA_fnc_getFov) params ["_fov", "_zoom"];
private _fovMRAD = 1000 * _fov;  // Real MRAD (not mils)
private _nonMagnified = _zoom < 1.1;
private _range = GVAR(data) getOrDefault ["range", 0];
private _needsUpdate = GVAR(data) getOrDefault ["menu_updated", true]; // Updated when a menu item changed
private _timeSinceLastInput = CBA_missionTime - (GVAR(data) getOrDefault ["lastInputTime", 0]);


// Bank-tilt display objects
_ctrlScopeObject ctrlSetModelDirAndUp [[0,1,0],[sin _viewBank,0,cos _viewBank]];
_ctrlScreenObject ctrlSetModelDirAndUp [[0,1,0],[sin _viewBank,0,cos _viewBank]];


// Scope - Handle etched reticle
private _retTex = QPATHTOF(data\mrad_10_ca.paa);
private _retScale = 4096/10; // texureResolution / (px/MRAD)
switch (true) do {
    case (_fovMRAD < 4096/40): {
        _retTex = QPATHTOF(data\mrad_40_ca.paa);
        _retScale = 4096/40;
    };
    case (_fovMRAD < 4096/20): {
        _retTex = QPATHTOF(data\mrad_20_ca.paa);
        _retScale = 4096/20;
    };
};
private _scale = 1 / (getResolution # 5);
_scale = 2 * _scale * _retScale / _fovMRAD;
_ctrlScopeObject ctrlSetModelScale _scale;
private _ctrlScopeReticle = _display displayCtrl IDC_SCOPE_RETICLE;
if (_retTex != ctrlText _ctrlScopeReticle) then { _ctrlScopeReticle ctrlSetText _retTex; };


// Screen - Draw menu
[_display, _needsUpdate] call FUNC(weaponInfo_drawMenu);


// Screen - Show range info
private _rangeInfo = _range call {
    if (_range == 0) exitWith { "" };
    if (_range < 0) exitWith { // range error - blink if recent
        ["", "----"] select ((_timeSinceLastInput < 3) && {(floor (4*_timeSinceLastInput)) % 2 == 1});
    };
    format ["%1 m", _range toFixed 0]
};
private _ctrl = _display displayCtrl IDC_SCREEN_TEXT_UPPER_RIGHT;
_ctrl ctrlSetText _rangeInfo;


// Screen - Show bearing info
private _bearingInfo = call {
    private _bearingSetting = GVAR(data) getOrDefault ["bearing_show", 0];
    if ((_bearingSetting == 2) && {_timeSinceLastInput > 2}) exitWith { "" };
    if ((_bearingSetting == 1)) exitWith { str floor (17.777777 * _weaponDir); }; // (6400 Mils, not MRAD)
    format ["%1°", floor _weaponDir];
};
private _ctrl = _display displayCtrl IDC_SCREEN_TEXT_UPPER_LEFT;
_ctrl ctrlSetText _bearingInfo;


// Screen - update reticle type based on settings and zoom level
private _ctrl = _display displayCtrl IDC_SCREEN_RETICLE;
private _lastMagnified = GVAR(data) getOrDefault ["reticle_cache_lastMag", true];
private _size = GVAR(data) getOrDefault ["reticle_cache_size", 1];
if (_needsUpdate || {_nonMagnified isNotEqualTo _lastMagnified}) then {
    private _tex = "";
    if (_nonMagnified) then {
        switch (GVAR(data) getOrDefault ["reticle_cqb", 0]) do {
            case (0): { _tex = "\a3\weapons_f\acc\data\collimdot_dot_red_ca.paa"; _size = 1; };
            case (1): { _tex = "\a3\weapons_f\acc\data\collimdot_dot_red_ca.paa"; _size = 2; };
            case (2): { _tex = "\a3\weapons_f\acc\data\collimdot_circle_red_ca.paa"; _size = 1; };
            case (3): { _tex = "\a3\weapons_f\acc\data\collimdot_dot_green_ca.paa"; _size = 1; };
            case (4): { _size = 0; };
        };
    } else {
        _tex = "\a3\weapons_f\acc\data\collimdot_dot_red_ca.paa"; _size = 1;
    };
    _ctrl ctrlSetText _tex;
    GVAR(data) set ["reticle_cache_lastMag", _nonMagnified];
    GVAR(data) set ["reticle_cache_size", _size];
};


// Screen - update reticle position based on ballistics computer
if (_range > 0 && {_size > 0}) then {
    BEGIN_COUNTER(ballistics_calculator);
    ([_range, _weaponDir, _weaponPitch, _weaponBank] call FUNC(ballistics_calculator)) params ["_elevMRAD", "_windMRAD", "_TOF"];
    END_COUNTER(ballistics_calculator);
    _ctrl ctrlSetPosition [-_windMRAD / _fovMRAD + 0.5 - _size / 2,  + 4/3 * (_elevMRAD / _fovMRAD + 0.5 - _size/2), _size, _size*4/3];
    _ctrl ctrlCommit 0;
    GVAR(timeOfFlight) = _TOF;
} else {
    _ctrl ctrlSetPosition [0.5 - _size / 2,  + 4/3 * (0.5 - _size/2), _size, _size*4/3];
    _ctrl ctrlCommit 0;
    GVAR(timeOfFlight) = nil;
};


END_COUNTER(draw);
