class CfgMagazines {
    class CA_Magazine;
    class ACE_SatchelCharge_Remote_Mag_Throwable: CA_Magazine {
        displayName = CSTRING(SatchelChargeThrowable_Name);
    };
    class ACE_DemoCharge_Remote_Mag_Throwable: ACE_SatchelCharge_Remote_Mag_Throwable {
        displayName = CSTRING(DemoChargeThrowable_Name);
    };

    class APERSMine_Range_Mag;
    class ACE_APERSMine_ToePopper_Mag: APERSMine_Range_Mag {
        displayName = CSTRING(APERSMine_ToePopper_Name);
    };
};
