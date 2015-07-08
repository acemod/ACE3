/*
 * Author: commy2
 *
 * Abhocken! Unit goes kneeling if not prone already and lowers weapon. Try, throw, catch because I'm bored.
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * None.
 */
#include "script_component.hpp"

PARAMS_1(_unit);

//IGNORE_PRIVATE_WARNING("_exception");

try {
    if (_unit == vehicle _unit) then {
        switch (currentWeapon _unit) do {
            case "" : {throw "AmovPknlMstpSnonWnonDnon"};
            case (primaryWeapon _unit) : {throw "AmovPknlMstpSlowWrflDnon"};
            case (secondaryWeapon _unit) : {throw "AmovPknlMstpSrasWlnrDnon"};
            case (handgunWeapon _unit) : {throw "AmovPknlMstpSlowWpstDnon"};
            case (binocular _unit) : {throw "AmovPknlMstpSoptWbinDnon"};
          };
    };
} catch {
    if (stance _unit != "PRONE") then {
        [_unit, _exception] call FUNC(doAnimation);
    };
};
