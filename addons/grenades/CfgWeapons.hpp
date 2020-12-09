
class CfgWeapons {
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"ACE_HandFlare_WhiteMuzzle","ACE_HandFlare_RedMuzzle","ACE_HandFlare_GreenMuzzle","ACE_HandFlare_YellowMuzzle","ACE_M84Muzzle","ACE_M14Muzzle","ACE_CTS9Muzzle","ACE_SatchelMuzzle","ACE_DemoMuzzle"};

        class ThrowMuzzle;
        class ACE_HandFlare_WhiteMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_White"};
        };

        class ACE_HandFlare_RedMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_Red"};
        };

        class ACE_HandFlare_GreenMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_Green"};
        };

        class ACE_HandFlare_YellowMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_HandFlare_Yellow"};
        };

        class ACE_M84Muzzle: ThrowMuzzle {
            magazines[] = {"ACE_M84"};
        };

        class ACE_M14Muzzle: ThrowMuzzle {
            magazines[] = {"ACE_M14"};
        };

        class ACE_CTS9Muzzle: ThrowMuzzle {
            magazines[] = {"ACE_CTS9"};
        };

        class ACE_SatchelMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_SatchelCharge_Remote_Mag_Throwable"};
        };

        class ACE_DemoMuzzle: ThrowMuzzle {
            magazines[] = {"ACE_DemoCharge_Remote_Mag_Throwable"};
        };
    };
};
