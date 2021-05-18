#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

// Server handles the tracking of all projectiles. It dispatches events to launchers to fire at specific targets
if (isServer) then {
    GVAR(trackers) = [];
    GVAR(launchers) = [];
    GVAR(nonTrackingProjectiles) = [];
    GVAR(trackingProjectiles) = [];

    GVAR(interceptors) = [];
    GVAR(toBeShot) = [];

    [QGVAR(track), {
        params ["_projectile"];
        GVAR(nonTrackingProjectiles) pushBack _projectile;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(registerLauncher), {
        params ["_launcher"];
        GVAR(launchers) pushBackUnique _launcher;
        _launcher setVariable [QGVAR(targetList), []];
        _launcher setVariable [QGVAR(launchState), LAUNCH_STATE_IDLE];
        _launcher setVariable [QGVAR(lastLaunchTime), 0];
        _launcher setVariable [QGVAR(engagedTargets), [[], objNull] call CBA_fnc_hashCreate];
        _launcher setVariable [QEGVAR(missileguidance,target), objNull];
    }] call CBA_fnc_addEventHandler;

    [QGVAR(registerTracker), {
        params ["_tracker", "_range"];
        GVAR(trackers) pushBack [_tracker, _range];
    }] call CBA_fnc_addEventHandler;

    [QGVAR(registerInterceptor), {
        params ["_interceptor", "_target"];
        GVAR(interceptors) pushBack [_interceptor, _target, getPosASLVisual _interceptor];

        GVAR(toBeShot) deleteAt (GVAR(toBeShot) find _target);
    }] call CBA_fnc_addEventHandler;

    [LINKFUNC(projectileTrackerPFH)] call CBA_fnc_addPerFrameHandler;
    [LINKFUNC(proximityFusePFH)] call CBA_fnc_addPerFrameHandler;
};

// duplicate event to add event handler
[QGVAR(registerLauncher), {
    params ["_launcher"];
    if !(local _launcher) exitWith {};
    _launcher addEventHandler ["Fired", {
        params ["_launcher", "", "", "", "", "", "_projectile"];
        private _target = _launcher getVariable [QEGVAR(missileguidance,target), objNull];
        if !(isNull _target) then {
            [QGVAR(registerInterceptor), [_projectile, _target]] call CBA_fnc_serverEvent;
        };
    }];
}] call CBA_fnc_addEventHandler;

// When something is fired, determine if we want to track it. If so, send it to the server for processing
GVAR(projectilesToIntercept) = [];

[QGVAR(addProjectileToIntercept), {
    params ["_type"];
    GVAR(projectilesToIntercept) pushBackUnique _type;
}] call CBA_fnc_addEventHandler;

["All", "fired", {
    params ["", "", "", "", "", "", "_projectile"];
    if (local _projectile && { (typeOf _projectile) in GVAR(projectilesToIntercept) }) then {
        [QGVAR(track), [_projectile]] call CBA_fnc_serverEvent;
    };
}] call CBA_fnc_addClassEventHandler;

