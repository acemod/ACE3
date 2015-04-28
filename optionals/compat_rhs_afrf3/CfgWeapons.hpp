
class CfgWeapons
{
    class hgun_Rook40_F;
    class rhs_weap_pya: hgun_Rook40_F
    {
        ACE_barrelTwist=10;
        ACE_barrelLength=4.4;
    };
    class Pistol_Base_F;
    class rhs_weap_makarov_pmm: rhs_weap_pya
    {
        ACE_barrelTwist=9.45;
        ACE_barrelLength=3.68;
    };
    class rhs_weap_ak74m_Base_F;
    class rhs_weap_ak74m: rhs_weap_ak74m_Base_F
    {
        ACE_barrelTwist=7.87;
        ACE_barrelLength=16.3;
    };
    class rhs_weap_akm: rhs_weap_ak74m
    {
        ACE_barrelTwist=7.87;
        ACE_barrelLength=16.3;
    };
    class rhs_weap_aks74;
    class rhs_weap_aks74u: rhs_weap_aks74
    {
        ACE_barrelTwist=6.3;
        ACE_barrelLength=8.3;
    };
    class rhs_weap_svd: rhs_weap_ak74m
    {
        ACE_barrelTwist=9.4;
        ACE_barrelLength=24.4;
    };
    class rhs_weap_svdp;
    class rhs_weap_svds: rhs_weap_svdp
    {
        ACE_barrelTwist=9.4;
        ACE_barrelLength=22.2;
    };
    class rhs_pkp_base;
    class rhs_weap_pkp: rhs_pkp_base
    {
        ACE_barrelTwist=9.45;
        ACE_barrelLength=25.9;
    };
    class rhs_weap_pkm: rhs_weap_pkp
    {
        ACE_barrelTwist=9.45;
        ACE_barrelLength=25.4;
    };
    class rhs_weap_rpk74m: rhs_weap_pkp
    {
        ACE_barrelTwist=7.68;
        ACE_barrelLength=23.2;
    };
    
    class rhs_acc_sniper_base;
    class rhs_acc_pso1m2: rhs_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { 0, 0 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_Increment = 0.5;
    };
};