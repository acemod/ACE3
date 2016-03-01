#define EQUIP_FRIES_ATTRIBUTE class Attributes { \
    class EGVAR(fastroping,equipFRIES) { \
        property = QEGVAR(fastroping,equipFRIES); \
        control = "Checkbox"; \
        displayName = ECSTRING(fastroping,Eden_equipFRIES); \
        tooltip = ECSTRING(fastroping,Eden_equipFRIES_Tooltip); \
        expression = QUOTE([_this] call EFUNC(fastroping,equipFRIES)); \
        typeName = "BOOL"; \
        condition = "objectVehicle"; \
        defaultValue = false; \
    }; \
}

class CfgVehicles {
    class LandVehicle;
    class Tank: LandVehicle {
        class NewTurret;
    };
    class Tank_F: Tank {
        class Turrets {
            class MainTurret: NewTurret {
                class Turrets {
                    class CommanderOptics;
                };
            };
        };
    };

    class MBT_01_base_F: Tank_F {};
    class rhsusf_m1a1tank_base: MBT_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1909;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
                class Turrets: Turrets {
                    class CommanderOptics: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                    class Loader: CommanderOptics {
                        ace_fcs_Enabled = 0;
                    };
                };
            };
        };
    };
    class rhsusf_m1a1aim_tuski_wd: rhsusf_m1a1tank_base {
        ace_repair_hitpointPositions[] = {{"era_1_hitpoint", {0,0,0}}};
        ace_repair_hitpointGroups[] = {{"era_1_hitpoint", {"era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint", "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint"}}};
    };
    class rhsusf_m1a2tank_base;
    class rhsusf_m1a2sep1tuskid_usarmy: rhsusf_m1a2tank_base {
        ace_repair_hitpointPositions[] = {{"era_1_hitpoint", {0,0,0}}};
        ace_repair_hitpointGroups[] = {{"era_1_hitpoint", {"era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint", "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint"}}};
    };
    class rhsusf_m1a2sep1tuskiiwd_usarmy: rhsusf_m1a2sep1tuskid_usarmy {
        ace_repair_hitpointPositions[] = {{"era_1_hitpoint", {0,0,0}}};
        ace_repair_hitpointGroups[] = {{"era_1_hitpoint", {"era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint", "era_20_hitpoint", "era_21_hitpoint", "era_22_hitpoint", "era_23_hitpoint", "era_24_hitpoint", "era_25_hitpoint", "era_26_hitpoint", "era_27_hitpoint", "era_28_hitpoint", "era_29_hitpoint", "era_30_hitpoint", "era_31_hitpoint", "era_32_hitpoint", "era_33_hitpoint", "era_34_hitpoint", "era_35_hitpoint", "era_36_hitpoint", "era_37_hitpoint", "era_38_hitpoint", "era_39_hitpoint", "era_40_hitpoint", "era_41_hitpoint", "era_42_hitpoint", "era_43_hitpoint", "era_44_hitpoint", "era_45_hitpoint", "era_46_hitpoint"}}};
    };

    class Helicopter;
    class Helicopter_Base_F: Helicopter {
        class Eventhandlers;
    };
    class Heli_Light_03_base_F: Helicopter_Base_F {};
    class RHS_UH1_Base: Heli_light_03_base_F {
        EGVAR(refuel,fuelCapacity) = 1447;
    };

    class RHS_UH1Y_base: RHS_UH1_Base {};
    class RHS_UH1Y_US_base: RHS_UH1Y_base {};
    class RHS_UH1Y: RHS_UH1Y_US_base {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 2.38, -0.135};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions;
        class EventHandlers: EventHandlers {
            class RHSUSF_EventHandlers;
        };

        EQUIP_FRIES_ATTRIBUTE;
    };
    class RHS_UH1Y_FFAR: RHS_UH1Y {
        class UserActions: UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorRB')] call FUNC(canCloseDoor));
            };
            class CloseCargoLDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorLB')] call FUNC(canCloseDoor));
            };
        };

        class EventHandlers: EventHandlers {
            class RHSUSF_EventHandlers: RHSUSF_EventHandlers {
                getOut = QUOTE(if !(_this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_uh60_doors});
            };
        };
    };

    class Helicopter_Base_H: Helicopter_Base_F {
        class Eventhandlers;
    };
    class Heli_Transport_01_base_F: Helicopter_Base_H {};
    class RHS_UH60_Base: Heli_Transport_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1360;
    };

    class RHS_UH60M_base: RHS_UH60_Base {};
    class RHS_UH60M_US_base: RHS_UH60M_base {};
    class RHS_UH60M: RHS_UH60M_US_base {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.25, -0.65};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};

        class UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorRB')] call FUNC(canCloseDoor));
            };
            class CloseCargoLDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'doorLB')] call FUNC(canCloseDoor));
            };
        };

        class EventHandlers: EventHandlers {
            class RHSUSF_EventHandlers {
                getOut = QUOTE(if !(_this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]) then {_this call rhs_fnc_uh60_doors});
            };
        };

        EQUIP_FRIES_ATTRIBUTE;
    };

    class RHS_UH60M_MEV: RHS_UH60M {
        EGVAR(fastroping,enabled) = 0;
        class Attributes {
            delete EGVAR(fastroping,equipFRIES);
        };
    };

    class RHS_UH60M_MEV2: RHS_UH60M_MEV {
        EGVAR(fastroping,enabled) = 2;
        EQUIP_FRIES_ATTRIBUTE;
    };

    class Heli_Transport_02_base_F;
    class RHS_CH_47F_base: Heli_Transport_02_base_F {
        EGVAR(refuel,fuelCapacity) = 3914;
    };

    class RHS_CH_47F: RHS_CH_47F_base {
        EGVAR(fastroping,enabled) = 1;
        EGVAR(fastroping,ropeOrigins)[] = {{0.5, -7.15, -0.95}, {-0.5, -7.15, -0.95}};
        EGVAR(fastroping,onCut) = QFUNC(onCut);
        EGVAR(fastroping,onPrepare) = QFUNC(onPrepare);

        class UserActions {
            class OpenCargoDoor;
            class CloseCargoDoor: OpenCargoDoor {
                condition = QUOTE([ARR_2(this,'ramp_anim')] call FUNC(canCloseDoor));
            };
        };
    };

    class Heli_Attack_01_base_F;
    class RHS_AH1Z_base: Heli_Attack_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1600;
    };

    class RHS_AH64_base: Heli_Attack_01_base_F {
        EGVAR(refuel,fuelCapacity) = 1420;
    };

    class MBT_01_arty_base_F;
    class rhsusf_m109tank_base: MBT_01_arty_base_F {
        EGVAR(refuel,fuelCapacity) = 511;
    };

    class MRAP_01_base_F;
    class rhsusf_hmmwe_base: MRAP_01_base_F {
        EGVAR(refuel,fuelCapacity) = 95;
    };

    class rhsusf_rg33_base: MRAP_01_base_F {
        EGVAR(refuel,fuelCapacity) = 302;
    };

    class Truck_01_base_F;
    class rhsusf_fmtv_base: Truck_01_base_F {
        EGVAR(refuel,fuelCapacity) = 219;
    };

    class APC_Tracked_02_base_F: Tank_F {};
    class rhsusf_m113_tank_base: APC_Tracked_02_base_F {
        EGVAR(refuel,fuelCapacity) = 360;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                ace_fcs_Enabled = 0;
            };
        };
    };

    class APC_Tracked_03_base_F;
    class RHS_M2A2_Base: APC_Tracked_03_base_F {
        EGVAR(refuel,fuelCapacity) = 746;
    };
    class RHS_M2A2: RHS_M2A2_Base {};
    class RHS_M2A2_BUSKI: RHS_M2A2 {
        ace_repair_hitpointPositions[] = {{"era_1_hitpoint", {0,0,0}}};
        ace_repair_hitpointGroups[] = {{"era_1_hitpoint", {"era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint"}}};
    };
    class RHS_M2A3: RHS_M2A2 {};
    class RHS_M2A3_BUSKI: RHS_M2A3 {
        ace_repair_hitpointPositions[] = {{"era_1_hitpoint", {0,0,0}}};
        ace_repair_hitpointGroups[] = {{"era_1_hitpoint", {"era_2_hitpoint", "era_3_hitpoint", "era_4_hitpoint", "era_5_hitpoint", "era_6_hitpoint", "era_7_hitpoint", "era_8_hitpoint", "era_9_hitpoint", "era_10_hitpoint", "era_11_hitpoint", "era_12_hitpoint", "era_13_hitpoint", "era_14_hitpoint", "era_15_hitpoint", "era_16_hitpoint", "era_17_hitpoint", "era_18_hitpoint", "era_19_hitpoint"}}};
    };

    class Plane_CAS_01_base_F;
    class RHS_A10: Plane_CAS_01_base_F {
        EGVAR(refuel,fuelCapacity) = 6223;
    };

    class Plane_Base_F;
    class RHS_C130J_Base: Plane_Base_F {
        EGVAR(refuel,fuelCapacity) = 25704;
    };
};
