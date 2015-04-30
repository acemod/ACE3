
class CfgWeapons
{
	class Rifle_Base_F;
    class hlc_rifle_M14;
	class hlc_M14_base: Rifle_Base_F
	{
		ACE_barrelTwist=12;
		ACE_barrelLength=22;
	};
	class hlc_rifle_m14sopmod: hlc_rifle_M14
	{
		ACE_barrelTwist=12;
		ACE_barrelLength=18;
    };
};
