#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"asdg_jointrails","ace_laserpointer","ace_optics"};
        author[]={"OnkelDisMaster"};
        authorUrl = "http://2.xn--gebirgsjgerkompanie-nwb.de/";
        VERSION_CONFIG;
    };
};

class asdg_SlotInfo;
class asdg_FrontSideRail: asdg_SlotInfo {
    class compatibleItems {
        ACE_acc_pointer_red = 1;
        ACE_acc_pointer_green = 1;
        ACE_acc_pointer_green_IR = 1;
    };
};

class asdg_OpticRail;
class asdg_OpticRail1913: asdg_OpticRail {
    class compatibleItems {
        ACE_optic_Hamr_2D = 1;
        ACE_optic_Hamr_PIP = 1;
        ACE_optic_Arco_2D = 1;
        ACE_optic_Arco_PIP = 1;
        ACE_optic_MRCO_2D = 1;
        ACE_optic_MRCO_PIP = 1;
        ACE_optic_SOS_2D = 1;
        ACE_optic_SOS_PIP = 1;
        ACE_optic_LRPS_2D = 1;
        ACE_optic_LRPS_PIP = 1;
    };
};
