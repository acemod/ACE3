#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(halftimes) = [
    4, 8, 12.5, 18.5, 27, 38.3, 54.3, 77, 109, 146, 187, 239, 305, 390, 498, 635
];
GVAR(aValues) = GVAR(nitrogenHalftimes) apply {
    2 * _x ^ (-1/3)
};
GVAR(bValues) = GVAR(nitrogenHalftimes) apply {
    1.005 - (_x ^ (-1/2))
};

ADDON = true;
