#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Updates camera with inputs
 *
 * Arguments:
 * 0: Guidance Arg Array <ARRAY>
 * 1: PFID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], 0] call ace_missileguidance_fnc_guidancePFH;
 *
 * Public: No
 */
params ["_tracking"];
if (_tracking) then {
    if (cameraView isEqualTo "GUNNER") then {
        private _extractedInfo = [[ACE_PLAYER, currentWeapon ACE_PLAYER, nil, "", "M_Titan_AP", "Titan_AP", ACE_PLAYER], false] call FUNC(extractInfo);
        [ASLtoAGL eyePos player, _extractedInfo select 12, player, true] call FUNC(camera_init);
        [player getVariable QGVAR(missileCamera)] call FUNC(camera_switchTo);
        GVAR(preTrackCameraPFID) = [{
            params ["_args"];
            _args params ["_extractedInfo"];
            private _seekerPos = [ACE_PLAYER, ACE_PLAYER, _extractedInfo] call FUNC(seekerType_EO);
            [_extractedInfo, ACE_PLAYER, _seekerPos] call FUNC(camera_update);
        }, 0, [_extractedInfo]] call CBA_fnc_addPerFrameHandler;
    };
} else {
    [player getVariable QGVAR(missileCamera)] call FUNC(camera_destroy);
    [GVAR(preTrackCameraPFID)] call CBA_fnc_removePerFrameHandler;
};
