#include "script_component.hpp"

#ifdef ACE_EXTENSION_DYNLOAD
    "ace_dynload" callExtension format["ace_dynload:call:%1,%1", GVAR(extensionLibrary), _this];
#else
    "ace_vd" callExtension _this;
#endif