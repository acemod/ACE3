class MainTurret;
class CfgVehicles {
    class EGVAR(csw,baseTripod);
    
    class LandVehicle;
    
    class StaticWeapon : LandVehicle {
        class Turrets {
            class MainTurret;
        };
    };
    
    class StaticMGWeapon: StaticWeapon{
        class Turrets : Turrets  {
            class MainTurret : MainTurret {
                class ViewOptics;
            };
        };
    };
    
    class ACE_M47_Dragon_Static_Base : StaticMGWeapon {
        features = "Balls";
        scope = 0;
        displayName = "ACE M47 Dragon";
        class Armory {
            description = "Balls";
        };
        model = QPATHTOF(models\ace_m47_static.p3d);
        picture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        UiPicture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";
        threat[] = {0.3,1.0,0.3};
        cost = 150000;
        class Damage {
            tex[] = {};
            mat[] = {"a3\static_f_gamma\data\staticturret_01.rvmat","a3\static_f_gamma\data\staticturret_01_damage.rvmat","a3\static_f_gamma\data\staticturret_01_destruct.rvmat","a3\static_f_gamma\data\staticturret_02.rvmat","a3\static_f_gamma\data\staticturret_02_damage.rvmat","a3\static_f_gamma\data\staticturret_02_destruct.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher_damage.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher_destruct.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube_damage.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube_destruct.rvmat"};
        };
        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                optics = 1;
                turretInfoType = "RscWeaponEmpty";
                gunnerOpticsModel = PATHTOF(models\optics_m47.p3d);
                minElev = -60;
                maxElev = 0;
                weapons[] = {};
                magazines[] = {};
                
                gunnerAction = "gunner_static_low01";
                gunnergetInAction = "";
                gunnergetOutAction = "";
                
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
                
                class OpticsIn 
                {
                    class Wide: ViewOptics
                    {
                        initFov = 0.015;
                        minFov = 0.015;
                        maxFov = 0.015;
                        gunnerOpticsModel = PATHTOF(models\optics_m47.p3d);
                        gunnerOutOpticsModel = "\A3\weapons_f\reticle\optics_empty";
                        gunnerOpticsEffect[] = {"TankGunnerOptics1","OpticsBlur2","OpticsCHAbera2"};
                    };
                };
                
                displayName = "Balls in your face";
                
                class ViewOptics: ViewOptics
                {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 5;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.015;
                    minFov = 0.015;
                    maxFov = 0.015;
                    visionMode[] = {"Normal"};
                    thermalMode[] = {0};
                };
                gunnerRightHandAnimName = "OtocHlaven_shake";
                gunnerLeftHandAnimName = "OtocHlaven_shake";
                gunBeg = "spice rakety";
                gunEnd = "konec rakety";
                memoryPointGunnerOptics = "look";
            };
        };
        class AnimationSources {
            class rest_rotate {
                source="user";
                animPeriod=0.00001;
                initPhase=-0.35;
                maxValue="3.60";
                minValue="-3.60";
            };
            class optic_hide {
                source="user";
                animPeriod=0.0001;
                initPhase=1;
                maxValue="1";
                minValue="0";
            };
            class missile_hide {
                source="user";
                animPeriod=0.0001;
                initPhase=0;
                maxValue="1";
                minValue="0";
            };
        };
        soundGetOut[] = {"A3\sounds_f\dummysound",0.001,1,5};
        soundGetIn[] = {"A3\sounds_f\dummysound",0.00031622776,1,5};
        armorStructural = 10.0;
        hiddenSelections[] = {"camo_launcher","camo_tube"};
    };

    class ACE_M47_Dragon_NoSight : ACE_M47_Dragon_Static_Base {
        author = "ACE Team";
        _generalMacro = "O_static_AT_F";
        scope = 2;
        displayname = "ACE_M47_Dragon_Static";
        side = 1;
        faction = "BLU_F";
        crew = "B_soldier_f";
        hiddenSelectionsTextures[] = {"\a3\weapons_f_beta\launchers\titan\data\launcher_co.paa","\a3\weapons_f_beta\launchers\titan\data\tubem_co.paa"};
        
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                optics = 0;
            };
        };
        
        class ACE_CSW {
            disassembleTo = "ACE_M47_Dragon";
        };
        
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "M47 Dragon";
                selection = "";
                distance = 2;
                condition = "true";
                class GVAR(pickUp) {
                    displayName = "Pick Up";
                    condition = QUOTE(call FUNC(canPickupTripod));
                    statement = QUOTE(call EFUNC(csw,assemble_pickupTripod));
                };
                class GVAR(mountWeapon) {
                    displayName = "Attach Sight";
                    condition = QUOTE(call FUNC(canDeployWeapon));
                    statement = QUOTE([ARR_4(_this select 0, _this select 1, [], binocular (_this select 1))] call EFUNC(csw,assemble_deployWeapon));
                };
            };
        };
    };
    
    class ACE_M47_Dragon_Sight : ACE_M47_Dragon_Static_Base {
        author = "ACE Team";
        _generalMacro = "O_static_AT_F";
        scope = 2;
        displayname = "ACE_M47_Dragon_Static";
        side = 1;
        faction = "BLU_F";
        crew = "B_soldier_f";
        hiddenSelectionsTextures[] = {"\a3\weapons_f_beta\launchers\titan\data\launcher_co.paa","\a3\weapons_f_beta\launchers\titan\data\tubem_co.paa"};
        
        class AnimationSources: AnimationSources {
            class optic_hide: optic_hide {
                initPhase=0;
            };
        };
        
        class ACE_CSW {
            enabled = 1;
            disassembleFunc = QFUNC(onDisassemble);
            disassembleWeapon = "ACE_M47_Daysight"; // carry weapon [CfgWeapons]
            disassembleTurret = "ACE_M47_Dragon_NoSight"; // turret [CfgVehicles]
            desiredAmmo = 1;
            ammoLoadTime = -1;
            ammoUnloadTime = -1;
        };
        
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                optics = 1;
                weapons[] = {"ACE_M47_Dragon_Static"};
                magazines[] = {"ace_m47_dragon"};
            };
        };
    };
};