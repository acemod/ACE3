class CfgVehicles {
    class CUP_AH6_BASE;
    class CUP_MH6_TRANSPORT: CUP_AH6_BASE {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
    };
    class CUP_B_MH6M_OBS_USA: CUP_MH6_TRANSPORT {
        EGVAR(fastroping,enabled) = 0;
    };
    class CUP_B_MH6J_OBS_USA: CUP_MH6_TRANSPORT {
        EGVAR(fastroping,enabled) = 0;
    };

    class Helicopter_Base_H;
    class CUP_AW159_Unarmed_Base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesGantry";
        EGVAR(fastroping,friesAttachmentPoint)[] = {1.05, 1, 1.3};
        EGVAR(fastroping,onCut) = QEFUNC(fastroping,onCutCommon);
        EGVAR(fastroping,onPrepare) = QEFUNC(fastroping,onPrepareCommon);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
        EQUIP_FRIES_ATTRIBUTE;

        class UserActions {
            class CloseRdoor {
                condition = QUOTE(this doorPhase 'CargoDoorR' > 0.5 && ((this getCargoIndex player) isEqualTo 0) && !(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]));
            };
        };
    };

    class CUP_CH47F_base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight", "ropeOriginMid"};
    };

    class CUP_CH53E_base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions {
            class RampClose {
                condition = QUOTE(this animationPhase 'ramp_bottom' >= 0.56 && player == driver this && !(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]));
            };
        };
    };

    class CUP_Merlin_HC3_Base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginRight"};
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_cup_vehicles,onPrepareHC3);
        EGVAR(fastroping,onCut) = QEFUNC(compat_cup_vehicles,onCutHC3);

        class UserActions {
            class CloseRdoor {
                condition = QUOTE(this doorPhase 'dvere_p' > 0.5 && {(this getCargoIndex player) isEqualTo 0} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
            class OutWinch {
                condition = "false";
            };
            class InWinch {
                condition = "false";
            };
        };
    };

    class CUP_Ka60_Base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
    };

    class CUP_MH60S_Base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginRight"};

        class UserActions {
            class OpenDoors;
            class CloseDoors: OpenDoors {
                condition = QUOTE(this animationPhase 'doors' > 0.5 && driver this == player && alive (this) && !(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]));
            };
        };
    };

    class CUP_Mi8_base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft"};
    };

    class CUP_Mi8_medevac_base: CUP_Mi8_base {
        EGVAR(fastroping,enabled) = 0;
    };

    class CUP_Mi171Sh_Base: CUP_Mi8_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
    };

    class CUP_SA330_Base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions {
            class CloseRdoor {
                condition = QUOTE(alive this && {this doorPhase 'ofrp_puma_porte_droite' > 0.5} && {(this getCargoIndex player) isEqualTo 0} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
            class CloseLdoor {
                condition = QUOTE(alive this && {this doorPhase 'ofrp_puma_porte_gauche' > 0.5} && {(this getCargoIndex player) isEqualTo 1} && !(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]));
            };
        };
    };

    class CUP_UH1H_base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.45, -0.3};
        EGVAR(fastroping,onCut) = QEFUNC(fastroping,onCutCommon);
        EGVAR(fastroping,onPrepare) = QEFUNC(fastroping,onPrepareCommon);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
        EQUIP_FRIES_ATTRIBUTE;
    };

    class CUP_B_UH1Y_Base;
    class CUP_B_UH1Y_UNA_USMC: CUP_B_UH1Y_Base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_cup_vehicles,onPrepareUH1Y);
        EGVAR(fastroping,onCut) = QEFUNC(compat_cup_vehicles,onCutUH1Y);
    };
    class CUP_B_UH1Y_MEV_USMC: CUP_B_UH1Y_UNA_USMC {
        EGVAR(fastroping,enabled) = 0;
    };

    class CUP_UH60_Base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginRight"};

        class UserActions {
            class OpenDoors;
            class CloseDoors: OpenDoors {
                condition = QUOTE(this animationPhase 'doors' > 0.5 && driver this == player && alive (this) && !(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]));
            };
        };
    };
};
