#define SUBCOMPONENT csw
#define SUBCOMPONENT_BEAUTIFIED Crew-Served Weapons
#include "..\script_component.hpp"

#define CONDITION_NO_CSW(var) (EGVAR(csw,ammoHandling) == 0) && {!([false, true, true, EGVAR(csw,defaultAssemblyMode)] select (var getVariable [ARR_2('EGVAR(csw,assemblyMode)',3)]))}

#define OVERWRITE_FUNC(funcName)\
class funcName {\
    file = QPATHTOF(DOUBLES(COMPONENT,SUBCOMPONENT)\functions\DOUBLES(fnc,funcName).sqf);\
}
