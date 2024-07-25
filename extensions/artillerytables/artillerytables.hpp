/*
 * artillerytables.hpp
 * Author: PabstMirror
 */

// ace libs:
#include "vector.hpp"
#include "shared.hpp"
#define RETURN_INVALID_FUNCTION     -1001
#define RETURN_WRONG_ARG_COUNT      -1002

extern "C" {
    EXPORT void __stdcall RVExtension(char* output, int outputSize, const char* function);
    EXPORT int __stdcall RVExtensionArgs(char* output, int outputSize, const char* function, const char** argv, int argc);
    EXPORT void __stdcall RVExtensionVersion(char* output, int outputSize);
}

std::tuple<double, double, double> simulateShot(const double _fireAngleRad, const double _muzzleVelocity, const double _heightOfTarget, const double _crossWind, const double _tailWind, const double _temperature, const double _airDensity, double _airFriction);
std::tuple<double, double> findMaxAngle(const double _muzzleVelocity, const double _airFriction);
std::tuple<double, double, double> simulateFindSolution(const double _rangeToHit, const double _heightToHit, const double _muzzleVelocity, const double _airFriction, const double _minElev, const double _maxElev, const bool _highArc);
void writeNumber(std::stringstream & ss, double _num, const int _widthInt, const int _widthDec);
std::string simulateCalcRangeTableLine(const double _rangeToHit, const double _muzzleVelocity, const double _airFriction, const double _minElev, const double _maxElev, const bool _highArc);
