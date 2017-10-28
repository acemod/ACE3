/*
 * ace_wind_deflection.cpp
 * Author: Dedmen
 * Implements basic wind deflection using Intercept
 */
#include "bulletTracker.hpp"

int __cdecl intercept::api_version() {
    return 1;
}

static client::EHIdentifierHandle handleFiredCallbackHandle;
static bulletTracker tracker;

void intercept::post_start() {
    sqf::set_variable(sqf::ui_namespace(), "ace_winddeflection_interceptPlugin", sqf::compile_final("true"));
    tracker.init();
}

void intercept::pre_init() {
    tracker.missionEnded(); //intercept::mission_stopped eventhandler wasn't reliable when writing this. This works fine.
    auto[handleFiredCode, handleFiredHandle] = client::generate_custom_callback([](game_value args) -> game_value {
        tracker.handleFired(args);
        return {};//ret nil
    });
    handleFiredCallbackHandle = handleFiredHandle;

    sqf::set_variable(sqf::mission_namespace(), "ace_winddeflection_fnc_handleFired", sqf::compile_final(handleFiredCode));
    sqf::set_variable(sqf::mission_namespace(), "ace_winddeflection_fnc_updateTrajectoryPFH", sqf::compile_final("true"));//We take care of that.
    tracker.preInit();
}
