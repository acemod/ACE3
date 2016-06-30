#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// TODO load from config instead of hardcoded in sqf
GVAR(ALL_DETECTABLE_TYPES) = ["ACE_Explosive_Object", "ACE_Explosive_Helper", "ACE_Explosives_Place", "ModuleMine_F", "TimeBombCore", "MineBase", "DirectionalBombBase", "BoundingMineBase", "PipeBombBase"];

ADDON = true;
