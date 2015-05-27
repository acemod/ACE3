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
#include "shared.hpp"
#include <vector>
#include <string>

extern "C" {
    EXPORT void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

std::string gClipboardData;

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    std::string cur_input(function);
    std::string result;

    ZERO_OUTPUT();

    if (cur_input.length() < 1) {
        EXTENSION_RETURN();
    }

    if (!strcmp(function, "version")) {
        strncpy(output, ACE_FULL_VERSION_STR, outputSize);
        EXTENSION_RETURN();
    }

#ifdef _WIN32

    if (!strcmp(function, "--COMPLETE--")) {
        HGLOBAL hClipboardData = GlobalAlloc(GMEM_FIXED, gClipboardData.length() + 1);
        if (!hClipboardData) {
            result = "GlobalAlloc() failed, GetLastError=" + GetLastError();
            gClipboardData = "";
            EXTENSION_RETURN();
        }

        char *pClipboardData = (char *)GlobalLock(hClipboardData);
        if (!pClipboardData) {
            result = "GlobalLock() failed, GetLastError=" + GetLastError();
            gClipboardData = "";
            EXTENSION_RETURN();
        }
        memcpy(pClipboardData, gClipboardData.c_str(), gClipboardData.length());
        pClipboardData[gClipboardData.length() + 1] = 0x00;

        GlobalUnlock(hClipboardData);

        if (!OpenClipboard(NULL)) {
            result = "OpenClipboard() failed, GetLastError=" + GetLastError();
        }
        else {
            if (!EmptyClipboard()) {
                result = "OpenClipboard() failed, GetLastError=" + GetLastError();
            }
            else {
                if (!SetClipboardData(CF_TEXT, hClipboardData)) {
                    result = "SetClipboardData() failed, GetLastError=" + GetLastError();
                }
                else {
                    if (!CloseClipboard()) {
                        result = "CloseClipboard() failed, GetLastError=" + GetLastError();
                    }
                }
            }
        }

        gClipboardData = "";
    } else {
        gClipboardData = gClipboardData + cur_input;
    }

    end:
        if(result.length() > 1)
            memcpy(output, result.c_str(), result.length()+1);

    #endif

    EXTENSION_RETURN();
}

