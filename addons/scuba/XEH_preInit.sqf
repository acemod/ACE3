#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(inertGasTypes) = ["nitrogen", "helium"];
GVAR(inertGasHalftimes) = [
    [4, 8, 12.5, 18.5, 27, 38.3, 54.3, 77, 109, 146, 187, 239, 305, 390, 498, 635],
    [1.5, 3.0, 4.7, 7.0, 10.2, 14.5, 20.5, 29.1, 41.1, 55.1, 70.6, 90.2, 115.1, 147.2, 187.9, 239.6]
];
GVAR(interGasAValues) = GVAR(inertGasHalftimes) apply {_x apply {
    2 * _x ^ (-1/3)
}};
GVAR(interGasBValues) = GVAR(inertGasHalftimes) apply {_x apply {
    1.005 - (_x ^ (-1/2))
}};

ADDON = true;
