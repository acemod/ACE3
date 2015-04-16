#include "script_component.hpp"

EXPLODE_4_PVT(_this,_unit,_explosive,_magazineClass,_extra);

//This should always be exactly one because we just created and attached to it.
_attachedObjects = attachedObjects _explosive;

if ((count _attachedObjects) != 1) exitWith {ERROR("attachedObjects count wrong");};

_defuseHelper = _attachedObjects select 0;

[QGVAR(serverSetupTripFlare), [_defuseHelper]] call EFUNC(common,serverEvent);
