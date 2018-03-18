#include "stdafx.h"
#include "windows.h"
#include "string.h"
#include <stdlib.h>

extern "C" {
    __declspec (dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    INPUT ip;
    ip.type = INPUT_MOUSE;
    ip.mi.mouseData = 0;
    ip.mi.dwFlags = MOUSEEVENTF_MOVE;
    ip.mi.time = 0;

    int x, y;
    if (strncmp(function, "x", 1)) {
        ip.mi.dx = atoi(&function[1]);
        ip.mi.dy = 0;
    } else if (strncmp(function, "y", 1)) {
        ip.mi.dy = atoi(&function[1]);
        ip.mi.dx = 0;
    } else {
        strncpy_s(output, outputSize, "error", _TRUNCATE);
        return;
    }

    SendInput(1, &ip, sizeof(INPUT));

    strncpy_s(output, outputSize, "ok", _TRUNCATE);
}
