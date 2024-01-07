#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, PabstMirror
 * Determines night vision source (player/vehicle) - Updates UI based on type.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nightvision_fnc_refreshGoggleType
 *
 * Public: No
 */

TRACE_1("refreshGoggleType",_this);

if (!GVAR(running) || {GVAR(effectScaling) == 0}) exitWith {};

// Defaults (good for most vehicles/binoculars)
private _borderImage = "";
private _eyeCups = false;
private _hideHex = true;
private _nvgGen = 3;
private _blurRadius = -1;

// Adds Array of Params / Original ACE3's (ST's) by default. (NVG_GREEN_PRESET)
private _preset = getArray (configFile >> "CfgWeapons" >> "NVGoggles" >> QGVAR(colorPreset));

if ((alive ACE_player) && {isNull (ACE_controlledUAV select 0)}) then {
    if (((vehicle ACE_player) == ACE_player) || {
        // Test if we are using player's nvg or if sourced from vehicle:

        private _currentVehicle = vehicle ACE_player;
        private _vehConfig = configOf _currentVehicle;

        if (cameraView != "GUNNER") exitWith {true};  // asume hmd usage outside of gunner view
        if ([ACE_player] call CBA_fnc_canUseWeapon) exitWith {true}; // FFV

        private _turret = _currentVehicle unitTurret ACE_player; // driver is [-1]
        if (_turret isEqualTo []) exitWith { true };
        (_currentVehicle currentVisionMode _turret) params ["_turretVisionMode"];
        _turretVisionMode != 1 // if turret isn't giving nvg, then it must be unit's googles
    }) then {
        if ((cameraView == "GUNNER") && {currentWeapon ACE_player != ""} && {binocular ACE_player == currentWeapon ACE_player}) exitWith {
            TRACE_1("souce: binocular",binocular ACE_player); // Source is from player's binocular (Rangefinder/Vector21bNite)
            private _config = configFile >> "CfgWeapons" >> (binocular ACE_player);
            if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
            if (isArray (_config >> QGVAR(colorPreset))) then {_preset = getArray (_config >> QGVAR(colorPreset));};
        };

        TRACE_1("source: hmd",GVAR(playerHMD)); // Source is player's HMD (or possibly a NVG scope, but no good way to detect that)
        private _config = configFile >> "CfgWeapons" >> GVAR(playerHMD);
        if (!isClass _config) exitWith {};

        // Only use border if there is no modelOptics
        if ((getText (_config >> "modelOptics")) == "") then {
            _borderImage = getText (_config >> QGVAR(border));
            _eyeCups = ((getNumber (_config >> QGVAR(eyeCups))) == 1);
            _hideHex = (getNumber (_config >> QGVAR(hideHex))) == 1;
            if (isNumber (_config >> QGVAR(bluRadius))) then {_blurRadius = getNumber (_config >> QGVAR(bluRadius));};
        };
        if (isNumber (_config >> QGVAR(generation))) then {_nvgGen = getNumber (_config >> QGVAR(generation));};
        if (isArray (_config >> QGVAR(colorPreset))) then {_preset = getArray (_config >> QGVAR(colorPreset));};
    } else {
        TRACE_1("source: vehicle - defaults",typeOf vehicle ACE_player);
    };
};

#ifdef DEBUG_MODE_FULL
systemChat format ["NVG Refresh - Border: %1", _borderImage];
systemChat format ["EyeCups: %1, HideHex %2, NVGen: %3, BluRadius: %4", _eyeCups, _hideHex, _nvgGen, _blurRadius];
#endif

// Selection cancelled, params added
_preset params ["_offset", "_blend", "_colorize", "_weight"];

GVAR(nvgBlurRadius) = _blurRadius;
GVAR(nvgGeneration) = _nvgGen;

// Additional Global variables for Params transfer & supporting
GVAR(nvgOffset) = _offset;
GVAR(nvgBlend) = _blend;
GVAR(nvgColorize) = _colorize;
GVAR(nvgWeight) = _weight;

// Setup border and hex image based on NVG config:
private _scale = (call EFUNC(common,getZoom)) * 1.12513;

private _borderImageCtrl = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1001;
private _trippleHeadLeft = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1002;
private _trippleHeadRight = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1003;
if (_borderImage == "") then {
    _borderImageCtrl ctrlShow false;
    _trippleHeadLeft ctrlShow false;
    _trippleHeadRight ctrlShow false;
    GVAR(defaultPositionBorder) = [];
} else {
    _borderImageCtrl ctrlShow true;
    _trippleHeadLeft ctrlShow true;
    _trippleHeadRight ctrlShow true;

    _borderImageCtrl ctrlSetText _borderImage;
    _borderImageCtrl ctrlSetFade ([.15, 0] select _eyeCups);

    #define BORDER_SIZE 3
    GVAR(defaultPositionBorder) = [safezoneX - (((BORDER_SIZE * 0.75) * safezoneH) - safezoneW) / 2, safezoneY - ((BORDER_SIZE - 1) / 2) * safezoneH, (BORDER_SIZE * 0.75) * safezoneH, BORDER_SIZE * safezoneH];
    [_borderImageCtrl, GVAR(defaultPositionBorder), _scale] call FUNC(scaleCtrl);
};

private _hexCtrl = (uiNamespace getVariable QGVAR(titleDisplay)) displayCtrl 1000;
if (_hideHex) then {
    _hexCtrl ctrlShow false;
} else {
    _hexCtrl ctrlShow true;
    // _hexCtrl ctrlSetText QPATHTOF(data\nvg_mask_hexes.paa);
    _hexCtrl ctrlSetText QPATHTOF(data\nvg_mask_hexes_thin.paa);

    #define HEX_SIZE 1.5
    GVAR(defaultPositionHex) = [safezoneX - (((HEX_SIZE * 0.75) * safezoneH) - safezoneW) / 2, safezoneY - ((HEX_SIZE - 1) / 2) * safezoneH, (HEX_SIZE * 0.75) * safezoneH, HEX_SIZE * safezoneH];
    [_hexCtrl, GVAR(defaultPositionHex), _scale] call FUNC(scaleCtrl);
};

// Trigger full ppEffects update next time run in the PFEH:
GVAR(nextEffectsUpdate) = -1;
