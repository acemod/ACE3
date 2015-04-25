
class CfgWeapons
{
    class Rifle_Base_F;
    class RH_ar10: Rifle_Base_F
    {
        ACE_barrelTwist=11.25;
        ACE_barrelLength=20.8;
    };
    class RH_m110: Rifle_Base_F
    {
        ACE_barrelTwist=10;
        ACE_barrelLength=20;
    };
    class RH_Mk11: RH_m110
    {
        ACE_barrelTwist=11.25;
        ACE_barrelLength=24;
    };
    class RH_SR25EC: RH_m110
    {
        ACE_barrelTwist=11.25;
        ACE_barrelLength=20;
    };
    class RH_m4: Rifle_Base_F
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=14.5;
    };
    class RH_M4_ris: RH_m4
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=14.5;
    };
    class RH_M4A1_ris: RH_M4_ris
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=14.5;
    };
    class RH_M4m: RH_M4A1_ris
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=10.5;
    };
    class RH_M4sbr: RH_M4A1_ris
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=10.5;
    };
    class RH_hb: Rifle_Base_F
    {
        ACE_barrelTwist=8;
        ACE_barrelLength=6;
    };
    class RH_hb_b: RH_hb
    {
        ACE_barrelTwist=8;
        ACE_barrelLength=6;
    };
    class RH_sbr9: Rifle_Base_F
    {
		ACE_barrelTwist=9.7;
		ACE_barrelLength=9;
    };
    class RH_M4A6: RH_M4A1_ris
    {
        ACE_barrelTwist=10;
        ACE_barrelLength=14.5;
    };
    class RH_M16a1: RH_m4
    {
        ACE_barrelTwist=14;
        ACE_barrelLength=20;
    };
    class RH_M16A2: RH_m4
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=20;
    };
    class RH_M16A4 : RH_M4_ris
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=20;
    };
    class RH_M16A3: RH_M16A4
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=20;
    };
    class RH_M16A4_m: RH_M16A4
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=20;
    };
    class RH_M16A6: RH_M16A4
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=20;
    };
    class RH_Mk12mod1: RH_M16A4
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=18;
    };
    class RH_SAMR: RH_Mk12mod1
    {
        ACE_barrelTwist=7.7;
        ACE_barrelLength=20;
    };
    class RH_Hk416: RH_M4A1_ris
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=14.5;
    };
    class RH_Hk416s: RH_M4sbr
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=10.4;
    };
    class RH_Hk416c: RH_M4sbr
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=9;
    };
    class RH_M27IAR: RH_Mk12mod1
    {
        ACE_barrelTwist=7;
        ACE_barrelLength=16.5;
    };
};