#include "vector.hpp"


namespace ace {
    template <> float acos(float n) { return std::acosf(n); }
    template <> double acos(double n) { return std::acos(n); }
    template <> float cos(float n) { return std::cosf(n); }
    template <> double cos(double n) { return std::cos(n); }
    template <> float sin(float n) { return std::sinf(n); }
    template <> double sin(double n) { return std::sin(n); }
}