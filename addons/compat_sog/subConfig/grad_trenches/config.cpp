#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        addonRootClass = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "loadorder_f_vietnam",
            "grad_trenches"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class EGVAR(trenches,digEnvelopeSmall);
                class GVAR(digSpiderhole): EGVAR(trenches,digEnvelopeSmall) {
                    displayName = CSTRING(Action_DigSpiderhole);
                    statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_01')])] call CBA_fnc_execNextFrame);
                };
                class GVAR(digSpiderholeAngled): EGVAR(trenches,digEnvelopeSmall) {
                    displayName = CSTRING(Action_DigSpiderholeAngled);
                    statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_02')])] call CBA_fnc_execNextFrame);
                };
                class GVAR(digSpiderholeDual): EGVAR(trenches,digEnvelopeSmall) {
                    displayName = CSTRING(Action_DigSpiderholeDual);
                    statement = QUOTE([ARR_2({_this call EFUNC(trenches,placeTrench)},[ARR_2(_this select 0,'vn_o_vc_spiderhole_03')])] call CBA_fnc_execNextFrame);
                };
            };
        };
    };
};
