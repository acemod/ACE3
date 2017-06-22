class CfgLights {

    class Chemlight_Blue;

    class ACE_FlashlightLight_White: Chemlight_Blue {
        brightness = 100;
        color[] = {1,1,1,1};
        diffuse[] = {1,1,1};
        intensity = 100;
        position[] = {0,0,0};

        class Attenuation {
            constant = 0;
            linear = 0;
            quadratic = 10000;
            start = 0.075;
        };
    };

    class ACE_FlashlightLight_Red: ACE_FlashlightLight_White {
        diffuse[] = {1,0,0};
    };

    class ACE_FlashlightLight_Blue: ACE_FlashlightLight_White {
        diffuse[] = {0.25,0.25,1};
    };

    class ACE_FlashlightLight_Green: ACE_FlashlightLight_White {
        diffuse[] = {0,1,0};
    };

    class ACE_FlashlightLight_Yellow: ACE_FlashlightLight_White {
        diffuse[] = {1,1,0.4};
    };

    class ACE_FlashlightLight_Orange: ACE_FlashlightLight_White {
        diffuse[] = {1,0.65,0};
    };
};
