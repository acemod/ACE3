#include "script_component.hpp"
/*
* Author: PabstMirror
* Creates a viewport display and camera
*
* Arguments:
* 0: Vehicle <OBJECT>
* 1: Viewport <ARRAY>
* 2: Player's vision mode <NUMBER>
*
* Return Value:
* None
*
* Example:
* [...] call ace_viewports_fnc_viewCreate
*
* Public: No
*/

params ["_vehicle", "_viewport", "_visionMode"];
_viewport params ["_name", "_type", "_camLocation", "_camAttach"];
TRACE_5("camCreate",_vehicle,_name,_type,_camLocation,_camAttach);

private _usingGoggles = _visionMode > 0;

if (_camLocation isEqualType "") then {
    _camLocation = _vehicle selectionPosition [_camLocation, "Memory"];
    if (_camLocation isEqualTo [0,0,0]) then { WARNING_2("probably bad cam location %1:%2",typeOf _vehicle,_viewport); }
};

// Create Cam and attach it to vic
GVAR(camera) = "camera" camCreate getPos _vehicle;
if (_camAttach isEqualType 0) then {
    // number - Static attach and set const direction
    GVAR(camera) attachTo [_vehicle, _camLocation];
    GVAR(camera) setDir _camAttach; // could do pitch as well, but probably not needed
} else {
    // array - Turret path, get gunner optic mem and bone-attach to it
    private _turretConfig = [_vehicle, _camAttach] call CBA_fnc_getTurret;
    private _memoryPointGunnerOptics = getText(_turretConfig >> "memoryPointGunnerOptics");
    GVAR(camera) attachTo [_vehicle, _camLocation, _memoryPointGunnerOptics, true];
};

// Setup r2texture
GVAR(camera) cameraEffect ["INTERNAL", "BACK", QGVAR(pip0)];
private _renderTexture = format ["#(argb,512,512,1)r2t(%1,1)", QGVAR(pip0)];

// Create blank display
QGVAR(display) cutRsc [QGVAR(display), "PLAIN", 0, false];
private _display = uiNamespace getVariable [QGVAR(display), displayNull];


// R2T aspect ratio parameter has no effect - it will match main video AR
// better to have ui elements squashed than to squash the R2T
private _screenAR = getResolution select 4;
private _camEffect = [0];
private _camFov = 0.75;


switch (true) do {
    case (_type == "screen"): {
        // Generic "Squad Leader's Display" monitor showing turret cam
        private _desiredAR = 1.25;
        private _stretch = (_desiredAR / _screenAR) max 0.8 min 1.25; // define max stretch factor of pip texture (don't stretch more or less than this)

        private _viewHeight = 0.3 * safeZoneH;
        private _viewWidth = _stretch * _viewHeight * _screenAR / 1.3333333333333;

        private _ctrlRender = _display ctrlCreate ["RscPicture", -1];
        _ctrlRender ctrlSetText _renderTexture;
        _ctrlRender ctrlSetPosition [safezoneX + 0.5 * safezoneW - 0.5 * _viewWidth, safezoneY + 0.5 * safeZoneH - 0.5 * _viewHeight, _viewWidth, _viewHeight];
        _ctrlRender ctrlCommit 0;

        private _ctrlOverlay = _display ctrlCreate ["RscPicture", -1];
        _ctrlOverlay ctrlSetText "\a3\weapons_f\reticle\data\optika_tv_ca.paa";
        _ctrlOverlay ctrlSetPosition [safezoneX + 0.5 * safezoneW - 0.5 * _viewWidth, safezoneY + 0.5 * safeZoneH - 0.5 * _viewHeight, _viewWidth, _viewHeight];
        _ctrlOverlay ctrlCommit 0;

        if (_usingGoggles) then {
            // Screen will be out of focus, too bright and not in IR; should be almost impossible to see anything useful
            _camEffect = [3,1,1,0.1,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
            
            private _ctrlNVG = _display ctrlCreate ["RscPicture", -1];
            _ctrlNVG ctrlSetText "#(argb,8,8,3)color(1,1,0.6,0.9)";
            _ctrlNVG ctrlSetPosition [safezoneX + 0.5 * safezoneW - 0.5 * _viewWidth, safezoneY + 0.5 * safeZoneH - 0.5 * _viewHeight, _viewWidth, _viewHeight];
            _ctrlNVG ctrlCommit 0;
        } else {
            _camEffect = [0]; // 2.08's currentVisionMode change could allow matching real turret's vision mode
        };
        _camFov = 0.25;
    };
    default {
        // Generic periscope viewport
        private _desiredAR = 3;
        private _stretch = (_desiredAR / _screenAR) max 0.8 min 1.25; // define max stretch factor of pip texture
        private _viewHeight = 0.3 * safeZoneH;

        if (_usingGoggles) then {
            _camEffect = [_visionMode]; // pass-thru
            // _camEffect = [3, true, 0.747773,0.791092,0,[0,0,0,0],[1.3,1.2,0,0.9],[6,1,1,0]]; 
            // Some periscope glass is IR Laser Safe (~1064nm) which is close to same wavelength as NVGs
            // And cannot apply nvg and ace_nightvision effects to pip at same time, so just make it small and shitty...
            _viewHeight = 0.45 * _viewHeight; 
        };
        private _viewWidth = _stretch * _viewHeight * _screenAR / 1.3333333333333;

        private _ctrlRender = _display ctrlCreate ["RscPicture", -1];
        _ctrlRender ctrlSetText _renderTexture;
        _ctrlRender ctrlSetPosition [safezoneX + 0.5 * safezoneW - 0.5 * _viewWidth, safezoneY + 0.5 * safeZoneH - 0.5 * _viewHeight, _viewWidth, _viewHeight];
        _ctrlRender ctrlCommit 0;

        if (_usingGoggles) then {
            // Roughly try to color match ace_nvg, and make it semi-opaque
            private _ctrlNVG = _display ctrlCreate ["RscPicture", -1];
            _ctrlNVG ctrlSetText "#(argb,8,8,3)color(0.25,0.2,0.05,0.75)";
            _ctrlNVG ctrlSetPosition [safezoneX + 0.5 * safezoneW - 0.5 * _viewWidth, safezoneY + 0.5 * safeZoneH - 0.5 * _viewHeight, _viewWidth, _viewHeight];
            _ctrlNVG ctrlCommit 0;
        };

        private _ctrlOverlay = _display ctrlCreate ["RscPicture", -1];
        _ctrlOverlay ctrlSetText QPATHTOF(data\optic_window_ca.paa);
        _ctrlOverlay ctrlSetPosition [safezoneX + 0.5 * safezoneW - 0.5 * _viewWidth, safezoneY + 0.5 * safeZoneH - 0.5 * _viewHeight, _viewWidth, _viewHeight];
        _ctrlOverlay ctrlCommit 0;
    };
};

GVAR(camera) camSetFov _camFov;
QGVAR(pip0) setPiPEffect _camEffect;
GVAR(camera) camCommit 0;
