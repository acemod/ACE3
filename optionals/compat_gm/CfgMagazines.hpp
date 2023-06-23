class cfgMagazines {
    // MG3
    class gm_120rnd_762x51mm_mg3_grn;
    class gm_120Rnd_762x51mm_B_T_DM21_mg3_grn: gm_120rnd_762x51mm_mg3_grn {
        ACE_isBelt = 1;
    };
    class gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn: gm_120rnd_762x51mm_mg3_grn {
        ACE_isBelt = 1;
    };
    class gm_120Rnd_762x51mm_B_T_DM21A2_mg3_grn: gm_120rnd_762x51mm_mg3_grn {
        ACE_isBelt = 1;
    };

    // PK
    class gm_100rnd_762x54mmR_pk_grn;
    class gm_100Rnd_762x54mm_API_b32_pk_grn: gm_100rnd_762x54mmR_pk_grn {
        ACE_isBelt = 1;
    };
    class gm_100Rnd_762x54mm_B_T_t46_pk_grn: gm_100rnd_762x54mmR_pk_grn {
        ACE_isBelt = 1;
    };
    class gm_100Rnd_762x54mmR_API_7bz3_pk_grn: gm_100rnd_762x54mmR_pk_grn {
        ACE_isBelt = 1;
    };
    class gm_100Rnd_762x54mmR_B_T_7t2_pk_grn: gm_100rnd_762x54mmR_pk_grn {
        ACE_isBelt = 1;
    };

    // Explosives
    class gm_explosive_petn_charge_base;
    class gm_explosive_petn_charge: gm_explosive_petn_charge_base {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_gm_explosive_petn";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
            class DeadmanSwitch: Command {};
        };
    };

    class gm_explosive_plnp_charge_base;
    class gm_explosive_plnp_charge: gm_explosive_plnp_charge_base {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_gm_explosive_plnp";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Timer", "Command", "MK16_Transmitter", "DeadmanSwitch"};
            class Timer {
                FuseTime = 0.5;
            };
            class Command {
                FuseTime = 0.5;
            };
            class MK16_Transmitter: Command {};
            class DeadmanSwitch: Command {};
        };
    };

    class gm_mine_at_base;
    class gm_mine_at_tm46: gm_mine_at_base {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_gm_mine_tm46";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.03;
            };
        };
    };
    class gm_mine_at_dm21: gm_mine_at_base {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_gm_explosive_dm21";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.03;
            };
        };
    };
    class gm_mine_at_mn111: gm_mine_at_base {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_gm_explosive_m111";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"PressurePlate"};
            class PressurePlate {
                digDistance = 0.03;
            };
        };
    };

    class gm_mine_ap_dm31: gm_mine_at_base {
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) = "ACE_Explosives_Place_gm_explosive_dm31";
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.125;
            };
        };
    };
};
