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
};
