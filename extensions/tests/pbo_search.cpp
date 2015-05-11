#include "shared.hpp"
#include "membuf.hpp"
#include "logging.hpp"
#include "pbo/search.hpp"

INITIALIZE_EASYLOGGINGPP


int main(int argc, char **argv) {
    //ace::p3d::parser _parser;
    
    el::Configurations log_conf;
    log_conf.setGlobally(el::ConfigurationType::Filename, "logs/pbo_search.log");

#ifdef _DEBUG
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "[%datetime] - %level - {%loc}t:%thread- %msg");
    //%d%M%Y-%H:%m:%s.%g            
#else
    el::Loggers::reconfigureAllLoggers(el::ConfigurationType::Format, "%datetime-{%level}- %msg");
#endif
    std::fstream filestream;
    ace::pbo::archive_p _archive = nullptr;

    if (argc < 2) {
        LOG(ERROR) << "No pbo name provided";
        return -1;
    }

    filestream.open(argv[1], std::ios::binary | std::ios::in);
    if (!filestream.good()) {
        LOG(ERROR) << "Cannot open file";
        return -1;
    }

    ace::pbo::search _pbo_searcher(".*\.p3d");

    for (auto & kv : _pbo_searcher.file_index()) {
        LOG(INFO) << "Index: " << kv.first << " : " << kv.second;
    }

    getchar();

    return 0;
} 