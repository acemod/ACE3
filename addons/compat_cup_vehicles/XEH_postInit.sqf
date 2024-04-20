#include "script_component.hpp"

if (["CUP_Vehicles_ACE_compat"] call EFUNC(common,isModLoaded)) exitWith {
    ERROR_WITH_TITLE("Duplicate CUP/ACE Compats","Compats are now part of ACE - Uninstall 'CUP ACE3 Compatibility Addon - Vehicles'");
};
