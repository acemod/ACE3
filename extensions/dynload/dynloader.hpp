#pragma once

#include "shared.hpp"
#include "dispatch.hpp"
#include "arguments.hpp"

typedef void (__stdcall *RVExtension)(char *output, int outputSize, const char *function);

namespace ace {

    class module {
    public:
        module() : handle(nullptr), function(nullptr), name("") {}
        module(const std::string & name_, HMODULE handle_, RVExtension function_, const std::string & file_) : handle(handle_), function(function_), name(name_), temp_filename(file_) {}

        std::string name;
        std::string temp_filename;
        HMODULE     handle;
        RVExtension function;
    };

    class dynloader : public singleton<dynloader> {
    public:
        dynloader() {}
        ~dynloader() {
            for (auto & kv : _modules) {
                arguments temp(kv.first);
                std::string result_temp;
                unload(temp, result_temp);
            }
        }

#ifdef _WINDOWS
        bool load(const arguments & args_, std::string & result) {
            HMODULE dllHandle;
            RVExtension function;

            LOG(INFO) << "Load requested [" << args_.as_string(0) << "]";

            if (_modules.find(args_.as_string(0)) != _modules.end()) {
                LOG(ERROR) << "Module already loaded [" << args_.as_string(0) << "]";
                return true;
            }

#ifdef _WINDOWS
            // Make a copy of the file to temp, and load it from there, referencing the current path name
            char tmpPath[MAX_PATH +1], buffer[MAX_PATH + 1];

            if(!GetTempPathA(MAX_PATH, tmpPath)) {
                LOG(ERROR) << "GetTempPath() failed, e=" << GetLastError();
                return false;
            }
            if(!GetTempFileNameA(tmpPath, "ace_dynload", TRUE, buffer)) {
                LOG(ERROR) << "GetTempFileName() failed, e=" << GetLastError();
                return false;
            }
            std::string temp_filename = buffer;
            if (!CopyFileA(args_.as_string(0).c_str(), temp_filename.c_str(), FALSE)) {
                DeleteFile(temp_filename.c_str());
                if (!CopyFileA(args_.as_string(0).c_str(), temp_filename.c_str(), FALSE)) {
                    LOG(ERROR) << "CopyFile() , e=" << GetLastError();
                    return false;
                }
            }
#else
            std::string temp_filename = args_.as_string(0);
#endif

            dllHandle = LoadLibrary(temp_filename.c_str());
            if (!dllHandle) {
                LOG(ERROR) << "LoadLibrary() failed, e=" << GetLastError() << " [" << args_.as_string(0) << "]";
                return false;
            }

            function = (RVExtension)GetProcAddress(dllHandle, "_RVExtension@12");
            if (!function) {
                LOG(ERROR) << "GetProcAddress() failed, e=" << GetLastError() << " [" << args_.as_string(0) << "]";
                FreeLibrary(dllHandle);
                return false;
            }

            LOG(INFO) << "Load completed [" << args_.as_string(0) << "]";

            _modules[args_.as_string(0)] = module(args_.as_string(0), dllHandle, function, temp_filename);

            return false;
        }
        bool unload(const arguments & args_, std::string & result) {

            LOG(INFO) << "Unload requested [" << args_.as_string(0) << "]";

            if (_modules.find(args_.as_string(0)) == _modules.end()) {
                LOG(INFO) << "Unload failed, module not loaded [" << args_.as_string(0) << "]";
                return true;
            }

            if (!FreeLibrary(_modules[args_.as_string(0)].handle)) {
                LOG(INFO) << "FreeLibrary() failed during unload, e=" << GetLastError();
                return false;
            }
            //if (!DeleteFileA(_modules[args_.as_string(0)].temp_filename.c_str())) {
            //    LOG(INFO) << "DeleteFile() failed during unload, e=" << GetLastError();
            //    return false;
            //}

            _modules.erase(args_.as_string(0));

            LOG(INFO) << "Unload complete [" << args_.as_string(0) << "]";

            return true;
        }
#endif

        bool call(const arguments & args_, std::string & result) {
            //LOG(INFO) << "Calling [" << args_.as_string(0) << "]";

            if (_modules.find(args_.as_string(0)) == _modules.end()) {
                return false;
            }

            result = "";
            result.resize(4096);

            std::string function_str;
            std::vector<std::string> temp = ace::split(args_.get(), ',');

            if (temp.size() < 3) {
                function_str = temp[1];
            } else {
                for (int x = 1; x < temp.size(); x++)
                    function_str = function_str + temp[x] + ",";
            }
            _modules[args_.as_string(0)].function((char *)result.c_str(), 4096, (const char *)function_str.c_str());
#ifdef _DEBUG
            //if (args_.as_string(0) != "fetch_result" && args_.as_string(0) != "ready") {
            //    LOG(INFO) << "Called [" << args_.as_string(0) << "], with {" << function_str << "} result={" << result << "}";
            //}
#endif
            return true;
        }

        bool list(const arguments & args_, std::string & result) {

            LOG(INFO) << "Listing loaded modules";
            std::string res;

            for (auto & kv : _modules) {
                res = res + kv.first + ", ";
                LOG(INFO) << "\t" << kv.first;
            }

            result = res;

            return false;
        }
        
        bool register_functions() {
            dispatch::get().add("list", std::bind(&ace::dynloader::list, this, std::placeholders::_1, std::placeholders::_2));
            dispatch::get().add("load", std::bind(&ace::dynloader::load, this, std::placeholders::_1, std::placeholders::_2));
            dispatch::get().add("unload", std::bind(&ace::dynloader::unload, this, std::placeholders::_1, std::placeholders::_2));
            dispatch::get().add("call", std::bind(&ace::dynloader::call, this, std::placeholders::_1, std::placeholders::_2));

            return true;
        }
    protected:
        std::unordered_map<std::string, module> _modules;
    };
};
