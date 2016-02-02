/*
 * ace_nametags.cpp
 * Author: esteldunedain
 * Implements nametags using Intercept
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

#include "nametagger.hpp"

using namespace intercept;
using namespace ace::nametags;

INITIALIZE_EASYLOGGINGPP

nametagger tagger;

int __cdecl intercept::api_version() {
    return 1;
}

void __cdecl intercept::on_frame() {
    LOG(INFO) << "ace_nametags on_frame";
    tagger.on_frame();
}


void __cdecl intercept::post_init() {

}

void __cdecl intercept::mission_stopped() {

}

void __cdecl intercept::on_signal(
    std::string &signal_name_,
    game_value &value1_)
{
    LOG(INFO) << "ace_nametags on_signal: " << signal_name_;
}

void Init(void) {
    el::Configurations conf;

    conf.setGlobally(el::ConfigurationType::Filename, "logs/ace_nametags.log");
    conf.setGlobally(el::ConfigurationType::MaxLogFileSize, "10240");
#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    conf.setGlobally(el::ConfigurationType::PerformanceTracking, "true");
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif
    el::Loggers::setDefaultConfigurations(conf, true);

    LOG(INFO) << "ace_nametags DLL Loaded by Intercept";
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
