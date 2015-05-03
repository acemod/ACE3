#include "DamageType.h"

using namespace ace::medical;

injuries::DamageType::DamageType(std::string aTypeName, unsigned int minimalLethalDamage, unsigned int minDamage, unsigned int maxDamage) 
	: typeName(aTypeName), minLethalDamage(minimalLethalDamage), minDamageThreshold(minDamage), maxDamageThreshold(maxDamage)
{
}


injuries::DamageType::~DamageType()
{
}
