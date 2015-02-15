#include "script_component.hpp"

PARAMS_1(_cargo);

player playmove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
player addMagazine "ACE_Rope_M5";
_cargo setVariable [QGVAR(hasSlingRope), false, true];
