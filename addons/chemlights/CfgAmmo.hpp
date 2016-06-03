
class CfgAmmo {

    class SmokeShell;
    
    class Chemlight_base: SmokeShell {
        soundImpactHard1[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.8,65};
        soundImpactHard2[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.9,65};
        soundImpactHard3[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.6,65};
        soundImpactHard4[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,2,65};
        soundImpactHard5[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.5,65};
        soundImpactHard6[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,1.7,65};
        soundImpactHard7[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,2.1,65};
        soundImpactIron1[] = {"A3\sounds_f\characters\footsteps\concrete_run_1",1,2.1,95};
        soundImpactIron2[] = {"A3\sounds_f\characters\footsteps\steel_run_4",1,1.75,95};
        soundImpactIron3[] = {"A3\sounds_f\characters\footsteps\steel_run_4",1,1.6,95};
        soundImpactIron4[] = {"A3\sounds_f\characters\footsteps\steel_run_2",1,2,95};
        soundImpactIron5[] = {"A3\sounds_f\characters\footsteps\steel_run_2",1,2.1,95};
        soundImpactSoft1[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.5,45};
        soundImpactSoft2[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.55,45};
        soundImpactSoft3[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.45,45};
        soundImpactSoft4[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.49,45};
        soundImpactSoft5[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.52,45};
        soundImpactSoft6[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.54,45};
        soundImpactSoft7[] = {"A3\sounds_f\characters\footsteps\concrete_run_6",0.5,1.46,45};
        soundImpactWoodExt1[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_1",1,1.1,75};
        soundImpactWoodExt2[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_1",1,1.15,75};
        soundImpactWoodExt3[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_2",1,1.1,75};
        soundImpactWoodExt4[] = {"A3\sounds_f\characters\footsteps\wood_run_ext_2",1,1.15,75};
    };
    
    class Chemlight_Blue: Chemlight_base {
        ACE_Pickup = "Chemlight_blue";
        timeToLive = 28800;
    };
    
    class Chemlight_Red: Chemlight_base {
        ACE_Pickup = "Chemlight_red";
        timeToLive = 43200;
    };
    
    class Chemlight_Green: Chemlight_base {
        ACE_Pickup = "Chemlight_green";
        timeToLive = 43200;
    };
    
    class Chemlight_Yellow: Chemlight_base {
        ACE_Pickup = "Chemlight_yellow";
        timeToLive = 43200;
    };
    
    class ACE_G_Chemlight_Orange: Chemlight_base {
        ACE_Pickup = "ACE_Chemlight_Orange";
        timeToLive = 43200;
        effectsSmoke = "ACE_ChemlightEffect_Orange";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow_lit";
    };
    
    class ACE_G_Chemlight_Orange_Infinite: ACE_G_Chemlight_Orange {
        ACE_Pickup = "ACE_Chemlight_Orange";
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_White: Chemlight_base {
        ACE_Pickup = "ACE_Chemlight_White";
        timeToLive = 28800;
        effectsSmoke = "ACE_ChemlightEffect_White";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow_lit";
    };
    
    class ACE_G_Chemlight_White_Infinite: ACE_G_Chemlight_White {
        ACE_Pickup = "ACE_Chemlight_White";
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiRed: Chemlight_Red {
        ACE_Pickup = "ACE_Chemlight_HiRed";       
        effectsSmoke = "ACE_ChemlightEffect_HiRed";
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_HiRed_Infinite: ACE_G_Chemlight_HiRed {
        ACE_Pickup = "ACE_Chemlight_HiRed";
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiYellow: Chemlight_Yellow {
        ACE_Pickup = "ACE_Chemlight_HiYellow";
        effectsSmoke = "ACE_ChemlightEffect_HiYellow";
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_HiYellow_Infinite: ACE_G_Chemlight_HiYellow {
        ACE_Pickup = "ACE_Chemlight_HiYellow";
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiOrange: ACE_G_Chemlight_Orange {
        ACE_Pickup = "ACE_Chemlight_HiOrange";
        effectsSmoke = "ACE_ChemlightEffect_HiOrange";
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_HiOrange_Infinite: ACE_G_Chemlight_HiOrange {
        ACE_Pickup = "ACE_Chemlight_HiOrange";
        timeToLive = 1e10;
    };   
    
    class ACE_G_Chemlight_HiWhite: ACE_G_Chemlight_White {
        ACE_Pickup = "ACE_Chemlight_HiWhite";
        effectsSmoke = "ACE_ChemlightEffect_HiWhite";
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_HiWhite_Infinite: ACE_G_Chemlight_HiWhite {
        ACE_Pickup = "ACE_Chemlight_HiWhite";
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_IR: Chemlight_base {
        ACE_Pickup = "ACE_Chemlight_IR";
        ACE_Chemlight_IR = "ACE_Chemlight_IR_Marker";
        ACE_Chemlight_IR_X = "ACE_Chemlight_IR_X";
        effectsSmoke = "ACE_ChemlightEffect_IR";
        timeToLive = 28800;
        model = "\A3\Weapons_f\chemlight\chemlight_blue_lit";        
    };
};
