
class ACE_M84FlashbangEffect {
    // empty
};

class ACE_HandFlareEffect {
    // empty
};

class ACE_Incendiary {
    class Cmeasures1 {
        simulation = "particles";
        type = "Cmeasures1";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 25;
    };
    class Cmeasures2 {
        simulation = "particles";
        type = "Cmeasures2";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 25;
    };
    class Light1 {
        simulation = "light";
        type = "CmeasuresLight";
        position[] = {0,0,0};
        intensity = 1;
        interval = 1;
        lifeTime = 25;
    };
};
