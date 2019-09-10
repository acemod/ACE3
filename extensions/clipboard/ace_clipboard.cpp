/*
 * ace_clipboard.cpp
 *
 * Takes a string and copies it to the clipboard; bypasses arma 8k clippy limit. Windows only.
 *
 * Takes:
 * Localized string as string
 *
 * Returns:
 * None
 */

#include "shared.hpp"

#include <stdlib.h>
#include <vector>
#include <string>

extern "C" {
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

std::string gClipboardData;

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    std::string cur_input(function);
    std::string result;

    ZERO_OUTPUT();

    if (cur_input.length() < 1) {
        EXTENSION_RETURN();
    }

    if (!strcmp(function, "version")) {
        std::strncpy(output, ACE_FULL_VERSION_STR, outputSize);
        EXTENSION_RETURN();
    }

    #ifdef _WIN32

    if (!strcmp(function, "--COMPLETE--")) {
        if (OpenClipboard(NULL) == 0) {
            result = "OpenClipboard() failed, GetLastError=" + GetLastError();
        } else {
            if (EmptyClipboard() == 0) {
                result = "EmptyClipboard() failed, GetLastError=" + GetLastError();
            } else {
                // GPTR = GMEM_FIXED + GMEM_ZEROINIT, returns a ptr, no need for GlobalLock/GlobalUnlock
                char *pClipboardData = (char *)GlobalAlloc(GPTR, gClipboardData.length());

                if (pClipboardData == NULL) {
                    result = "GlobalAlloc() failed, GetLastError=" + GetLastError();
                    EXTENSION_RETURN();
                }
                strncpy(pClipboardData, gClipboardData.c_str(), gClipboardData.length());

                // if success, system owns the memory, if fail, free it from the heap
                if (SetClipboardData(CF_TEXT, pClipboardData) == NULL) {
                    result = "SetClipboardData() failed, GetLastError=" + GetLastError();
                    GlobalFree(pClipboardData);
                } else {
                    if (CloseClipboard() == 0) {
                        result = "CloseClipboard() failed, GetLastError=" + GetLastError();
                    }
                }
            }
        }
        gClipboardData = "";
    } else {
        gClipboardData = gClipboardData + cur_input;
    }

    if (result.length() > 1) {
        strncpy(output, result.c_str(), outputSize);
    }

    #endif

    EXTENSION_RETURN();
}
