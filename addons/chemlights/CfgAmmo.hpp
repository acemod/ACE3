
class CfgAmmo {

    class Chemlight_base;
    
    class Chemlight_Blue: Chemlight_base {
        timeToLive = 1500;
    };
    
    class Chemlight_Red: Chemlight_base {
        timeToLive = 1800;
    };
    
    class Chemlight_Green: Chemlight_base {
        timeToLive = 1800;
    };
    
    class Chemlight_Yellow: Chemlight_base {
        timeToLive = 1800;
    };
    
    class ACE_G_Chemlight_Orange: Chemlight_base {
        timeToLive = 1800;
        effectsSmoke = "ACE_ChemlightEffect_Orange";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow_lit";
    };
    
    class ACE_G_Chemlight_Orange_Infinite: ACE_G_Chemlight_Orange {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_White: Chemlight_base {
        timeToLive = 1500;
        effectsSmoke = "ACE_ChemlightEffect_White";
        model = "\A3\Weapons_f\chemlight\chemlight_yellow_lit";
    };
    
    class ACE_G_Chemlight_White_Infinite: ACE_G_Chemlight_White {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiRed: Chemlight_Red {     
        effectsSmoke = "ACE_ChemlightEffect_HiRed";
        timeToLive = 300;
    };
    
    class ACE_G_Chemlight_HiRed_Infinite: ACE_G_Chemlight_HiRed {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiYellow: Chemlight_Yellow {
        effectsSmoke = "ACE_ChemlightEffect_HiYellow";
        timeToLive = 300;
    };
    
    class ACE_G_Chemlight_HiYellow_Infinite: ACE_G_Chemlight_HiYellow {
        timeToLive = 1e10;
    };
    
    class ACE_G_Chemlight_HiOrange: ACE_G_Chemlight_Orange {
        effectsSmoke = "ACE_ChemlightEffect_HiOrange";
        timeToLive = 300;
    };
    
    class ACE_G_Chemlight_HiOrange_Infinite: ACE_G_Chemlight_HiOrange {
        timeToLive = 1e10;
    };   
    
    class ACE_G_Chemlight_HiWhite: ACE_G_Chemlight_White {
        effectsSmoke = "ACE_ChemlightEffect_HiWhite";
        timeToLive = 300;
    };
    
    class ACE_G_Chemlight_HiWhite_Infinite: ACE_G_Chemlight_HiWhite {
        timeToLive = 1e10;
    };

    class ACE_G_Chemlight_IR: Chemlight_base {
        ACE_Chemlight_IR = "ACE_Chemlight_IR_Dummy";
        effectsSmoke = "ACE_ChemlightEffect_IR";
        timeToLive = 1500;
        model = "\A3\Weapons_f\chemlight\chemlight_blue_lit";        
    };
};
