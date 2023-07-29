#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Damage types which do not cause blood spurts
private _noBloodDamageTypes = "getNumber (_x >> 'noBlood') == 1" configClasses (configFile >> "ACE_Medical_Injuries" >> "damageTypes");
uiNamespace setVariable [
    QGVAR(noBloodDamageTypes),
    compileFinal str (_noBloodDamageTypes apply {[configName _x, nil]})
];
