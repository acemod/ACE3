#include "shared.hpp"
#include "logging.hpp"
#include "controller.hpp"
INITIALIZE_EASYLOGGINGPP

BOOLEAN WINAPI DllMain(IN HINSTANCE hDllHandle,
    IN DWORD     nReason,
    IN LPVOID    Reserved) {
    BOOLEAN bSuccess = TRUE;
    el::Configurations conf;

    switch (nReason) {
    case DLL_PROCESS_ATTACH:
        conf.setGlobally(el::ConfigurationType::Filename, "logs/ace_vd.log");
        conf.setGlobally(el::ConfigurationType::MaxLogFileSize, "1073741824");
#ifdef _DEBUG
        el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
        conf.setGlobally(el::ConfigurationType::PerformanceTracking, "true");
#else
        el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif
        el::Loggers::setDefaultConfigurations(conf, true);

        LOG(INFO) << "Vehicle Damage Loaded";

        break;
    case DLL_PROCESS_DETACH:
        if (Reserved == NULL) { 
            ace::vehicledamage::controller::get().stop();
            LOG(INFO) << "Vehicle Damage unloaded and halted";
        }
        break;
    }

    return bSuccess;

}