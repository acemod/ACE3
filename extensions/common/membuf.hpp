#pragma once

#include <streambuf>

namespace ace {
    class membuf : public std::streambuf
    {
    public:
        membuf(char* mem, size_t length) {

            setg(mem, mem, mem + length);
            setp(mem, mem + length);
        }

        int_type underflow() {
            if (gptr() >= egptr()) {
                return traits_type::eof();
            }
            return traits_type::to_int_type(*gptr());
        }

        std::streampos seekpos(std::streampos pos, std::ios_base::openmode) {
            char *p = eback() + pos;
            if (p >= eback() && p <= egptr()) {
                setg(eback(), p, egptr());
                return pos;
            } else {
                return -1;
            }
        }

        std::streampos seekoff(std::streamoff off, std::ios_base::seekdir dir, std::ios_base::openmode) {
            char *p;
            switch (dir) {
            case std::ios_base::beg:
                p = eback() + off;
                break;
            case std::ios_base::cur:
                p = gptr() + off;
                break;
            case std::ios_base::end:
                p = egptr() - off;
                break;
            default:
                p = 0;
                break;
            }
            if (p >= eback() && p <= egptr()) {
                setg(eback(), p, egptr());
                return std::streampos(p - eback());
            } else {
                return -1;
            }
        }
    };
}