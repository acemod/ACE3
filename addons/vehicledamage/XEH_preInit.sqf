#include "script_component.hpp"

ADDON = false;

// Extension engine functions
PREP(initializeExtension);
PREP(monitorResultsPFH);
PREP(parseResult);

PREP(callExtension);

GVAR(async) = true;
GVAR(ready) = false;

// Extension dispatch events
PREP(setAnimationNames);
PREP(doDamageResults);

// To extension send events
PREP(getAnimationStates);

// Core functionality
PREP(registerVehicleDamageHandler);
PREP(registerVehicleWithExtension);
PREP(unregisterWithExtension);

PREP(dispatchHitPart);
PREP(dispatchDamage);
PREP(doHit);


GVAR(vehicle_id) = 0;
GVAR(vehicles) = HASH_CREATE;

// Begin Debug functions
// **************************

#ifdef DEBUG_LOG_EXTENSION
GVAR(debug_log) = [];
PREP(debug_exportLogClipboard);
PREP(debug_exportLogFile);
PREP(debug_animateCurrentVehicle);
#endif
#ifdef DEBUG_EXTENSION_DYNLOAD
// This value is used for debug loading of the extension with dynload
GVAR(extensionLibrary) = "z\ace\extensions\build\vd\Debug\ace_vd_Debug.dll";
#endif

#ifdef DEBUG_DRAW_LINES
GVAR(debug_lines) = [];

PREP(debug_drawFace);
PREP(debug_drawLinesPFH);
#endif

// **************************
// End debug functions

FUNC(_textVector) = {
    private["_str"];
    _str = format["%1;%2;%3", ((_this select 0) select 0), ((_this select 0) select 1), ((_this select 0) select 2)];
    _str
};

[] call FUNC(initializeExtension);

ADDON = true;
