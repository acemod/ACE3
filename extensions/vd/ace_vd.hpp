#pragma once

#if defined(ace_vd_EXPORTS)
#define ACE_VD_EXPORT __declspec (dllexport)
#elif defined(ace_vd_IMPORTS)
#define ACE_VD_EXPORT __declspec (dllimport)
#else
#define ACE_VD_EXPORT
#endif

extern "C" {
    ACE_VD_EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
};