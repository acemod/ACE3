class CfgWeapons {
    class H_HelmetB;
    class H_PilotHelmetFighter_B: H_HelmetB {
        GVAR(oxygenSupply) = QUOTE(vehicle _this isKindOf 'Plane' || vehicle _this isKindOf 'Helicopter');
    };
};
