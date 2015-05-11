#include <Windows.h>
#include <algorithm>

#include "directx/d3d_display.hpp"

#include "CommonStates.h"
#include "DDSTextureLoader.h"
#include "Effects.h"
#include "GeometricPrimitive.h"
#include "Model.h"
#include "PrimitiveBatch.h"
#include "ScreenGrab.h"
#include "SpriteBatch.h"
#include "SpriteFont.h"
#include "VertexTypes.h"

#include "simulation/object.hpp"
#include "p3d/parser.hpp"

using namespace ace::debug;
using namespace DirectX;

INITIALIZE_EASYLOGGINGPP

extern "C" {
    void __stdcall RVExtension(char *output, int outputSize, const char *function);
};
//void __stdcall RVExtension(char *output, int outputSize, const char *function);

int main(int argc, char **argv) {
    char buffer[4096], output[4096];
    std::ifstream filestream, inputstream;

    el::Configurations log_conf;
    log_conf.setGlobally(el::ConfigurationType::Filename, "logs/ace_longrod_dxtk_test.log");

#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    //%d%M%Y-%H:%m:%s.%g            
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif

    if (argc < 2)
        return -1;

    filestream.open(argv[1], std::ios::binary | std::ios::in);
    if (!filestream.good()) {
        LOG(ERROR) << "Cannot open file";
        return -1;
    }


    inputstream.open(argv[2], std::ios::binary | std::ios::in);
    if (!inputstream.good()) {
        LOG(ERROR) << "Cannot open file";
        return -1;
    }

    for (std::string line; std::getline(inputstream, line); ) {
        if (line[0] != '#' && line.length() > 4) {
            line.erase(std::remove(line.begin(), line.end(), '\r'), line.end());
            line.erase(std::remove(line.begin(), line.end(), '\n'), line.end());
           
            memset(output, 0x00, sizeof(output));
            LOG(INFO) << "Executing: '" << line.c_str() << "'";
            RVExtension(output, sizeof(output), line.c_str());
            LOG(INFO) << "Result: '" << output << "'";
        }
    }

    while (true) {
        scanf_s("%s", buffer, sizeof(buffer) - 1);
        memset(output, 0x00, sizeof(output));
        LOG(INFO) << "Executing: '" << buffer << "'";
        RVExtension(output, sizeof(output), buffer);
        LOG(INFO) << "Result: '" << output << "'";
    }
}