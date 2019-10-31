#pragma once

/*
#ifdef USE_BULLET
#include "LinearMath\btVector3.h"
#endif
*/

#include "shared.hpp"

#ifndef _WIN32

#define sinf(x) sin(x)
#define cosf(x) cos(x)
#define acosf(x) acos(x)

#endif

namespace ace {

    template <typename T> T acos(T n) { return -1; }
    template <typename T> T cos(T n) { return -1; }
    template <typename T> T sin(T n) { return -1; }

    template<typename T>
    class vector3 {
    public:
        vector3() :
            _x(0),
            _y(0),
            _z(0) {
        }
        vector3(const T x_, const T y_, const T z_) :
            _x(x_),
            _y(y_),
            _z(z_) {
        }
        vector3(std::istream & read_) {
            // Constructor to read from a stream
            read_.read((char *)&_x, sizeof(T));
            read_.read((char *)&_y, sizeof(T));
            read_.read((char *)&_z, sizeof(T));
        }
        vector3(const float *buffer) {
            _x = buffer[0];
            _y = buffer[1];
            _z = buffer[2];
        }

        vector3& operator= (const vector3& other) { _x = other.x(); _y = other.y(); _z = other.z(); return *this; }
/*#ifdef _WIN32 && _DIRECTX
            vector3<T> & operator= (const XMFLOAT3& Float3) { _x = Float3.x; _y = Float3.y; _z = Float3.z; return *this; }
#endif

#ifdef USE_BULLET
        vector3<T> & operator= (const btVector3& bt_vec) { _x = bt_vec.x(); _y = bt_vec.y(); _z = bt_vec.z(); return *this; }
#endif
*/
        vector3 operator * (const T& val) const { return vector3(_x * val, _y * val, _z * val); }
        vector3 operator / (const T& val) const { T invVal = T(1) / val; return vector3(_x * invVal, _y * invVal, _z * invVal); }
        vector3 operator + (const vector3& v) const { return vector3(_x + v.x(), _y + v.y(), _z + v.z()); }
        vector3 operator / (const vector3& v) const { return vector3(_x / v.x(), _y / v.y(), _z / v.z()); }
        vector3 operator * (const vector3& v) const { return vector3(_x * v.x(), _y * v.y(), _z * v.z()); }
        vector3 operator - (const vector3& v) const { return vector3(_x - v.x(), _y - v.y(), _z - v.z()); }
        vector3 operator - () const { return vector3(-_x, -_y, -_z); }

        vector3& operator *=(const vector3& v) { _x *= v._x; _y *= v._y; _z *= v._z; return *this; }
        vector3& operator *=(T mag) { _x *= mag; _y *= mag; _z *= mag; return *this; }
        vector3& operator /=(const vector3& v) { _x /= v._x; _y /= v._y; _z /= v._z; return *this; }
        vector3& operator /=(T mag) { _x /= mag; _y /= mag; _y /= mag; return *this; }
        vector3& operator +=(const vector3& v) { _x += v._x; _y += v._y; _z += v._z; return *this; }
        vector3& operator -=(const vector3& v) { _x -= v._x; _y -= v._y; _z -= v._z; return *this; }


        bool operator == (const vector3 &r) const { return (_x == r.x() && _y == r.y() && _z == r.z()); }

        T magnitude() const { return sqrt(_x * _x + _y * _y + _z * _z); }
        T magnitude_squared() const { return _x * _x + _y * _y + _z * _z; }
        T dot(const vector3& v) const { return (_x * v.x() + _y * v.y() + _z * v.z()); }
        T distance(const vector3& v) const { vector3 dist = (*this - v); dist = dist * dist; return sqrt(dist.x() + dist.y() + dist.z()); }
        vector3 cross(const vector3& v) const { return vector3(_y * v.z() - _z * v.y(), _z * v.x() - _x * v.z(), _x * v.y() - _y * v.x()); }
        vector3 normalize() const { return (*this / abs(magnitude())); };
        bool zero_distance() const { return ((_x == 0.0f && _y == 0.0f && _z == 0.0f) ? true : false ); }

        static float clamp(T x, T a, T b) { return x < a ? a : (x > b ? b : x); }

        static vector3 lerp(const vector3& A, const vector3& B, const T t) { return A*t + B*(1.f - t); }
        vector3 lerp(const vector3& B, const T t) const { return vector3::lerp(*this, B, t);  } 

        static vector3 slerp(vector3 start, vector3 end, T percent) {
            T dot = start.dot(end);
            dot = vector3::clamp(dot, -1.0f, 1.0f);

            T theta = acos(dot) * percent;
            vector3 relative = end - start*dot;
            relative.normalize();
            return ((start * cos(theta)) + (relative*sin(theta)));
        }
        vector3 slerp(const vector3& B, const T p) const {
            return vector3::slerp(*this, B, p);
        }

        const T& x() const { return _x; }
        const T& y() const { return _y; }
        const T& z() const { return _z; }

        void x(const T val) { _x = val; }
        void y(const T val) { _y = val; }
        void z(const T val) { _z = val; }
    protected:
        T _x;
        T _y;
        T _z;
    };

    template<typename T, unsigned int N = 3>
    class vector {
    public:
        vector() :
            _values(std::vector<T>(N)) {
        }
        std::vector<T> _values;
    };


    template<typename T>
    class spatial {
    public:
        spatial() :
            position(vector3<T>()),
            orientation(vector3<T>())
        {
        }
        explicit spatial(const vector3<T> & position_, const vector3<T> & orientation_) :
            position(position_),
            orientation(orientation_)
        {}
        spatial<T> & operator= (const spatial<T> & other) { position = other.position; orientation = other.orientation; return *this; }
        vector3<T> position;
        vector3<T> orientation;
    };


    template<typename T>
    class pair {
    public:
        pair() :
            _x(0),
            _y(0) {
        }
        pair(const T x_, const T y_, const T z_) :
            _x(x_),
            _y(y_) {
        }
        pair(const float *buffer) {
            _x = buffer[0];
            _y = buffer[1];
        }
        pair(std::istream & read_) {
            // Constructor to read from a stream
            read_.read((char *)&_x, sizeof(T));
            read_.read((char *)&_y, sizeof(T));
        }

        pair<T> & operator= (const pair<T>& other) { _x = other.x(); _y = other.y();  return *this; }

        const T & x() const { return _x; }
        const T & y() const { return _y; }

        void x(const T val) { _x = val; }
        void y(const T val) { _y = val; }
    protected:
        T _x;
        T _y;
    };
}
