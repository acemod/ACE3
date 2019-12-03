class SlotInfo;
class CowsSlot: SlotInfo {
    compatibleItems[] += {
        "ACE_optic_Hamr_2D",
        "ACE_optic_Hamr_PIP",
        "ACE_optic_Arco_2D",
        "ACE_optic_Arco_PIP",
        "ACE_optic_MRCO_2D",
        "ACE_optic_MRCO_PIP",
        "ACE_optic_SOS_2D",
        "ACE_optic_SOS_PIP",
        "ACE_optic_LRPS_2D",
        "ACE_optic_LRPS_PIP"
        //"ACE_optic_DMS"
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
        //ACE_optic_DMS = 1;
    };
};
