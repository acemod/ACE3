/*
 * ace_clipboard.cpp
 *
 * Takes a string and copies it to the clipboard; bypasses arma 8k clippy limit.
 *
 * Takes:
 * Localized string as string
 *
 * Returns:
 * None
 */
#include "ace_common.h"
#include <vector>
#include <string>

extern "C" {
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    std::string input(function);
    std::string result;

    if (input.length() < 1)
        return;

    #ifdef _WIN32

    HGLOBAL glob = GlobalAlloc(GMEM_FIXED, input.length()+1);
    
    memcpy(glob, input.c_str(), input.length());
    ((char *)glob)[input.length() + 1] = 0x00;
         
    if (!OpenClipboard(NULL)) {
        result = "OpenClipboard() failed, GetLastError=" + GetLastError();
    } else {
        if (!EmptyClipboard()) {
            result = "OpenClipboard() failed, GetLastError=" + GetLastError();
        } else {
            if (!SetClipboardData(CF_TEXT, glob)) {
                result = "SetClipboardData() failed, GetLastError=" + GetLastError();
            } else {
                if (!CloseClipboard()) {
                    result = "CloseClipboard() failed, GetLastError=" + GetLastError();
                }
            }
        }
    }

 end:
    memcpy(output, result.c_str(), result.length()+1);

    #endif

    
}

