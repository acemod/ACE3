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

INITIALIZE_EASYLOGGINGPP

example::shot_tracker tracker;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::on_frame() {
    tracker.on_frame();
}


void __cdecl intercept::post_init() {

}

void __cdecl intercept::mission_stopped() {

}

void __cdecl intercept::fired(
    object &unit_,
    std::string &weapon_,
    std::string &muzzle_,
    std::string &mode_,
    std::string &ammo_,
    std::string &magazine_,
    object &projectile_)
{
    /*
    intercept::sqf::config_entry test;
    test = test >> "CfgAmmo" >> ammo_ >> "hit";
    float test_val = sqf::get_number(test);
    LOG(DEBUG) << "HIT: " << test_val;
    */
    tracker.add_shot(projectile_, ammo_);
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
