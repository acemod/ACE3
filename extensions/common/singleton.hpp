#include <cstdint>
#include <assert.h>

#pragma once

namespace ace {
    template<typename T>
    class singleton {
    public:
        static T & get() {
            
            if (_singletonInstance == nullptr) {
                assert(_initialized == false);
                _initialized = true;
                _singletonInstance = new T();
            }
                
            return *_singletonInstance;
        }
        static void release() {
            delete _singletonInstance;
        }
    protected:
        static T *_singletonInstance;
        static bool _initialized;
    };
    template<typename T>
    T* singleton<T>::_singletonInstance = nullptr;
    template<typename T>
    bool singleton<T>::_initialized = false;
}