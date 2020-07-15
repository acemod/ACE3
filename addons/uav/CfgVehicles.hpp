class GVAR(UAVPod) {
    class OpticsIn {
        class Wide {
            opticsDisplayName = "WFOV";
            initAngleX=0; minAngleX=0; maxAngleX=0;
            initAngleY=0; minAngleY=0; maxAngleY=0;
            initFov = 0.5;
            minFov = 0.5;
            maxFov = 0.5;
            visionMode[] = {"Normal","NVG","Ti"};
            thermalMode[] = {0,1};
            gunnerOpticsModel = "\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_wide_F.p3d";
            //gunnerOpticsModel = "\A3\Weapons_F\Reticle\Optics_Gunship_wide_F.p3d";
            opticsPPEffects[] = {"OpticsCHAbera2","OpticsBlur2"};
        };
        
        class Medium: Wide {
            opticsDisplayName = "MFOV";
            initFov = 0.125;
            minFov = 0.125;
            maxFov = 0.125;
            gunnerOpticsModel = "\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_medium_F.p3d";
            //gunnerOpticsModel = "\A3\Weapons_F\Reticle\Optics_Gunship_medium_F.p3d";
        };
        
        class Narrow: Wide {
            opticsDisplayName = "NFOV";
            initFov = 0.03125;
            minFov = 0.03125;
            maxFov = 0.03125;
            gunnerOpticsModel = "\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_narrow_F.p3d";
            //gunnerOpticsModel = "\A3\Weapons_F\Reticle\Optics_Gunship_narrow_F.p3d";
        };

        showMiniMapInOptics = true;
        showUAVViewInOptics= false;
        showSlingLoadManagerInOptics= false;
    };

    minTurn = -180;
    maxTurn  = +180;
    initTurn = 0;
    minElev = -10;
    maxElev = 90;
    initElev = 0;
    maxXRotSpeed = 0.75;
    maxYRotSpeed = 0.75;
    pilotOpticsShowCursor = 1;
    controllable = true;
};

class GVAR(UAVOptics) {
    initAngleX = 0;
    initAngleY = 0;
    initFov = 1.25;
    maxAngleX = 0;
    maxAngleY = 0;
    maxFov = 1.25;
    maxMoveX = 0;
    maxMoveY = 0;
    maxMoveZ = 0;
    minAngleX = 0;
    minAngleY = 0;
    minFov = 1.25;
    minMoveX = 0;
    minMoveY = 0;
    minMoveZ = 0;
    speedZoomMaxFOV = 0;
    speedZoomMaxSpeed = 1e+010;
    thermalMode[] = {0, 1};
    visionMode[] = {"Normal", "NVG", "Ti"};
};


class CfgVehicles {
    class UAV_01_Base_F;
    class B_UAV_01_F: UAV_01_Base_F {
        class AnimationSources;
    };
    
    class ACE_B_UAV_01_F: B_UAV_01_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_01_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };
            
            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };
    
    class O_UAV_01_F: UAV_01_Base_F {
        class AnimationSources;
    };
    
    class ACE_O_UAV_01_F: O_UAV_01_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_01_O_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };

            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};
        
        class ADDON {
            trackPilotCamera = 1;
        };
    };

    class I_UAV_01_F: UAV_01_Base_F {
        class AnimationSources;
    };
    
    class ACE_I_UAV_01_F: I_UAV_01_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_01_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };

            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };

    class I_E_UAV_01_F: UAV_01_Base_F {
        class AnimationSources;
    };
    
    class ACE_I_E_UAV_01_F: I_E_UAV_01_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_01_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };

            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };

    class UAV_02_dynamicLoadout_base_F;
    class B_UAV_02_dynamicLoadout_F: UAV_02_dynamicLoadout_base_F {
        class AnimationSources;
    };
    
    class ACE_B_UAV_02_dynamicLoadout_F: B_UAV_02_dynamicLoadout_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_02_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };

            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };
    
    class O_UAV_02_dynamicLoadout_F: UAV_02_dynamicLoadout_base_F {
        class AnimationSources;
    };

    class ACE_O_UAV_02_dynamicLoadout_F: O_UAV_02_dynamicLoadout_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_02_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };

            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };

        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };

    };
    
    class I_UAV_02_dynamicLoadout_F: UAV_02_dynamicLoadout_base_F {
        class AnimationSources;
    };

    class ACE_I_UAV_02_dynamicLoadout_F: I_UAV_02_dynamicLoadout_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_02_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };

    class UAV_03_dynamicLoadout_base_F;
    class B_T_UAV_03_dynamicLoadout_F: UAV_03_dynamicLoadout_base_F {
        class AnimationSources;
    };

    class ACE_B_T_UAV_03_dynamicLoadout_F: B_T_UAV_03_dynamicLoadout_F {
        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_03_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };

    class UAV_04_base_F;
    class O_T_UAV_04_CAS_F: UAV_04_base_F {
        class AnimationSources;
    };
    class ACE_O_T_UAV_04_CAS_F: O_T_UAV_04_CAS_F {
        magazines[] = {"4rnd_LG_Jian","Laserbatteries"};
        weapons[] = {"missiles_Jian","Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_04_Name);
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };   
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };

    class UAV_05_Base_F;
    class B_UAV_05_F: UAV_05_Base_F {
        class AnimationSources;
    };
    
    class ACE_B_UAV_05_F: B_UAV_05_F {
//        memoryPointDriverOptics = "PiP0_pos";

        magazines[] += {"Laserbatteries"};
        weapons[] += {"Laserdesignator_pilotCamera"};
        displayName = CSTRING(ACE_UAV_05_Name);
        //unitInfoType = "RscOptics_CAS_01_TGP"; //rsc with Weapon elements
        //driverWeaponsInfoType = "RscOptics_VTOL_01_gunner";
        //driverWeaponsInfoType = "RscOptics_UAV_06_TGP";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod";
        
        class Turrets {};

        class AnimationSources: AnimationSources {
            class mainGun {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: GVAR(UAVOptics){};
        class PilotCamera: GVAR(UAVPod){};

        class ADDON {
            trackPilotCamera = 1;
        };
    };
};
