
#define BASE_ATTENUATION \
    class Attenuation { \
        constant = 0; \
        linear = 0; \
        quadratic = 200; \
        hardLimitStart = 1.75; \
        hardLimitEnd = 3; \
    };

#define HI_ATTENUATION \
    class Attenuation { \
        constant = 0; \
        linear = 0; \
        quadratic = 20; \
        hardLimitStart = 2.1; \
        hardLimitEnd = 2.8; \
    };

#define ULTRA_HI_ATTENUATION \
    class Attenuation { \
        constant = 0; \
        linear = 0; \
        quadratic = 20; \
        hardLimitStart = 3; \
        hardLimitEnd = 4; \
    };

class CfgLights {

    class ChemLight_Green {
        ambient[] = {0,0,0,0};
        brightness = 1;
        color[] = {0.1,1,0.1,1};
        diffuse[] = {0.1,1,0.1};
        drawLight = 0;
        intensity = 4000;
        position[] = {0,0,0};

        BASE_ATTENUATION
    };

    class ChemLight_Blue: ChemLight_Green {
        color[] = {0,0.6,1,1};
        diffuse[] = {0,0.6,1};

        BASE_ATTENUATION
    };

    class ChemLight_Red: ChemLight_Green {
        color[] = {1,0.1,0.1,1};
        diffuse[] = {1,0.1,0.1};

        BASE_ATTENUATION
    };

    class ChemLight_Yellow: ChemLight_Green {
        color[] = {1,1,0.1,1};
        diffuse[] = {1,1,0.1};

        BASE_ATTENUATION
    };

    class ACE_ChemlightLight_Orange: ChemLight_Green {
        color[] = {1,0.64,0,1};
        diffuse[] = {1,0.4,0};
    };

    class ACE_ChemlightLight_White: ChemLight_Green {
        color[] = {1,1,1,1};
        diffuse[] = {1,1,1};
    };

    class ACE_ChemlightLight_HiRed: ChemLight_Red {
        intensity = 9000;

        HI_ATTENUATION
    };
    class ACE_ChemlightLight_HiYellow: ChemLight_Yellow {
        intensity = 9000;

        HI_ATTENUATION
    };
    class ACE_ChemlightLight_HiWhite: ACE_ChemlightLight_White {
        intensity = 9000;

        HI_ATTENUATION
    };
    class ACE_ChemlightLight_HiBlue: ChemLight_Blue {
        intensity = 9000;

        HI_ATTENUATION
    };
    class ACE_ChemlightLight_HiGreen: ChemLight_Green {
        intensity = 9000;

        HI_ATTENUATION
    };

    class ACE_ChemlightLight_UltraHiOrange: ACE_ChemlightLight_Orange {
        intensity = 12000;
        
        ULTRA_HI_ATTENUATION
    };

    class ACE_ChemlightLight_IR: ChemLight_Green {
        intensity = 0;
    };
};
