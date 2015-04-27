
class CfgWeapons
{
	class Pistol_Base_F;
	class Rifle_Base_F;
	class srifle_EBR_F;
	class rhs_weap_XM2010_Base_F: Rifle_Base_F
	{
        ACE_barrelTwist=10;
        ACE_barrelLength=24;
	};
	class arifle_MX_Base_F;
	class rhs_weap_m4_Base: arifle_MX_Base_F
	{
        ACE_barrelTwist=7;
        ACE_barrelLength=14.5;
	};
    class rhs_weap_m4a1;
	class rhs_weap_mk18: rhs_weap_m4a1
	{
        ACE_barrelTwist=7;
        ACE_barrelLength=10.3;
	};
	class rhs_weap_m16a4: rhs_weap_m4_Base
	{
        ACE_barrelTwist=7;
        ACE_barrelLength=20;
	};
	class rhs_M249_base;
	class rhs_weap_m249_pip: rhs_M249_base
	{
        ACE_barrelTwist=7;
        ACE_barrelLength=16.3;
	};
	class weap_m240_base;
	class rhs_weap_m240B: weap_m240_base
	{
        ACE_barrelTwist=12;
        ACE_barrelLength=24.8;
	};
	class rhs_weap_m14ebrri: srifle_EBR_F
	{
        ACE_barrelTwist=12;
        ACE_barrelLength=22;
	};
	class rhs_weap_sr25: rhs_weap_m14ebrri
	{
        ACE_barrelTwist=11.25;
        ACE_barrelLength=24;
	};
	class rhs_weap_sr25_ec: rhs_weap_sr25
	{
        ACE_barrelTwist=11.25;
        ACE_barrelLength=20;
	};
	class rhs_weap_M590_5RD: Rifle_Base_F
	{
        ACE_barrelTwist=0;
        ACE_twistDirection=0;
        ACE_barrelLength=18.5;
	};
	class rhs_weap_M590_8RD: rhs_weap_M590_5RD
	{
        ACE_barrelTwist=0;
        ACE_twistDirection=0;
        ACE_barrelLength=20;
	};
	class hgun_ACPC2_F;
	class rhsusf_weap_m1911a1: hgun_ACPC2_F
	{
        ACE_barrelTwist=16;
        ACE_barrelLength=5;
	};
};