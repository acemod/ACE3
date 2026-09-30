#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if (isServer) then {
    GVAR(sound_hash) = createHashMap;
    GVAR(sound_pure) = QGVAR(pure);

    GVAR(objects) = [];
    GVAR(initialisedObjects) = createHashMap;
};