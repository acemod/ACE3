#include "script_component.hpp"

PARAMS_1(_fenceObject);

_fenceObject setdamage 1;
[localize "STR_ACE_logistics_wirecutter_FenceCut"] call EFUNC(common,displayTextStructured);
[ACE_player, "AmovPknlMstpSrasWrflDnon", 1] call EFUNC(common,doAnimation);
