/*
 * Author: commy2, PabstMirror and esteldunedain
 * Update the ppEffects everytime something changes
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [someEvent] call ace_nightvision_fnc_updatePPEffects
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};

disableSerialization;

params [["_display", displayNull]];

if !(_display isEqualType displayNull) then {
    _display = displayNull;
};

private _currentVehicle = vehicle ACE_player;

// If the Zeus display is on or the player has no nightvision
if (ctrlIDD _display == 312 || currentVisionMode ACE_player != 1) exitWith {
    GVAR(ppEffectFilmGrain) ppEffectEnable false;
    GVAR(ppEffectBlur) ppEffectEnable false;
    GVAR(ppEffectRadialBlur) ppEffectEnable false;
    GVAR(ppEffectNVGBrightness) ppEffectEnable false;
};

// The unit has nightvision
private _config = configFile >> "CfgVehicles" >> typeOf _currentVehicle;
private _hmd = hmd ACE_player;
private _cameraView = cameraView;
private _turret = [ACE_player] call EFUNC(common,getTurretIndex);


private _fnc_isUsingHMD = {
    if (_cameraView != "GUNNER") exitWith {true};  // asume hmd usage outside of gunner view

    if (ACE_player == (driver _currentVehicle)) exitWith {
        !("NVG" in getArray (_config >> "ViewOptics" >> "visionMode"));
    };

    private _result = true;
    private _turretConfig = [_config, _turret] call EFUNC(common,getTurretConfigPath);
    private _turretConfigOpticsIn = _turretConfig >> "OpticsIn";

    if (isClass _turretConfigOpticsIn) then {
        for "_index" from 0 to (count _turretConfigOpticsIn - 1) do {
            if ("NVG" in getArray (_turretConfigOpticsIn select _index >> "visionMode")) exitWith {_result = false};
        };
    } else {
        //No OpticsIn usualy means RCWS, still need to test on more vehicles
        _result = false;
    };
    _result
};

private _grainSetting = 0;
private _blurSetting = 0;
private _radBlurSetting = 0;

if ((_currentVehicle == ACE_player) || _fnc_isUsingHMD) then {
    _grainSetting = getNumber (configFile >> "CfgWeapons" >> _hmd >> "ACE_NightVision_grain");
    _blurSetting = getNumber (configFile >> "CfgWeapons" >> _hmd >> "ACE_NightVision_blur");
    _radBlurSetting = getNumber (configFile >> "CfgWeapons" >> _hmd >> "ACE_NightVision_radBlur");
    TRACE_3("New NVG Settings From Player NVG",_grainSetting,_blurSetting,_radBlurSetting)
} else {
    _grainSetting = _currentVehicle getVariable ["ACE_NightVision_grain", getNumber (_config >> "ACE_NightVision_grain")];
    _blurSetting = _currentVehicle getVariable ["ACE_NightVision_blur", getNumber (_config >> "ACE_NightVision_blur")];
    _radBlurSetting = _currentVehicle getVariable ["ACE_NightVision_radBlur", getNumber (_config >> "ACE_NightVision_radBlur")];
    TRACE_3("New NVG Settings From Vehicle",_grainSetting,_blurSetting,_radBlurSetting)
};


// Enable the effects
GVAR(ppEffectFilmGrain) ppEffectEnable true;
GVAR(ppEffectBlur) ppEffectEnable true;
GVAR(ppEffectRadialBlur) ppEffectEnable true;
GVAR(ppEffectNVGBrightness) ppEffectEnable true;

// Configure effects parameters
GVAR(ppEffectFilmGrain) ppEffectAdjust [0.25, 2.5, 2.5, _grainSetting, _grainSetting, false];
GVAR(ppEffectFilmGrain) ppEffectCommit 0;
GVAR(ppEffectBlur) ppEffectAdjust [_blurSetting];
GVAR(ppEffectBlur) ppEffectCommit 0;
GVAR(ppEffectRadialBlur) ppEffectAdjust [_radBlurSetting, _radBlurSetting, 0.2, 0.2];
GVAR(ppEffectRadialBlur) ppEffectCommit 0;
