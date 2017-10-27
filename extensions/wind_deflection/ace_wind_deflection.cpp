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
#include <windows.h>
//#include "intercept.hpp"

#define PI 3.14159265f

#define DEG(x) (x * 180.0f / PI)
#define RAD(x) (x / 180.0f * PI)

 //using namespace intercept;
 ////using namespace ace::wind_deflection;
 //
 //int __cdecl intercept::api_version() {
 //    return 1;
 //}
 //
 //void __cdecl intercept::on_frame() {
 // 
 //}
 //
 //
 //void __cdecl intercept::post_init() {
 //
 //}
 //
 //void __cdecl intercept::mission_stopped() {
 //
 //}


BOOL APIENTRY DllMain(HMODULE hModule,
    DWORD  ul_reason_for_call,
    LPVOID lpReserved
    )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH: break;
    }
    return TRUE;
}
