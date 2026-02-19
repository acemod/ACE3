#include "script_component.hpp"

if (hasInterface) then {
    #include "initKeybinds.inc.sqf"

    // add camera interactions
    private _switchToCameraAction = ["SwitchToCamera", "Switch To Missile Camera", "", {
        // statement
        params ["_target", "_player", "_params"];
        private _camera = _player getVariable [QGVAR(missileCamera), objNull];
        [_camera] call FUNC(camera_switchTo);
    }, {
        // condition
        params ["_target", "_player", "_params"];
        private _camera = _player getVariable [QGVAR(missileCamera), objNull];
        private _projectile = _camera getVariable [QGVAR(missile), objNull];
        !([] call FUNC(camera_userInCamera)) && { !isNull _camera } && { !isNull _projectile }
    }] call EFUNC(interact_menu,createAction);
    ["CAManBase", 1, ["ACE_SelfActions"], _switchToCameraAction, true] call EFUNC(interact_menu,addActionToClass);

    GVAR(activeCamera) = objNull;
    GVAR(projectileHashMap) = createHashMap; // used in the seeker to get the namespace for the associated projectile
    GVAR(launcherWeapons) = createHashMap; // Used to quickly determine whether the current weapon is a Spike launcher

    // Define the B&W ppEffect for the visual seeker view mode
    GVAR(ppEffectBW) = ppEffectCreate ["ColorCorrections", 1500];
    GVAR(ppEffectBW) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 0], [0.33, 0.33, 0.33, 0]];
    GVAR(ppEffectBW) ppEffectCommit 0;
    GVAR(ppEffectBW) ppEffectEnable false;

    // Stores launcher view mode, to auto-set the missile's post-launch
    GVAR(visionMode) = "normal";
    ace_player addEventHandler ["VisionModeChanged", {
        params ["", "_visionMode", "_TIindex"];

        if (cameraView isNotEqualTo "GUNNER") exitWith {};

        if (_visionMode == 2) then { // If thermal, add specific thermal submode to index
            _visionMode = _TIindex + 1;
        };
        GVAR(visionMode) = ["normal", "white_hot_black_cold", "black_hot_white_cold"] select _visionMode;
    }];
};
