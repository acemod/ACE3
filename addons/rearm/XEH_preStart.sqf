#include "script_component.hpp"

#include "XEH_PREP.hpp"

// Test binarization one time at startup - ref https://github.com/acemod/ACE3/pull/8093
private _test = getText (configFile >> "Cfg3DEN" >> "Object" >> "AttributeCategories" >> "ace_attributes" >> "Attributes" >> "ace_rearm_rearmCargo" >> "defaultValue");
if !("else {" in _test) then {
    ERROR("3den attribute has ERROR [check binarization]");
};
