/*
 * Author: Ruthberg
 *
 * Calculates the terrain hellmann exponent at a given world position
 *
 * Arguments:
 * 0: _this - world position <posASL>
 *
 * Return Value:
 * 0: hellmann exponent <NUMBER>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_hellmann_exponents", "_hellmann_index", "_windSource", "_nearObjects", "_isWater"];

// Source: https://en.wikipedia.org/wiki/Wind_gradient
// Entries 0-2 -> open water surface; Entries 3-5 -> flat open coast; Entries 6-8 -> human inhabited areas
// Sorting: open water surface/flat open coast/human inhabited areas & stable air/neutral air/unstable air
_hellmann_exponents = [0.27, 0.10, 0.06, 0.40, 0.16, 0.11, 0.60, 0.34, 0.27];
_hellmann_exponent = 0.14;

_windSource = _this vectorDiff ((vectorNormalized wind) vectorMultiply 25);

_nearObjects = count (_windSource nearObjects ["Building", 50]);
_isWater = surfaceIsWater _this;

_hellmann_index = 0 max floor(overcast * 3) min 2;

if (_nearObjects >= 5) then {
    _hellmann_exponent = _hellmann_exponents select (_hellmann_index + 6);
};
if (_nearObjects < 5) then {
    _hellmann_exponent = _hellmann_exponents select (_hellmann_index + 3);
};
if (_nearObjects == 0 && _isWater) then {
    _hellmann_exponent = _hellmann_exponents select (_hellmann_index + 0);
};

_hellmann_exponent
