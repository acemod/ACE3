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
        strncpy_s(output, outputSize, ACE_FULL_VERSION_STR, _TRUNCATE);
        EXTENSION_RETURN();
    }

    #ifndef _WIN32
        EXTENSION_RETURN();
    #endif

    if (!strcmp(function, "--COMPLETE--"))
    {
        HGLOBAL hClipboardData = GlobalAlloc(GMEM_FIXED, gClipboardData.length() + 1);
        if (!hClipboardData)
        {
            result = "GlobalAlloc() failed, GetLastError=" + GetLastError();
            gClipboardData = "";
            EXTENSION_RETURN();
        }

        char *pClipboardData = (char *)GlobalLock(hClipboardData);
        if (!pClipboardData)
        {
            result = "GlobalLock() failed, GetLastError=" + GetLastError();
            gClipboardData = "";
            EXTENSION_RETURN();
        }

        strncpy_s(pClipboardData, gClipboardData.length(), gClipboardData.c_str(), _TRUNCATE);

        GlobalUnlock(hClipboardData);

        if (!OpenClipboard(NULL))
        {
            result = "OpenClipboard() failed, GetLastError=" + GetLastError();
        }
        else
        {
            if (!EmptyClipboard())
            {
                result = "OpenClipboard() failed, GetLastError=" + GetLastError();
            }
            else
            {
                if (!SetClipboardData(CF_TEXT, hClipboardData))
                {
                    result = "SetClipboardData() failed, GetLastError=" + GetLastError();
                }
                else
                {
                    if (!CloseClipboard())
                    {
                        result = "CloseClipboard() failed, GetLastError=" + GetLastError();
                    }
                }
            }
        }

        gClipboardData = "";
    }
    else
    {
        gClipboardData = gClipboardData + cur_input;
    }

    if (result.length() > 1)
    {
        strncpy_s(output, outputSize, result.c_str(), _TRUNCATE);
    }

    EXTENSION_RETURN();
}
