class CfgCloudlets {
    class Default;
    class ACE_TripFlare: Default {
        lifeTime = 0;
        beforeDestroyScript = "\z\ace\addons\explosives\scripts\TripflareEffect.sqf";
    };
    class ACE_TripFlareAir: ACE_TripFlare {
        beforeDestroyScript = "\z\ace\addons\explosives\scripts\TripflareAirEffect.sqf";
    };
};

class ACE_TripflareEffect {
    class SpawnFlare {
        simulation = "particles";
        type = "ACE_TripFlare";
        position = "explosionPos";
    };
};
class ACE_TripflareAirEffect {
    class SpawnFlare {
        simulation = "particles";
        type = "ACE_TripFlareAir";
        position = "explosionPos";
    };
};
