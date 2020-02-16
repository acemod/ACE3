class CBA_Extended_EventHandlers;

class AnimationSources;

class UAVPod {
    class OpticsIn
    {
        class Wide
        {
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
        class Medium: Wide
        {
            opticsDisplayName = "MFOV";
            initFov = 0.125;
            minFov = 0.125;
            maxFov = 0.125;
            gunnerOpticsModel = "\A3\Drones_F\Weapons_F_Gamma\Reticle\UAV_Optics_Gunner_medium_F.p3d";
            //gunnerOpticsModel = "\A3\Weapons_F\Reticle\Optics_Gunship_medium_F.p3d";

        };
        class Narrow: Wide
        {
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

class UAVOptics {
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
    thermalMode[] = {0,1};
    visionMode[] = {"Normal","NVG","Ti"};
};


class CfgVehicles {
    class B_UAV_01_F;
    class ACE_B_UAV_01_F: B_UAV_01_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "AR-2 Darter (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

    };
    
    class O_UAV_01_F;
    class ACE_O_UAV_01_F: O_UAV_01_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "Tayran AR-2 (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements


        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};
        
        class ADDON {
            trackPilotCamera = 1;
        };

    };

    class I_UAV_01_F;
    class ACE_I_UAV_01_F: I_UAV_01_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "AR-2 Darter (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements


        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };

    class I_E_UAV_01_F;
    class ACE_I_E_UAV_01_F: I_E_UAV_01_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "AR-2 Darter (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };

    class B_UAV_02_dynamicLoadout_F;
    class ACE_B_UAV_02_dynamicLoadout_F: B_UAV_02_dynamicLoadout_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "YABHON-R3 (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };
        
    };
    
    class O_UAV_02_dynamicLoadout_F;
    class ACE_O_UAV_02_dynamicLoadout_F: O_UAV_02_dynamicLoadout_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "YABHON-R3 (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };

        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };
    
    class I_UAV_02_dynamicLoadout_F;
    class ACE_I_UAV_02_dynamicLoadout_F: I_UAV_02_dynamicLoadout_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "YABHON-R3 (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };

    class B_T_UAV_03_dynamicLoadout_F;
    class ACE_B_T_UAV_03_dynamicLoadout_F: B_T_UAV_03_dynamicLoadout_F {
        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "MQ-12 Falcon (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements
        
        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };

    
    class O_T_UAV_04_CAS_F;
    class ACE_O_T_UAV_04_CAS_F: O_T_UAV_04_CAS_F {
        magazines[] = {"4rnd_LG_Jian","laserbatteries"};
        weapons[] = {"missiles_Jian","laserdesignator_pilotCamera"};
        displayName = "Burraq UCAV (Pilot Cam)";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod"; //rsc with Weapon elements

        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };   
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };



    class B_UAV_05_F;
    class ACE_B_UAV_05_F: B_UAV_05_F {
//        memoryPointDriverOptics = "PiP0_pos";

        magazines[] += {"laserbatteries"};
        weapons[] += {"laserdesignator_pilotCamera"};
        displayName = "UCAV Sentinel (Pilot Cam)";
        //unitInfoType = "RscOptics_CAS_01_TGP"; //rsc with Weapon elements
        //driverWeaponsInfoType = "RscOptics_VTOL_01_gunner";
        //driverWeaponsInfoType = "RscOptics_UAV_06_TGP";
        driverWeaponsInfoType = "ACE_RscOptics_UAVPod";
        
        class Turrets {};

        class AnimationSources: AnimationSources 
        {

            class mainGun 
            {
                source = "user";
                animperiod = 0.25;
            };
            class mainTurret: mainGun 
            {
                animperiod = 0.25;
            };
        };
        
        class Viewoptics: UAVOptics{};

        class PilotCamera: UAVPod{};

        class ADDON {
            trackPilotCamera = 1;
        };

    };
};
