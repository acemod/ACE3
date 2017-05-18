/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to handle key press
 *
 * Public: No
 */

#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

params ["","_key","_shift","_ctrl","_alt"];

// Handle map toggle
if (inputAction "ShowMap" > 0 || inputAction "HideMap" > 0) exitWith {
    [] call FUNC(ui_toggleMap);
    true
};

// Handle escape menu
if (inputAction "ingamePause" > 0) exitWith {
    if (GVAR(uiMapVisible)) then {
        [] call FUNC(ui_toggleMap);
    } else {
        if (GVAR(uiForced)) then {
            private _displayType = ["RscDisplayInterrupt","RscDisplayMPInterrupt"] select isMultiplayer;
            SPEC_DISPLAY createDisplay _displayType;
        } else {
            [false] call FUNC(setSpectator);
        };
    };
    true
};

// Handle postive change in draw
if (inputAction "zeroingUp" > 0) exitWith {
    setViewDistance ((viewDistance + 250.0) min MAX_VIEW_DISTANCE);
    true
};

// Handle negative change in draw
if (inputAction "zeroingDown" > 0) exitWith {
    setViewDistance ((viewDistance - 250.0) max MIN_VIEW_DISTANCE);
    true
};

// Handle vision mode cycling
if (inputAction "nightVision" > 0) exitWith {
    private _stepVision = [1,-1] select _shift;

    private _oldVision = GVAR(camVision);
    private _visions = GVAR(availableVisions);

    // Get current index and index count
    private _iVision = (_visions find _oldVision) max 0;
    private _countVisions = count _visions;

    if (_countVisions != 0) then {
        _iVision = (_iVision + _stepVision) % _countVisions;
        if (_iVision < 0) then { _iVision = _countVisions + _iVision; };
    };

    private _newVision = _visions select _iVision;

    [_newVision] call FUNC(cam_setVisionMode);
    true
};

// If the zeus key is pressed and unit is curator, open zeus interface
if ((inputAction "CuratorInterface") > 0 && {!isNull (getAssignedCuratorLogic player)}) exitWith {
    // Disable drawing while in zeus
    GVAR(drawUnits) = false;
    GVAR(drawProjectiles) = false;

    SPEC_DISPLAY closeDisplay 1;
    GVAR(camera) camCommand "manual off";

    openCuratorInterface;
    true
};

// Handle spectate lights
if (inputAction "headlights" > 0) exitWith {
    if (GVAR(camLight)) then {
        { deleteVehicle _x; } forEach GVAR(camLights);
        GVAR(camLights) = [];
    } else {
        private _cameraLight = "#lightpoint" createvehicleLocal getPosASL GVAR(camera);
        _cameraLight setLightBrightness 2;
        _cameraLight setLightAmbient [1,1,1];
        _cameraLight setLightColor [0,0,0];
        _cameraLight lightAttachObject [GVAR(camera), [0,0,0]];

        private _pointerLight = "#lightpoint" createvehicleLocal getPosASL GVAR(camera);
        _pointerLight setLightBrightness 1;
        _pointerLight setLightAmbient [1,1,1];
        _pointerLight setLightColor [0,0,0];

        GVAR(camLights) = [_cameraLight, _pointerLight];
    };

    GVAR(camLight) = !GVAR(camLight);

    true
};

// Handle toggle projectiles
if (inputAction "lockTarget" > 0) exitWith {
    GVAR(drawProjectiles) = !GVAR(drawProjectiles);
    true
};

// Handle toggle focus info widget
if (inputAction "networkStats" > 0) exitWith {
    GVAR(uiWidgetVisible) = !GVAR(uiWidgetVisible);
    [] call FUNC(ui_updateWidget);
    true
};

// Handle very fast speed
if (_key == DIK_LALT) exitWith {
    [true] call FUNC(cam_toggleVeryFast);
    true
};

// Handle perspective cycling
if (_key in [DIK_SPACE, DIK_NUMPADENTER]) exitWith {
    private _oldMode = GVAR(camMode);
    private _modes = GVAR(availableModes);

    // Get current index and index count
    private _iMode = (_modes find _oldMode) max 0;
    private _countModes = count _modes;

    if (_countModes != 0) then {
        _iMode = (_iMode + 1) % _countModes;
        if (_iMode < 0) then { _iMode = _countModes + _iMode; };
    };

    private _newMode = _modes select _iMode;

    [_newMode] call FUNC(cam_setCameraMode);

    true
};

// Handle getting next focus target
if (_key == DIK_RIGHT) exitWith {
    [true] call FUNC(switchFocus);
    true
};

// Handle getting previous focus target
if (_key == DIK_LEFT) exitWith {
    [false] call FUNC(switchFocus);
    true
};

// Handle toggling the UI
if (_key == DIK_BACKSPACE) exitWith {
    [] call FUNC(ui_toggleUI);
    true
};

// Handle toggling the Tags
if (_key == DIK_BACKSLASH) exitWith {
    GVAR(drawUnits) = !GVAR(drawUnits);
    true
};

// Handle displaying help
if (_key == DIK_F1) exitWith {
    CTRL_HELP ctrlShow !(ctrlShown HELP);
    true
};

// Handle acre spectate headset down (if present)
if (
    ["acre_sys_radio"] call EFUNC(common,isModLoaded) &&
    { [_key, [_shift, _ctrl, _alt]] isEqualTo ((["ACRE2", "HeadSet"] call CBA_fnc_getKeybind) select 5) }
) exitWith {
    [] call acre_sys_core_fnc_toggleHeadset;
    true
};

false // default to unhandled
