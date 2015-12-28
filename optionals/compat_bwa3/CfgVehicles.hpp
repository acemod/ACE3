class CfgVehicles {
    class Tank_F;
    class BWA3_Puma_base: Tank_F {
        // Assuming 1 L/km
        EGVAR(refuel,fuelCapacity) = 700;
    };

    class BWA3_Leopard_base: Tank_F {
        EGVAR(refuel,fuelCapacity) = 1160;
    };
};
