#include "script_component.hpp"

// Initialize our event handlers

GVAR(ready) = false;

#ifdef ACE_EXTENSION_DYNLOAD
"ace_dynload" callExtension format["load:%1", GVAR(extensionLibrary)];
#endif

"init:" call FUNC(callExtension);

#ifdef ACE_VEHICLEDAMAGE_RENDER_DEBUG
"debug_render:" call FUNC(callExtension);
#endif

[{ 
    private["_result"];
    // Wait until the extension is ready
    _result = "ready" call FUNC(callExtension);
    if(_result == "0") then {
        diag_log text format["[ACE] - Vehicle damage extension initialized"];
        GVAR(ready) = true;
    };
}, 0, [] ] CBA_fnc_addPerFrameHandler;