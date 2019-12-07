#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to handle key down event
 *
 * Arguments:
 * 0: Spectator display <DISPLAY>
 * 1: Key DIK code <NUMBER>
 * 2: State of shift <BOOL>
 * 3: State of ctrl <BOOL>
 * 4: State of alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleKeyDown
 *
 * Public: No
 */

params ["","_key","_shift","_ctrl","_alt"];

// Handle map toggle
if (_key == DIK_M) exitWith {
    [] call FUNC(ui_toggleMap);
    true
};

// Handle very fast speed
if (_key == DIK_LALT) exitWith {
    [true] call FUNC(cam_toggleSlow);
    true
};

// Handle escape menu
if (_key == DIK_ESCAPE) exitWith {
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

// Handle vision mode cycling
if (_key == DIK_N) exitWith {
    private _oldVision = GVAR(camVision);
    private _visions = GVAR(availableVisions);

    // Get current index and index count
    private _iVision = (_visions find _oldVision) max 0;
    private _countVisions = count _visions;

    if (_countVisions != 0) then {
        _iVision = (_iVision + 1) % _countVisions;
        if (_iVision < 0) then { _iVision = _countVisions + _iVision; };
    };

    private _newVision = _visions select _iVision;

    [_newVision] call FUNC(cam_setVisionMode);
    true
};

// Handle postive change in draw
if (_key == DIK_PGUP) exitWith {
    setViewDistance ((viewDistance + 250) min MAX_VIEW_DISTANCE);
    true
};

// Handle negative change in draw
if (_key == DIK_PGDN) exitWith {
    setViewDistance ((viewDistance - 250) max MIN_VIEW_DISTANCE);
    true
};

// Handle spectate lights
if (_key == DIK_L) exitWith {
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

// Handle toggling the UI
if (_key == DIK_BACKSPACE) exitWith {
    [] call FUNC(ui_toggleUI);
    true
};

// Handle toggling help
if (_key == DIK_F1) exitWith {
    GVAR(uiHelpVisible) = !GVAR(uiHelpVisible);

    [] call FUNC(ui_updateHelp);

    CTRL_HELP ctrlShow GVAR(uiHelpVisible);
    CTRL_HELP_BACK ctrlShow GVAR(uiHelpVisible);

    true
};

// Handle toggle focus info widget
if (_key == DIK_I) exitWith {
    GVAR(uiWidgetVisible) = !GVAR(uiWidgetVisible);
    [] call FUNC(ui_updateWidget);
    true
};

// Handle toggling projectile drawing
if (_key == DIK_P) exitWith {
    GVAR(drawProjectiles) = !GVAR(drawProjectiles);
    true
};

// Handle toggling unit drawing
if (_key == DIK_O) exitWith {
    GVAR(drawUnits) = !GVAR(drawUnits);
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

// If the zeus key is pressed and unit is curator, open zeus interface
if ((_key in (actionKeys "CuratorInterface")) && {!isNull (getAssignedCuratorLogic player)}) exitWith {
    // Close the UI and disable camera input
    [false] call FUNC(ui);
    GVAR(camera) camCommand "manual off";

    // Display XEH handles re-opening
    openCuratorInterface;

    // Set the curator camera to the spectator camera location
    [{!isNull curatorCamera},{
        curatorCamera setPosASL (getPosASL GVAR(camera));
        curatorCamera setDir (getDirVisual GVAR(camera));

        // Curator tracks its own vision mode
        [getAssignedCuratorLogic player, 0] call bis_fnc_toggleCuratorVisionMode;
    }] call CBA_fnc_waitUntilAndExecute;
    true
};

false // default to unhandled
