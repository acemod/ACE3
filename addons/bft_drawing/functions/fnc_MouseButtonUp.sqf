#include "script_component.hpp"

params ["", "_key"];

if (_key != 0) then {
    GVAR(mousebuttondown) = false;
};
