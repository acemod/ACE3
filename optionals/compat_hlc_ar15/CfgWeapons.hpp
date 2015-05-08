class CfgWeapons
{
	class Rifle;
	class Rifle_Base_F;
	class hlc_ar15_base: Rifle_Base_F
	{
        ACE_barrelTwist=177.8;
        ACE_barrelLength=0.2921;
	};
	class hlc_rifle_RU556: hlc_ar15_base
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.26162;
	};
	class hlc_rifle_RU5562: hlc_rifle_RU556
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.26162;
	};
	class hlc_rifle_CQBR: hlc_rifle_RU556
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.254;
	};
	class hlc_rifle_M4: hlc_rifle_RU556
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.3683;
	};
	class hlc_rifle_bcmjack: hlc_ar15_base
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.3683;
	};
	class hlc_rifle_Colt727: hlc_ar15_base
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.3683;
	};
	class hlc_rifle_Colt727_GL: hlc_rifle_Colt727
	{
		ACE_barrelTwist=177.8;
		ACE_barrelLength=0.3683;
	};
	class hlc_rifle_Bushmaster300: hlc_rifle_Colt727
	{
		ACE_barrelTwist=203.2;
		ACE_barrelLength=0.3683;
	};
	class hlc_rifle_vendimus: hlc_rifle_Bushmaster300
	{
		ACE_barrelTwist=203.2;
		ACE_barrelLength=0.4064;
	};
	class hlc_rifle_SAMR: hlc_rifle_RU556
	{
        ACE_barrelTwist=228.6;
        ACE_barrelLength=0.4064;
	};
	class hlc_rifle_honeybase: hlc_rifle_RU556
	{
        ACE_barrelTwist=203.2;
        ACE_barrelLength=0.1524;
	};
};