
class CfgWeapons
{
    class Pistol_Base_F;
    class Rifle_Base_F;
    class srifle_EBR_F;
    class rhs_weap_XM2010_Base_F: Rifle_Base_F
    {
        ACE_barrelTwist=0.254;
        ACE_barrelLength=0.6096;
    };
    class arifle_MX_Base_F;
    class rhs_weap_m4_Base: arifle_MX_Base_F
    {
        ACE_barrelTwist=0.1778;
        ACE_barrelLength=0.3683;
    };
    class rhs_weap_m4a1;
    class rhs_weap_mk18: rhs_weap_m4a1
    {
        ACE_barrelTwist=0.1778;
        ACE_barrelLength=0.26162;
    };
    class rhs_weap_m16a4: rhs_weap_m4_Base
    {
        ACE_barrelTwist=0.1778;
        ACE_barrelLength=0.508;
    };
    class rhs_M249_base;
    class rhs_weap_m249_pip: rhs_M249_base
    {
        ACE_barrelTwist=0.1778;
        ACE_barrelLength=0.41402;
    };
    class weap_m240_base;
    class rhs_weap_m240B: weap_m240_base
    {
        ACE_barrelTwist=0.3048;
        ACE_barrelLength=0.62992;
    };
    class rhs_weap_m14ebrri: srifle_EBR_F
    {
        ACE_barrelTwist=0.3048;
        ACE_barrelLength=0.5588;
    };
    class rhs_weap_sr25: rhs_weap_m14ebrri
    {
        ACE_barrelTwist=0.28575;
        ACE_barrelLength=0.6096;
    };
    class rhs_weap_sr25_ec: rhs_weap_sr25
    {
        ACE_barrelTwist=0.28575;
        ACE_barrelLength=0.508;
    };
    class rhs_weap_M590_5RD: Rifle_Base_F
    {
        ACE_barrelTwist=0.0;
        ACE_twistDirection=0;
        ACE_barrelLength=0.4699;
    };
    class rhs_weap_M590_8RD: rhs_weap_M590_5RD
    {
        ACE_barrelTwist=0.0;
        ACE_twistDirection=0;
        ACE_barrelLength=0.508;
    };
    class hgun_ACPC2_F;
    class rhsusf_weap_m1911a1: hgun_ACPC2_F
    {
        ACE_barrelTwist=0.4064;
        ACE_barrelLength=0.127;
    };
    
    class rhsusf_acc_sniper_base;
    class rhsusf_acc_LEUPOLDMK4: rhsusf_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_Increment = 0.1;
    };
    class rhsusf_acc_LEUPOLDMK4_2: rhsusf_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { -4, 30 };
        ACE_ScopeAdjust_Horizontal[] = { -6, 6 };
        ACE_ScopeAdjust_Increment = 0.1;
    };
};