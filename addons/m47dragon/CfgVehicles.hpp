class MainTurret;
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(deploy) {
                    displayName = "Deploy Dragon";
                    condition = QUOTE('ACE_M47_Dragon' in (weapons ACE_player));
                    statement = QUOTE([ARR_2(ACE_Player,'ACE_M47_Dragon_Static')] call FUNC(deploy));
                    showDisabled = 0;
                    priority = 2;
                };
            };
        };
    };
    class LandVehicle;
    
    class StaticWeapon: LandVehicle    {
        class Turrets;
        class NewTurret;
        class MainTurret;
        class ACE_Actions {
            class ACE_MainActions {};
        };
    };
    
    class StaticATWeapon: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret;
        };
        class ACE_Actions: ACE_Actions{
            class ACE_MainActions: ACE_MainActions {};
        };
    };
   
    class ACE_M47_Dragon_Static_Base : StaticATWeapon {
        features = "Balls";
        scope = 0;
        displayName = "M47 Dragon";
        class Armory {
            description = "M47 Dragon - M222 HEAT round";
        };
        model = QUOTE(PATHTOF(models\ace_m47_static.p3d));
        picture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        UiPicture = "\A3\Static_F_Gamma\data\UI\gear_StaticTurret_AT_CA.paa";
        icon = "\A3\Static_F_Gamma\data\UI\map_StaticTurret_AT_CA.paa";
        threat[] = {0.3,1.0,0.3};
        cost = 150000;
        class Damage {
            tex[] = {};
            mat[] = {"a3\static_f_gamma\data\staticturret_01.rvmat","a3\static_f_gamma\data\staticturret_01_damage.rvmat","a3\static_f_gamma\data\staticturret_01_destruct.rvmat","a3\static_f_gamma\data\staticturret_02.rvmat","a3\static_f_gamma\data\staticturret_02_damage.rvmat","a3\static_f_gamma\data\staticturret_02_destruct.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher_damage.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_launcher_destruct.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube_damage.rvmat","a3\weapons_f_beta\launchers\titan\data\titan_mtube_destruct.rvmat"};
        };
        
        memoryPointMissile[] = {"spice rakety","spice rakety"};
        memoryPointMissileDir[] = {"konec rakety","konec rakety"};
        
        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                optics = 1;
                turretInfoType = "RscWeaponEmpty";
                gunnerOpticsModel = PATHTOF(models\optics_m47.p3d);
                
                minTurn=-45; maxTurn=+45; initTurn=0;
                minElev=-20; maxElev=+20; initElev=0;
                
                weapons[] = {"ACE_M47_Dragon_Static"};
                magazines[] = {};
                
                gunnerAction = "gunner_static_low01";
                gunnergetInAction = "";
                gunnergetOutAction = "GetOutLow";
                
                gunnerOutOpticsModel = "\A3\weapons_f\reticle\optics_empty";
                gunnerOpticsEffect[] = {"OpticsBlur2","OpticsCHAbera2"};
                memoryPointGunnerOptics = "look";
                
                gunnerRightHandAnimName = "OtocHlaven_shake";
                gunnerLeftHandAnimName = "OtocHlaven_shake";
                
                memoryPointGun = "spice rakety";
                
                gunBeg = "spice rakety";
                gunEnd = "konec rakety";
                
                missileBeg = "spice rakety";
                missileEnd = "konec rakety";
                
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
              
                
                displayName = "Balls in your face";
                
                class ViewOptics {
                    initAngleX = 0;
                    minAngleX = -30;
                    maxAngleX = 30;
                    initAngleY = 0;
                    minAngleY = -100;
                    maxAngleY = 100;
                    initFov = 0.015;
                    minFov = 0.015;
                    maxFov = 0.015;
                    visionMode[] = {"Normal"};
                    thermalMode[] = {0};
                };
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
        class assembleInfo
        {
            primary = 0;
            base = "";
            assembleTo = "";
            dissasembleTo[] = {};
            displayName = "";
        };
        hiddenSelections[] = {"camo_launcher","camo_tube"};
    };

    class ACE_M47_Dragon_Static : ACE_M47_Dragon_Static_Base {
        author = "ACE Team";
        _generalMacro = "O_static_AT_F";
        scope = 2;
        displayname = "M47 Dragon Static";
        side = 1;
        faction = "BLU_F";
        crew = "B_soldier_f";
        hiddenSelectionsTextures[] = {"\a3\weapons_f_beta\launchers\titan\data\launcher_co.paa","\a3\weapons_f_beta\launchers\titan\data\tubem_co.paa"};
        class assembleInfo: assembleInfo
        {
            dissasembleTo[] = {};
            //Dissasembly necessary at all?
        };
        class ACE_Actions: ACE_Actions{
            class ACE_MainActions: ACE_MainActions {
                selection = "osaveze";
                class ACE_Pickup {
                    selection = "";
                    displayName = "Pickup";
                    distance = 5;
                    condition = QUOTE((isNil {_target getVariable 'dragonfired'}) && (alive _target) && (count (crew _target) == 0));
                    statement = QUOTE([ARR_2(_target,ACE_player)] call FUNC(pickup));
                    showDisabled = 0;
                    exceptions[] = {};
                    priority = 5;
                };
            };
        };
    };
};