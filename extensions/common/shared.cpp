#include "shared.hpp"

#include <algorithm> 
#include <functional> 
#include <cctype>
#include <locale>

int test(int var) {
    return var;
}
namespace ace {
    std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems) {
        std::stringstream ss(s);
        std::string item;
        while (std::getline(ss, item, delim)) {
            elems.push_back(item);
        }
        return elems;
    }

    std::vector<std::string> split(const std::string &s, char delim) {
        std::vector<std::string> elems;
        split(s, delim, elems);
        return elems;
    }

    void runtime_assert(bool result) {
        assert(result);
        if (!result) {
            LOG(ERROR) << "ACE Assertion failed, execution cancelling";
            throw exception(-1, "assertion failed");
        }
    }
    void runtime_assert(bool result, const uint32_t code, const std::string & text) {
        assert(result);
        if (!result) {
            LOG(ERROR) << "ACE Assertion failed, execution cancelling";
            throw exception(code, text);
        }
    }
}