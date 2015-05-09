#pragma once

#include "targetver.h"
#include <assert.h>
#include <stdio.h>
#include <string>
#include <vector>
#include <list>
#include <map>
#include <unordered_map>
#include <memory>
#include <cmath>
#include <cstdint>
#include <streambuf>
#include "ace_version.hpp"
#include "logging.hpp"

#ifdef _DEBUG
#define ZERO_OUTPUT()    { memset(output, 0x00, outputSize); }
#define EXTENSION_RETURN() {output[outputSize-1] = 0x00; } return;
#else
#define ZERO_OUTPUT()
#define EXTENSION_RETURN() return;
#endif

namespace ace {
    template< typename T >
    struct array_deleter
    {
        void operator ()(T const * p)
        {
            delete[] p;
        }
    };

    std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems);
    std::vector<std::string> split(const std::string &s, char delim);

    inline void runtime_assert(bool result);

    struct exception {
        exception(const uint32_t code_, const std::string & text_) : code(code_), text(text_) {}
        
        exception & operator= (const exception& other) { code = other.code; text = other.text;  return *this; }
        bool operator == (const exception &r) const { return ( code == r.code ); }

        uint32_t        code;
        std::string     text;
    };
}

#ifdef _DEBUG
#define ACE_ASSERT assert()
#else
#define ACE_ASSERT ace::runtime_assert()
#endif