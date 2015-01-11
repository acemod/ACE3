#define true			1
#define false			0

#define private			0
#define protected		1
#define public			2

#define TEast			0
#define TWest			1
#define TGuerrila		2
#define TCivilian		3
#define TSideUnknown		4
#define TEnemy			5
#define TFriendly		6
#define TLogic			7

#define VSoft			0
#define VArmor			1
#define VAir			2

#define LockNo			0
#define LockCadet		1
#define LockYes			2

#define ReadAndWrite		0
#define ReadAndCreate		1
#define ReadOnly		2
#define ReadOnlyVerified	3

#define WeaponNoSlot		0	// dummy weapons
#define WeaponSlotPrimary	1	// primary weapons
#define WeaponSlotSecondary	16	// secondary weapons
#define WeaponSlotItem		256	// items
#define WeaponSlotBinocular	4096	// binocular
#define WeaponHardMounted	65536

#define CanSeeRadar 1
#define CanSeeRye 2
#define CanSeeOptics 4
#define CanSeeEar 4
#define CanSeeCompass 16
#define CanSeeRadarC CanSeeRadar+CanSeeCompass
#define CanSeeAll 31
