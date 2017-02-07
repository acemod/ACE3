class CfgCloudlets {
    class Default;
    class ACE_TripFlare: Default {
        lifeTime = 0;
        beforeDestroyScript = "\z\ace\addons\explosives\scripts\TripflareEffect.sqf";
    };
};

class ACE_TripflareEffect {
    class SpawnFlare {
        simulation = "particles";
        type = "ACE_TripFlare";
        position = "explosionPos";
    };
};
