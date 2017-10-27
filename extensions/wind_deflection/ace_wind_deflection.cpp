/*
 * ace_wind_deflection.cpp
 * Author: NouberNou
 * Implements basic wind deflection using the intercept binding
 *
 * Takes:
 * None
 *
 * Returns:
 * None
 */
#include <Windows.h>
#include <stdio.h>
#include <cstdint>
#include <atomic>
#include <memory>

#include "intercept.hpp"
#include "logging.hpp"
#include "client\client.hpp"
#include "client\pointers.hpp"
#include "client\sqf\uncategorized.hpp"
#include "client\sqf\config.hpp"

#include "shot_tracker.hpp"

#define PI 3.14159265f

#define DEG(x) (x * 180.0f / PI)
#define RAD(x) (x / 180.0f * PI)

using namespace intercept;
using namespace ace::wind_deflection;

INITIALIZE_EASYLOGGINGPP

shot_tracker tracker;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::on_frame() {
    LOG(INFO) << "ace_wind_deflection on_frame";
    tracker.on_frame();
}


void __cdecl intercept::post_init() {

}

void __cdecl intercept::mission_stopped() {

}

void __cdecl intercept::fired(
    object &unit_,
    rv_string &weapon_,
    rv_string &muzzle_,
    rv_string &mode_,
    rv_string &ammo_,
    rv_string &magazine_,
    object &projectile_)
{
    LOG(INFO) << "ace_wind_deflection fired: " << ammo_.string();

    // Check if the projectile should be calculated
    // if (missionNamespace getVariable[QEGVAR(advanced_ballistics, enabled), false] && (_bullet isKindOf "BulletBase") && (_unit isKindOf "Man")) exitWith{ false };
    bool abEnabled(sqf::get_variable(sqf::mission_namespace(), "ace_advanced_ballistics_enabled", game_value(false)));
    LOG(DEBUG) << "ace_advanced_ballistics_enabled: " << abEnabled;
    if (abEnabled) {
        if (sqf::is_kind_of(projectile_, "BulletBase") && sqf::is_kind_of(unit_, "Man")) {
            return;
        }
    }

    // if (!hasInterface) exitWith {false};
    if (!(sqf::has_interface())) {
        return;
    }

    // if (!(GVAR(vehicleEnabled)) && !(_unit isKindOf "Man")) exitWith {false};
    bool vehicleEnabled(sqf::get_variable(sqf::mission_namespace(), "ace_winddeflection_vehicleEnabled"));
    if (!vehicleEnabled) {
        if (!sqf::is_kind_of(unit_, "Man")) {
            return;
        }
    }

    // if (!((_bullet isKindOf "BulletBase") || (_bullet isKindOf "GrenadeBase"))) exitWith{ false };
    if (!(sqf::is_kind_of(projectile_, "BulletBase")) && (sqf::is_kind_of(projectile_, "GrenadeBase"))) {
        return;
    }
    // if (_unit distance ACE_player > GVAR(simulationRadius)) exitWith{ false };
    object player = sqf::get_variable(sqf::mission_namespace(), "ACE_player");
    float distance = sqf::get_pos_asl(unit_).distance(sqf::get_pos_asl(player));
    float radius = sqf::get_variable(sqf::mission_namespace(), "ace_winddeflection_simulationRadius");
    if (distance > radius) {
        return;
    }

    // if (!([_unit] call EFUNC(common, isPlayer))) exitWith{ false };
    // @todo: Support curator controlled units when is_nil is implemented
    if (!sqf::is_player(unit_)) {
        return;
    }
    tracker.add_shot(projectile_, ammo_.string());

}

void __cdecl intercept::on_signal(
    std::string &signal_name_,
    game_value &value1_)
{
    LOG(INFO) << "ace_wind_deflection on_signal: " << signal_name_;
}

void Init(void) {
    el::Configurations conf;

    conf.setGlobally(el::ConfigurationType::Filename, "logs/ace_wind_deflection.log");
    conf.setGlobally(el::ConfigurationType::MaxLogFileSize, "10240");
#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    conf.setGlobally(el::ConfigurationType::PerformanceTracking, "true");
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif
    el::Loggers::setDefaultConfigurations(conf, true);

    LOG(INFO) << "ace_wind_deflection DLL Loaded by Intercept";
}

void Cleanup(void) {

}


BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
    )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
        Init();
        break;
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        Cleanup();
        break;
    }
    return TRUE;
}
