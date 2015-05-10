#include "script_component.hpp"

#ifdef DEBUG_EXTENSION_DYNLOAD
    "ace_dynload" callExtension format["call:%1,%2", GVAR(extensionLibrary), _this];
#else
    "ace_vd" callExtension _this;
#endif