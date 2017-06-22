#pragma once

#ifdef _WIN32

#include <cstdint>
#include <string>
#include <vector>

#include <Winsock2.h>

namespace ace { 
    class pipe_pair {
    public:
      pipe_pair(bool inherit_fd2 = false, bool blocking = true);
      HANDLE fd1() const { return srv_; }
      HANDLE fd2() const { return cln_; }

      static HANDLE open_pipe_server(const wchar_t* name, bool low_integrity = true, bool blocking = true);
      static HANDLE open_pipe_client(const wchar_t* name, bool inherit, bool impersonate);

    private:
      HANDLE srv_;
      HANDLE cln_;
    };

    class pipe_win {
    public:
      pipe_win();
      ~pipe_win();

      bool open_client(HANDLE pipe);
      bool open_server(HANDLE pipe, bool connect = false);

      bool write(const void* buf, size_t sz);
      bool read(void* buf, size_t* sz);

      bool CheckStatus();
      bool IsConnected() const { return INVALID_HANDLE_VALUE != pipe_; }

    private:
      HANDLE pipe_;
    };


    class PipeTransport : public pipe_win {
    public:
      static const size_t kBufferSz = 4096;

      size_t send(const void* buf, size_t sz) {
        return write(buf, sz) ? -1 : 0;
      }

      char* receive(size_t* size);

    private:
      std::vector<char> buf_;
    };
}

#endif
