#include <Windows.h>

#include "logging.hpp"
INITIALIZE_EASYLOGGINGPP

#include "directx/d3d_display.hpp"

int main(int argc, char **argv) {
    ace::debug::d3d_display _display;
    _display.create(1024, 768, false);
    _display.init();
    _display.run();
}
