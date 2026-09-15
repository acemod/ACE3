#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Handles the map helper's draw event
 * Resets arguments if not run recently and starts a watchdog to detect when weapon display unloaded
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spike_fnc_mapHelperDraw
 *
 * Public: No
 */
#define __SPIKE_DISPLAY (uiNamespace getVariable "ACE_RscOptics_spike")
#define __SPIKE_RETICLE (__SPIKE_DISPLAY displayCtrl 242000)

private _currentShooter = if (ACE_player call CBA_fnc_canUseWeapon) then {ACE_player} else {vehicle ACE_player};
if (isNil QGVAR(arguments)) then {
    TRACE_1("Starting optic draw",_this);

    // reset shooter var:
    _currentShooter setVariable ["ace_missileguidance_target", nil, false];

    GVAR(arguments) = [
        diag_frameNo,       // Last run frame
        [0, 0, 0]            // currentTargetObject
    ];

    // Start up a watchdog for when the display is no longer shown (but might not be unloaded or null)
    [{
        if (isNull (uiNamespace getVariable ["ACE_RscOptics_spike", displayNull])) exitWith {true};
        GVAR(arguments) params ["_lastRunFrame"];
        (diag_frameNo < _lastRunFrame) || {diag_frameNo > (_lastRunFrame + 1)}
    }, {
        TRACE_1("old/null display - ending optic draw",_this);
        GVAR(arguments) = nil;
    }, []] call CBA_fnc_waitUntilAndExecute;
};


if (cameraView isEqualTo "GUNNER") then {
    GVAR(arguments) set [0, diag_frameNo];

    __SPIKE_RETICLE ctrlShow true;
    GVAR(arguments) params ["", "_targetPosition"];

    private _currentAmmo = _currentShooter ammo currentWeapon _currentShooter;

    private _designating = __SPIKE_DISPLAY getVariable [QGVAR(designate), 0];
    if (_currentAmmo != 0 && { _designating == 1 || _targetPosition isNotEqualTo [0, 0, 0] }) then {
        private _viewASL = AGLToASL positionCameraToWorld [0,0,0];
        private _viewDir = _viewASL vectorFromTo (AGLToASL positionCameraToWorld [0,0,1]);
        _targetPosition = [_viewASL, _viewDir, _designating, _targetPosition, _currentShooter, _currentShooter] call FUNC(getTargetPosition);
        GVAR(arguments) set [1, _targetPosition];
    };

    if (_currentAmmo == 0) then {
        __SPIKE_RETICLE ctrlShow false;
    } else {
        if (_targetPosition isEqualTo [0, 0, 0]) then {
            __SPIKE_RETICLE ctrlSetPosition [0, 0];

            (__SPIKE_DISPLAY displayCtrl 243101) ctrlShow false;
            (__SPIKE_DISPLAY displayCtrl 243201) ctrlShow false;
            (__SPIKE_DISPLAY displayCtrl 243301) ctrlShow false;

            (__SPIKE_DISPLAY displayCtrl 241000) ctrlShow true;
        } else {
            (__SPIKE_DISPLAY displayCtrl 243101) ctrlShow true;
            (__SPIKE_DISPLAY displayCtrl 243201) ctrlShow true;
            (__SPIKE_DISPLAY displayCtrl 243301) ctrlShow true;

            (__SPIKE_DISPLAY displayCtrl 241000) ctrlShow false;

            private _seekerPositionScreen = worldToScreen ASLToAGL _targetPosition;
            if (_seekerPositionScreen isEqualTo []) then {
                _seekerPositionScreen = [0, 0];
            };
            _seekerPositionScreen set [0, _seekerPositionScreen#0 - 0.5];
            _seekerPositionScreen set [1, _seekerPositionScreen#1 - 0.5];

            __SPIKE_RETICLE ctrlSetPosition _seekerPositionScreen;

            if (abs (_seekerPositionScreen#0) > 0.2 || abs (_seekerPositionScreen#1) > 0.2) then {
                GVAR(arguments) set [1, [0, 0, 0]];
            };
        };
        _currentShooter setVariable [QGVAR(target), _targetPosition];
    };

    __SPIKE_RETICLE ctrlCommit 0;
} else {
    __SPIKE_RETICLE ctrlShow false;
    (__SPIKE_DISPLAY displayCtrl 241000) ctrlShow false;
};
