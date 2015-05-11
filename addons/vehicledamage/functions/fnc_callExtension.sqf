#include "script_component.hpp"
private["_extResult"];

#ifdef DEBUG_EXTENSION_DYNLOAD
    _extResult = "ace_dynload" callExtension format["call:%1,%2", GVAR(extensionLibrary), _this];
#else
    _extResult = "ace_vd" callExtension _this;
#endif

#ifdef DEBUG_LOG_EXTENSION
if((_this find "fetch_result") < 0) then {
    GVAR(debug_log) pushBack [_this, _extResult];
};
#endif

if(!isNil "_extResult") then {
    _extResult
} else {
    nil
};