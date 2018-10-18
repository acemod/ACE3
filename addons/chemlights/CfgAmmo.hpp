
class CfgAmmo {

    class Chemlight_base;
    
    class Chemlight_Blue: Chemlight_base {
        timeToLive = 28800; // 8h as per cyalume website
    };
    
    class Chemlight_Red: Chemlight_base {
        timeToLive = 43200; // 12h as per cyalume website
    };
    
    class Chemlight_Green: Chemlight_base {
        timeToLive = 43200;
    };
    
    class Chemlight_Yellow: Chemlight_base {
        timeToLive = 43200;
    };
    
    class ACE_G_Chemlight_Orange: Chemlight_base {
        timeToLive = 43200;
        effectsSmoke = "ACE_ChemlightEffect_Orange";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow_lit";
    };
    
    class ACE_G_Chemlight_Orange_Infinite: ACE_G_Chemlight_Orange {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_White: Chemlight_base {
        timeToLive = 28800;
        effectsSmoke = "ACE_ChemlightEffect_White";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow_lit";
    };
    
    class ACE_G_Chemlight_White_Infinite: ACE_G_Chemlight_White {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiRed: Chemlight_Red {     
        effectsSmoke = "ACE_ChemlightEffect_HiRed";
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_HiRed_Infinite: ACE_G_Chemlight_HiRed {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiYellow: Chemlight_Yellow {
        effectsSmoke = "ACE_ChemlightEffect_HiYellow";
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_HiYellow_Infinite: ACE_G_Chemlight_HiYellow {
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_HiWhite: ACE_G_Chemlight_White {
        effectsSmoke = "ACE_ChemlightEffect_HiWhite";
        timeToLive = 1800;
    };

    class ACE_G_Chemlight_HiWhite_Infinite: ACE_G_Chemlight_HiWhite {
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_HiBlue: Chemlight_Blue {
        effectsSmoke = "ACE_ChemlightEffect_HiBlue";
        timeToLive = 1800;
    };

    class ACE_G_Chemlight_HiBlue_Infinite: ACE_G_Chemlight_HiBlue {
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_HiGreen: Chemlight_Green {
        effectsSmoke = "ACE_ChemlightEffect_HiGreen";
        timeToLive = 1800;
    };

    class ACE_G_Chemlight_HiGreen_Infinite: ACE_G_Chemlight_HiGreen {
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_UltraHiOrange: ACE_G_Chemlight_Orange {
        effectsSmoke = "ACE_ChemlightEffect_UltraHiOrange";
        timeToLive = 300;
    };
    
    class ACE_G_Chemlight_UltraHiOrange_Infinite: ACE_G_Chemlight_UltraHiOrange {
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_IR: Chemlight_base {
        ACE_Chemlight_IR = "ACE_Chemlight_IR_Dummy";
        effectsSmoke = "ACE_ChemlightEffect_IR";
        timeToLive = 28800;
        model = "\A3\Weapons_f\chemlight\chemlight_blue_lit";
    };
};
