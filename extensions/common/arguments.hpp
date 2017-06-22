#pragma once

#include "shared.hpp"
#include "vector.hpp"

#include <vector>
#include <string>

namespace ace {
    class argument_accessor {
    public:
        argument_accessor(const uint32_t index, const std::vector<std::string> & ar) : _index(index), _args(ar) { }

        const std::string & as_string() const { return _args[_index]; }
        operator const std::string &() const { return as_string(); }

        float as_float() const { return atof(_args[_index].c_str()); }
        operator float() const { return as_float(); }

        int as_int() const { return atoi(_args[_index].c_str()); }
        operator int() const { return as_int(); }

        int as_uint32() const { return (uint32_t)atoi(_args[_index].c_str()); }
        operator uint32_t() const { return as_uint32(); }

        ace::vector3<float> as_vector() const {
            std::vector<std::string> t = ace::split(_args[_index], ';');
            return ace::vector3<float>(atof(t[0].c_str()),
                atof(t[1].c_str()),
                atof(t[2].c_str()));
        }
        operator ace::vector3<float>() const { return as_vector(); }

    protected:
        const uint32_t                      _index;
        const std::vector<std::string> &    _args;
    };

    class arguments {
    public:
        arguments(const std::string & str) : _original(str) {
            _args = ace::split(str, ',');
            for (int i = 0; i < _args.size(); i++) {
                _args[i] = trim(_args[i]);
            }
        }

        size_t size() const { return _args.size(); }

        const argument_accessor operator[] (int index) const { return argument_accessor(index, _args); }

        const std::string & as_string(uint32_t _index) const { return _args[_index]; }
        float as_float(uint32_t _index) const { return atof(_args[_index].c_str()); }
        int as_int(uint32_t _index) const { return atoi(_args[_index].c_str()); }
        int as_uint32(uint32_t _index) const { return (uint32_t)atoi(_args[_index].c_str()); }
        ace::vector3<float> as_vector(uint32_t _index) const {
            std::vector<std::string> t = ace::split(_args[_index], ';');
            return ace::vector3<float>(atof(t[0].c_str()),
                atof(t[1].c_str()),
                atof(t[2].c_str()));
        }

        const std::string & get() const {
            return _original;
        }

        std::string create(const std::string & command) const {
            std::stringstream ss;
            ss << command << ":";

            for (auto & v : _args) {
                ss << v << ",";
            }

            // Remove the trailing ,
            std::string result = ss.str();
            result.erase(result.length());

            return result;
        }
        static std::string create(const std::string & command, const arguments & args) {
            return args.create(command);
        }
        

    protected:
        std::vector<std::string> _args;
        const std::string        _original;
    };
}