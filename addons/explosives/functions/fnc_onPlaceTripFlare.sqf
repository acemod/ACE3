#include "script_component.hpp"

EXPLODE_4_PVT(_this,_unit,_explosive,_magazineClass,_extra);

systemChat str _this;

_list = attachedObjects _explosive;

_defuseHelper = _list select 0;
systemChat str _defuseHelper;

_defuseHelper addEventHandler ["Explosion", {
    PARAMS_1(_defuseHelper);
    _explosive = _defuseHelper getVariable [QGVAR(Explosive), objNull];
    systemChat "trigger";
    if ((isNull _explosive) || {(damage _explosive) < 1}) exitWith {};
    systemChat "boom";
    _flare = "ACE_F_Hand_Red" createVehicle (getpos _defuseHelper);
    _flare attachTo [_defuseHelper, [-2,0,0]];
}];
