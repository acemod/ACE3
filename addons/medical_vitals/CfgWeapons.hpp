class CfgWeapons {
    class H_HelmetB;
    class H_PilotHelmetFighter_B: H_HelmetB {
        GVAR(oxygenSupply) = QUOTE(vehicle _this isKindOf 'Plane' || vehicle _this isKindOf 'Helicopter');
    };
    class Vest_Camo_Base;
    class V_RebreatherB: Vest_Camo_Base {
        GVAR(oxygenSupply) = QUOTE(eyePos _this select 2 < 0); // will only work for sea-level water
    };
};
