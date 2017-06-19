#ifdef _WIN32

#include "simplepipe_win32.hpp"
#include <Sddl.h>
#include <AccCtrl.h>
#include <Aclapi.h>

namespace ace {
    namespace {
    const wchar_t kPipePrefix[] = L"\\\\.\\pipe\\";
    const int kPipeBufferSz = 4 * 1024;
    }  // namespace

    bool checkIntegritySupport() {
      OSVERSIONINFO osvi;

      ZeroMemory(&osvi, sizeof(OSVERSIONINFO));
      osvi.dwOSVersionInfoSize = sizeof(OSVERSIONINFO);
      GetVersionEx(&osvi);

      return osvi.dwMajorVersion > 5;
    }

    LONG g_pipe_seq = 0;

    HANDLE pipe_pair::open_pipe_server(const wchar_t* name, bool low_integrity, bool blocking) {
      SECURITY_ATTRIBUTES sa = {0};
      SECURITY_ATTRIBUTES *psa = 0;
      DWORD wait;
      static const bool is_integrity_supported = checkIntegritySupport();

      if (is_integrity_supported && low_integrity) {
        psa = &sa;
        sa.nLength = sizeof(SECURITY_ATTRIBUTES);
        sa.bInheritHandle = TRUE;
        if (!ConvertStringSecurityDescriptorToSecurityDescriptor(
            TEXT("S:(ML;;NWNR;;;LW)"), SDDL_REVISION_1, &sa.lpSecurityDescriptor, NULL)) 
          return INVALID_HANDLE_VALUE;
      }

      if (blocking) {
          wait = PIPE_WAIT;
      } else {
          wait = PIPE_NOWAIT;
      }

      std::wstring pipename(kPipePrefix);
      pipename.append(name);
      return ::CreateNamedPipeW(pipename.c_str(), PIPE_ACCESS_DUPLEX | FILE_FLAG_FIRST_PIPE_INSTANCE,
                                PIPE_TYPE_BYTE | PIPE_READMODE_BYTE | wait,
                                1, kPipeBufferSz, kPipeBufferSz, 200, psa);
    }

    HANDLE pipe_pair::open_pipe_client(const wchar_t* name, bool inherit, bool impersonate) {
      std::wstring pipename(kPipePrefix);
      pipename.append(name);

      SECURITY_ATTRIBUTES sa = {sizeof(sa), NULL, inherit ? TRUE : FALSE};
      for (;;) {
        DWORD attributes = impersonate ? 0 : SECURITY_SQOS_PRESENT | SECURITY_IDENTIFICATION;
        HANDLE pipe = ::CreateFileW(pipename.c_str(), GENERIC_READ | GENERIC_WRITE, 0, &sa,
                                    OPEN_EXISTING, attributes, NULL);
        if (INVALID_HANDLE_VALUE == pipe) {
          if (ERROR_PIPE_BUSY != ::GetLastError()) {
            return pipe;
          }
          // wait and retry.
          if (! ::WaitNamedPipeW(pipename.c_str(), NMPWAIT_USE_DEFAULT_WAIT))
              continue;   
        } else {
          // success.
          return pipe;
        }
      }
    }


    pipe_pair::pipe_pair(bool inherit_fd2, bool blocking) : srv_(NULL), cln_(NULL) {
      // Come up with a reasonable unique name.
      const wchar_t kPipePattern[] = L"ko.%x.%x.%x";
      wchar_t name[8*3 + sizeof(kPipePattern)];
      ::wsprintfW(name, kPipePattern, ::GetCurrentProcessId(), ::GetTickCount(), 
                  ::InterlockedIncrement(&g_pipe_seq));
      HANDLE server = open_pipe_server(name, blocking);
      if (INVALID_HANDLE_VALUE == server) {
        return;
      }
      // Don't allow client impersonation.
      HANDLE client = open_pipe_client(name, inherit_fd2, false);
      if (INVALID_HANDLE_VALUE == client) {
        ::CloseHandle(server);
        return;
      }
      if (!::ConnectNamedPipe(server, NULL)) {
        if (ERROR_PIPE_CONNECTED != ::GetLastError()) {
          ::CloseHandle(server);
          ::CloseHandle(client);
        return;
        }
      }

      srv_ = server;
      cln_ = client;
    }


    pipe_win::pipe_win() : pipe_(INVALID_HANDLE_VALUE) {
    }

    pipe_win::~pipe_win() {
      if (pipe_ != INVALID_HANDLE_VALUE) {
        ::DisconnectNamedPipe(pipe_);  // $$$ disconect is valid on the server side.
        ::CloseHandle(pipe_);
      }
    }

    bool pipe_win::open_client(HANDLE pipe) {
      pipe_ = pipe;  
      return true;
    }

    bool pipe_win::open_server(HANDLE pipe, bool connect) {
      pipe_ = pipe;

      if (connect) {
        if (!::ConnectNamedPipe(pipe, NULL)) {
          if (ERROR_PIPE_CONNECTED != ::GetLastError()) {
            return false;
          }
        }
      }
      return true;
    }

    bool pipe_win::write(const void* buf, size_t sz) {
      DWORD written = 0;
      return (TRUE == ::WriteFile(pipe_, buf, sz, &written, NULL));
    }

    bool pipe_win::CheckStatus() {
        char buf[5];
        uint32_t size = sizeof(buf);
        BOOL ret;
        ret = ::ReadFile(pipe_, buf, sizeof(buf), reinterpret_cast<DWORD*>(&size), NULL);
        if (!ret) {
            if (GetLastError() == ERROR_NO_DATA) {
                return true;
            } else {
                return false;
            }
        } else {
            return true;
        }
    }

    bool pipe_win::read(void* buf, size_t* sz) {
        BOOL ret;    
        ret =  ::ReadFile(pipe_, buf, *sz, reinterpret_cast<DWORD*>(sz), NULL);
        if (!ret) {
            if (GetLastError() == ERROR_BROKEN_PIPE) {
                if (!DisconnectNamedPipe(pipe_)) {
                    printf("DisconnectNamedPipe() failed. hr=%08x", GetLastError());
                }
                if (!::ConnectNamedPipe(pipe_, NULL)) {
                }
            }
        }
        return ret;
    }


    char* PipeTransport::receive(size_t* size) {
      if (buf_.size() < kBufferSz)
        buf_.resize(kBufferSz);

      *size = kBufferSz;
      if (!read(&buf_[0], size))
        return NULL;
      return &buf_[0];
    }
}

#endif
