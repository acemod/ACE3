#include "script_component.hpp"

ADDON = false;

// Extension engine functions
PREP(initializeExtension);
PREP(monitorResultsPFH);
PREP(parseResult);

PREP(callExtension);

GVAR(async) = true;
GVAR(ready) = false;

#ifdef DEBUG_LOG_EXTENSION
GVAR(debug_log) = [];
#endif
#ifdef DEBUG_EXTENSION_DYNLOAD
// This value is used for debug loading of the extension with dynload
GVAR(extensionLibrary) = "z\ace\extensions\build\vd\Debug\ace_vd_Debug.dll";
#endif

// Extension dispatch events
PREP(setAnimationNames);

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

FUNC(_textVector) = {
    private["_str"];
    _str = format["%1;%2;%3", ((_this select 0) select 0), ((_this select 0) select 1), ((_this select 0) select 2)];
    _str
};

#ifdef DEBUG_LOG_EXTENSION
FUNC(clipboardExport) = {
    private["_chunks"];
    _chunks = [];
    
    _chunks = [_this select 0, ";"] call CBA_fnc_split;
    
    {
        private["_chunk"];
        _chunk = _x + ";";
        "ace_clipboard" callExtension format["%1", _chunk];
    } forEach _chunks;
    
    "ace_clipboard" callExtension "--COMPLETE--";
};
FUNC(exportLog) = {
    private["_chunks"];
    _chunks = [str(_this select 0), ","] call CBA_fnc_split;
    
    {
        private["_chunk"];
        _chunk = _x + ";";
        "ace_clipboard" callExtension format["%1", _chunk];
    } forEach _chunks;
    
    "ace_clipboard" callExtension "--COMPLETE--";
};
#endif



[] call FUNC(initializeExtension);

ADDON = true;
