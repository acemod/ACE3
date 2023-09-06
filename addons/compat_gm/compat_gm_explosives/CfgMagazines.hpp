class CfgMagazines {
    // Explosives
    class gm_explosive_petn_charge_base;
    class gm_explosive_petn_charge: gm_explosive_petn_charge_base {
        EGVAR(explosives,DelayTime) = 1;
        EGVAR(explosives,Placeable) = 1;
        EGVAR(explosives,SetupObject) =QEGVAR(explosives,Place_gm_explosive_petn);
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
        EGVAR(explosives,SetupObject) =QEGVAR(explosives,Place_gm_explosive_plnp);
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
        EGVAR(explosives,SetupObject) =QEGVAR(explosives,Place_gm_mine_tm46);
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
        EGVAR(explosives,SetupObject) =QEGVAR(explosives,Place_gm_explosive_dm21);
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
        EGVAR(explosives,SetupObject) =QEGVAR(explosives,Place_gm_explosive_m111);
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
        EGVAR(explosives,SetupObject) =QEGVAR(explosives,Place_gm_explosive_dm31);
        useAction = 0;
        class ACE_Triggers {
            SupportedTriggers[] = {"Tripwire"};
            class Tripwire {
                digDistance = 0.125;
            };
        };
    };
};
