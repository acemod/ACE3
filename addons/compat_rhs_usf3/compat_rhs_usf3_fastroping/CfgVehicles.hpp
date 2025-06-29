class CfgVehicles {
    class Helicopter_Base_F;
    class Heli_light_03_base_F: Helicopter_Base_F {};
    class RHS_UH1_Base: Heli_light_03_base_F {};
    class RHS_UH1Y_base: RHS_UH1_Base {
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };
    class RHS_UH1Y_US_base: RHS_UH1Y_base {};
    class RHS_UH1Y: RHS_UH1Y_US_base {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 2.38, -0.135};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_usf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_usf3,onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions;
    };
    class RHS_UH1Y_FFAR: RHS_UH1Y {
        class UserActions: UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorRB')] call EFUNC(compat_rhs_usf3,canCloseDoor));
            };
            class CloseCargoLDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorLB')] call EFUNC(compat_rhs_usf3,canCloseDoor));
            };
        };
    };

    class Helicopter_Base_H: Helicopter_Base_F {};
    class Heli_Transport_01_base_F: Helicopter_Base_H {};

    class RHS_MELB_base: Helicopter_Base_H {};
    class RHS_MELB_MH6M: RHS_MELB_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{1.166, 0.79, -0.01}, {-1.166, 0.79, -0.01}};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_usf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_usf3,onPrepare);
    };
    class RHS_UH60_Base: Heli_Transport_01_base_F {};
    class RHS_UH60M_base: RHS_UH60_Base {
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };
    class RHS_UH60M_US_base: RHS_UH60M_base {};
    class RHS_UH60M: RHS_UH60M_US_base {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.25, -0.65};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_usf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_usf3,onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorRB')] call EFUNC(compat_rhs_usf3,canCloseDoor));
            };
            class CloseCargoLDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorLB')] call EFUNC(compat_rhs_usf3,canCloseDoor));
            };
        };
    };
    class RHS_UH60M2: RHS_UH60M {};
    class RHS_UH60M_ESSS: RHS_UH60M2 {
        EGVAR(fastroping,enabled) = 0;
        class Attributes: Attributes {
            delete EGVAR(fastroping,equipFRIES);
        };
    };

    class RHS_UH60M_MEV: RHS_UH60M {
        EGVAR(fastroping,enabled) = 0;
        class Attributes: Attributes {
            delete EGVAR(fastroping,equipFRIES);
        };
    };

    class RHS_UH60M_MEV2: RHS_UH60M_MEV {
        EGVAR(fastroping,enabled) = 2;
        class Attributes: Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };

    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base: Heli_Transport_02_base_F {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{0.5, -7.15, -0.95}, {-0.5, -7.15, -0.95}};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_usf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_usf3,onPrepare);

        class UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'ramp_anim')] call EFUNC(compat_rhs_usf3,canCloseDoor));
            };
        };
    };

    class rhsusf_CH53E_USMC: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{0,-9.5,2.6}};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_usf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_usf3,onPrepare);

        class UserActions {
            class RampOpen;
            class RampClose: RampOpen {
                condition = QUOTE([ARR_2(this,'ramp_bottom')] call EFUNC(compat_rhs_usf3,canCloseDoor));
            };
        };
    };
};
