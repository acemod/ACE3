class CfgVehicles {
    class Air;
    class Helicopter: Air {};
    class Helicopter_Base_F: Helicopter {};
    class Helicopter_Base_H: Helicopter_Base_F {
        class EventHandlers;
    };
    class Heli_Light_02_base_F: Helicopter_Base_H {};
    class RHS_Mi8_base: Heli_Light_02_base_F {
        EGVAR(fastroping,enabled) = 0;
        class EventHandlers: EventHandlers {
            class RHS_EventHandlers;
        };
    };

    class RHS_Mi8amt_base: RHS_Mi8_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.13, 4.67, -0.89}};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_arf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_arf3,onPrepare);
        class UserActions {
            class openDoor;
            class closeDoor_L: openDoor {
                condition = QUOTE((this doorPhase 'LeftDoor' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
        };

        class EventHandlers: EventHandlers {
            class RHS_EventHandlers: RHS_EventHandlers {
                getOut = QUOTE(if !((_this select 0) getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_mi8_doors});
            };
        };
    };

    class RHS_Mi8_VVS_Base: RHS_Mi8_base {};
    class RHS_Mi8mt_vvs: RHS_Mi8_VVS_Base {};
    class RHS_Mi8mt_Cargo_vvs: RHS_Mi8mt_vvs {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{-1.13, 4.67, -0.89}};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_arf3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_arf3,onPrepare);

        class UserActions {
            class openDoor_L;
            class closeDoor_L: openDoor_L {
                condition = QUOTE((this doorPhase 'LeftDoor' > 0.5) && {alive this} && {!(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)])});
            };
        };

        class EventHandlers: EventHandlers {
            class RHS_EventHandlers: RHS_EventHandlers {
                getOut = QUOTE(if !((_this select 0) getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_mi8_doors});
            };
        };
    };

    class Heli_Attack_02_base_F: Helicopter_Base_F {};
    class RHS_Ka52_base: Heli_Attack_02_base_F {
        EGVAR(fastroping,enabled) = 0;
    };

    class RHS_Mi24_base: Heli_Attack_02_base_F {
        EGVAR(fastroping,enabled) = 0;
    };
};
