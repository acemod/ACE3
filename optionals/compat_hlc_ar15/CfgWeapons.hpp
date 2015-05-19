class CfgWeapons
{
	class Rifle;
	class Rifle_Base_F;
	class hlc_ar15_base: Rifle_Base_F
	{
        ACE_barrelTwist=177.8;
        ACE_barrelLength=292.1;
	};
	class hlc_rifle_RU556: hlc_ar15_base
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=261.62;
	};
	class hlc_rifle_RU5562: hlc_rifle_RU556
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=261.62;
	};
	class hlc_rifle_CQBR: hlc_rifle_RU556
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=254.0;
	};
	class hlc_rifle_M4: hlc_rifle_RU556
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=368.3;
	};
	class hlc_rifle_bcmjack: hlc_ar15_base
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=368.3;
	};
	class hlc_rifle_Colt727: hlc_ar15_base
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=368.3;
	};
	class hlc_rifle_Colt727_GL: hlc_rifle_Colt727
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=368.3;
	};
	class hlc_rifle_Bushmaster300: hlc_rifle_Colt727
	{
		ACE_barrelTwist=203.2;
		ACE_barrelLength=368.3;
	};
	class hlc_rifle_vendimus: hlc_rifle_Bushmaster300
	{
		ACE_barrelTwist=203.2;
		ACE_barrelLength=406.4;
	};
	class hlc_rifle_SAMR: hlc_rifle_RU556
	{
        ACE_barrelTwist=228.6;
        ACE_barrelLength=406.4;
	};
	class hlc_rifle_honeybase: hlc_rifle_RU556
	{
        ACE_barrelTwist=203.2;
        ACE_barrelLength=152.4;
	};
};