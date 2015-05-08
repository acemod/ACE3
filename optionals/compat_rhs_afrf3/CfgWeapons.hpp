
class CfgWeapons
{
    class hgun_Rook40_F;
    class rhs_weap_pya: hgun_Rook40_F
    {
        ACE_barrelTwist=254.0;
        ACE_barrelLength=111.76;
    };
    class Pistol_Base_F;
    class rhs_weap_makarov_pmm: rhs_weap_pya
    {
        ACE_barrelTwist=240.03;
        ACE_barrelLength=93.472;
    };
    class rhs_weap_ak74m_Base_F;
    class rhs_weap_ak74m: rhs_weap_ak74m_Base_F
    {
        ACE_barrelTwist=199.898;
        ACE_barrelLength=414.02;
    };
    class rhs_weap_akm: rhs_weap_ak74m
    {
        ACE_barrelTwist=199.898;
        ACE_barrelLength=414.02;
    };
    class rhs_weap_aks74;
    class rhs_weap_aks74u: rhs_weap_aks74
    {
        ACE_barrelTwist=160.02;
        ACE_barrelLength=210.82;
    };
    class rhs_weap_svd: rhs_weap_ak74m
    {
        ACE_barrelTwist=238.76;
        ACE_barrelLength=619.76;
    };
    class rhs_weap_svdp;
    class rhs_weap_svds: rhs_weap_svdp
    {
        ACE_barrelTwist=238.76;
        ACE_barrelLength=563.88;
    };
    class rhs_pkp_base;
    class rhs_weap_pkp: rhs_pkp_base
    {
        ACE_barrelTwist=240.03;
        ACE_barrelLength=657.86;
    };
    class rhs_weap_pkm: rhs_weap_pkp
    {
        ACE_barrelTwist=240.03;
        ACE_barrelLength=645.16;
    };
    class rhs_weap_rpk74m: rhs_weap_pkp
    {
        ACE_barrelTwist=195.072;
        ACE_barrelLength=589.28;
    };
    
    class rhs_acc_sniper_base;
    class rhs_acc_pso1m2: rhs_acc_sniper_base {
        ACE_ScopeAdjust_Vertical[] = { 0, 0 };
        ACE_ScopeAdjust_Horizontal[] = { -10, 10 };
        ACE_ScopeAdjust_Increment = 0.5;
    };
};