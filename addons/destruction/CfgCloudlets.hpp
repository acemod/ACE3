class CfgCloudlets {
};
class CfgLights {
    class ExploLightSmall {
        color[] = {20, 19, 17.74};
        ambient[] = {5, 5, 5};
        diffuse[] = {0, 0, 0};
        brightness = 0.02;
    };
};

class ExploAmmoExplosion {
    class ExploAmmoFlash {
        position[] = {0,0,0};
        simulation = "particles";
        type = "ExploAmmoFlash";
        intensity = 1;
        interval = 1;
        lifeTime = 1;
    };
    class LightExplosion {
        simulation = "light";
        type = "ExploLightSmall";
        position[] = {0, 0, 0};
        intensity = 0.001;
        interval = 1;
        lifeTime = 0.15;
    };
    class ExploAmmoSmoke {
        position[] = {0,0,0};
        simulation = "particles";
        type = "ExploAmmoSmoke";
        intensity = 1.5;
        interval = 1.5;
        lifeTime = 1.5;
    };
};