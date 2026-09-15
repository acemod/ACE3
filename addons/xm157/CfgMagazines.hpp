#ifdef CREATE_MOCK_PLATFORMS
class CfgMagazines {
    class 1Rnd_HE_Grenade_shell;
    class GVAR(mock_airburst_mag): 1Rnd_HE_Grenade_shell {
        displayName = "Mock Airburst Grenade";
        ammo = QGVAR(mock_airburst);
        count = 5;
        initSpeed = 210;
        scope = 1;
    };
};
#endif
