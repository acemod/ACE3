class CfgVehicles {
    class Sign_Sphere100cm_F;
    
    class ace_flameout_1 : Sign_Sphere100cm_F {
        model = "\A3\Weapons_f\empty";
        class EventHandlers {
            init = QUOTE(_this call FUNC(doFlameout));
        };
    };
    
    class ace_flameout_2 : Sign_Sphere100cm_F {
        model = "\A3\Weapons_f\empty";
        class EventHandlers {
            init = QUOTE(_this call FUNC(doFlameout));
        };
    };
    
    
    class Sound;
    class ace_flameout: Sound {
        scope = 2;
        sound = "ace_flameout";
        displayName = "$STR_DN_ALARM";
        class EventHandlers {
            init = QUOTE(_this call FUNC(doFlameout));
        };
    };
    
    /*
    class Land;
    class LandVehicle: Land {};
    class Tank: LandVehicle {
        class DestructionEffects { //Disable standard burning effects
            class Fire1 {
                intensity = 0;
                interval = 1;
                lifetime = 0;
                position = "destructionEffect1";
                simulation = "particles";
                type = "ObjectDestructionFire1";
            };
            class Fire2 {
                intensity = 0;
                interval = 1;
                lifetime = 0;
                position = "destructionEffect1";
                simulation = "particles";
                type = "ObjectDestructionFire1";
            };
        };
    };
    class Car: LandVehicle {
        class DestructionEffects { //Disable standard burning effects
            class Fire1 {
                intensity = 0;
                interval = 1;
                lifetime = 0;
                position = "destructionEffect1";
                simulation = "particles";
                type = "ObjectDestructionFire1";
            };
            class Fire2 {
                intensity = 0;
                interval = 1;
                lifetime = 0;
                position = "destructionEffect1";
                simulation = "particles";
                type = "ObjectDestructionFire1";
            };
        };
    };*/
};