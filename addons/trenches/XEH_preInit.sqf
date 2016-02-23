#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Trench types
// Name of the object, name of th dummy no geo object, dx, dy
GVAR(trenchSmall) = ["ACE_envelope_small", "ACE_envelope_small_NoGeo", 2, 3, 0.35];
GVAR(trenchBig) = ["ACE_envelope_big", "ACE_envelope_big_NoGeo", 6, 1.1, 0.20];
GVAR(trenchType) = GVAR(trenchSmall);

ADDON = true;
