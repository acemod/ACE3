#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Server handles the tracking of all projectiles. It dispatches events to launchers to fire at specific targets
// The tracker and launcher array are global to allow for early-out if it is impossible to kill any projectiles to avoid wasting bandwidth
GVAR(trackers) = [];
GVAR(launchers) = [];

if (isServer) then {
    GVAR(nonTrackingProjectiles) = [];
    GVAR(trackingProjectiles) = [];

    GVAR(interceptors) = [];
    // Put these into hash table to avoid massive amounts of loops
    GVAR(toBeShot) = call CBA_fnc_hashCreate;

    [QGVAR(track), {
        params ["_projectile"];
        GVAR(nonTrackingProjectiles) pushBack _projectile;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(registerInterceptor), {
        params ["_interceptor", "_target"];
        GVAR(interceptors) pushBack [_interceptor, _target, getPosASLVisual _interceptor, _interceptor distance _target];
        [GVAR(toBeShot), _target] call CBA_fnc_hashRem;
    }] call CBA_fnc_addEventHandler;
};

[QGVAR(registerLaunchers), {
    {
        GVAR(launchers) pushBackUnique _x;
        _x setVariable [QGVAR(targetList), []];
        _x setVariable [QGVAR(launchState), LAUNCH_STATE_IDLE];
        _x setVariable [QGVAR(lastLaunchTime), 0];
        _x setVariable [QGVAR(engagedTargets), [[], objNull] call CBA_fnc_hashCreate];
        _x setVariable [QEGVAR(missileguidance,target), objNull];

        if (local _x) then {
            _x addEventHandler ["Fired", {
                params ["_launcher", "", "", "", "", "", "_projectile"];
                private _target = _launcher getVariable [QEGVAR(missileguidance,target), objNull];
                if !(isNull _target) then {
                    [QGVAR(registerInterceptor), [_projectile, _target]] call CBA_fnc_serverEvent;
                };
            }];
        };
    } forEach _this;
}] call CBA_fnc_addEventHandler;

[QGVAR(registerTrackers), {
    {
        _x params ["_tracker", "_range"];
        GVAR(trackers) pushBack [_tracker, _range];
    } forEach _this;
}] call CBA_fnc_addEventHandler;

// When something is fired, determine if we want to track it. If so, send it to the server for processing
GVAR(projectilesToIntercept) = [];

[QGVAR(addProjectilesToIntercept), {
    {
        GVAR(projectilesToIntercept) pushBackUnique _x;
    } forEach _this;
}] call CBA_fnc_addEventHandler;

["All", "fired", {
    params ["", "", "", "", "", "", "_projectile"];
    if (local _projectile && { (typeOf _projectile) in GVAR(projectilesToIntercept) }) then {
        // avoid extra bandwidth: don't make a call to the server if we don't have any systems up
        GVAR(launchers) = GVAR(launchers) select {
            alive _x
        };
        GVAR(trackers) = GVAR(trackers) select {
            _x params ["_tracker"];
            alive _tracker
        };
        if !(GVAR(launchers) isEqualTo [] || { GVAR(trackers) isEqualTo [] }) then {
            [QGVAR(track), [_projectile]] call CBA_fnc_serverEvent;
        };
    };
}] call CBA_fnc_addClassEventHandler;

// Needed on all clients to properly destroy it. Despite the fact that deleteVehicle is AG EG, unless if you delete it on all clients there will still be missiles seen
[QGVAR(destroyProjectile), {
    params ["_projectile"];
    deleteVehicle _projectile;
}] call CBA_fnc_addEventHandler;

ADDON = true;

