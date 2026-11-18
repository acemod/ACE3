class CfgVehicles {
    class B_APC_Tracked_01_base_F;
    class B_APC_Wheeled_01_base_F;
    class AFV_Wheeled_01_base_F;
    class AFV_Wheeled_01_up_base_F;
    class B_MBT_01_arty_base_F;
    class MRAP_01_base_F;
    class MRAP_01_hmg_base_F;
    class MRAP_01_gmg_base_F;
    class B_MBT_01_base_F;
    class O_APC_Tracked_02_base_F;
    class O_MBT_02_arty_base_F;
    class MRAP_02_base_F;
    class MRAP_02_gmg_base_F;
    class MRAP_02_hmg_base_F;
    class O_MBT_02_railgun_base_F;
    class MBT_04_cannon_base_F;
    class MBT_04_command_base_F;
    class O_MBT_02_base_F;
    class I_APC_tracked_03_base_F;
    class I_APC_Wheeled_03_base_F;
    class I_MBT_03_base_F;
    class B_APC_Tracked_01_AA_F: B_APC_Tracked_01_base_F {
        class ADDON {
            enabled = 1;
            position = "satellite";
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 0;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };

    class B_APC_Wheeled_01_cannon_F: B_APC_Wheeled_01_base_F {
        class ADDON {
            enabled = 1;
            position = "zbran";
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 0;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class B_AFV_Wheeled_01_cannon_F: AFV_Wheeled_01_base_F {
        class ADDON {
            enabled = 1;
            position = "otochlaven";
            detectionRadius = 3;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class B_AFV_Wheeled_01_up_cannon_F: AFV_Wheeled_01_up_base_F {
        class ADDON {
            enabled = 1;
            position = "otochlaven";
            detectionRadius = 3;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class B_MBT_01_arty_F: B_MBT_01_arty_base_F {
        class ADDON {
            enabled = 1;
            position = "otocvez";
            detectionRadius = 2;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class B_MRAP_01_F: MRAP_01_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 2;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 0;
                };
            };
        };
    };
    class B_MRAP_01_hmg_F: MRAP_01_hmg_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 2;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 0;
                };
            };
        };
    };
    class B_MRAP_01_gmg_F: MRAP_01_gmg_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 2;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 0;
                };
            };
        };
    };
    class B_MBT_01_cannon_F: B_MBT_01_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 1;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_APC_Tracked_02_AA_F: O_APC_Tracked_02_base_F {
        class ADDON {
            enabled = 1;
            position = "satellite";
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 0;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_APC_Tracked_02_cannon_F: O_APC_Tracked_02_base_F {
        class ADDON {
            enabled = 1;
            position = "otocvez";
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 0;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_MBT_02_arty_F: O_MBT_02_arty_base_F {
        class ADDON {
            enabled = 1;
            position = "otocvez";
            detectionRadius = 3;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_MRAP_02_F: MRAP_02_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 1.5;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 0;
                };
            };
        };
    };
    class O_MRAP_02_gmg_F: MRAP_02_gmg_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 1.5;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 0;
                };
            };
        };
    };
    class O_MRAP_02_hmg_F: MRAP_02_hmg_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 1.5;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 0;
                };
            };
        };
    };
    class O_MBT_02_railgun_F: O_MBT_02_railgun_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 1;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_MBT_04_cannon_F: MBT_04_cannon_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 1 };
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 1;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_MBT_04_command_F: MBT_04_command_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 1 };
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 1;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class O_MBT_02_cannon_F: O_MBT_02_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 1 };
            detectionRadius = 3;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 1;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class I_APC_tracked_03_cannon_F: I_APC_tracked_03_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 3;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class I_APC_Wheeled_03_cannon_F: I_APC_Wheeled_03_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 4, 0 };
            detectionRadius = 3;
            class components {
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
    class I_MBT_03_cannon_F: I_MBT_03_base_F {
        class ADDON {
            enabled = 1;
            position[] = { 0, 0, 0 };
            detectionRadius = 4;
            class components {
                class hunter_killer_slew {
                    allowAutomatic = 0;
                };
                class audio {
                    speakerSelection = "";
                    crewOnly = 1;
                };
            };
        };
    };
};