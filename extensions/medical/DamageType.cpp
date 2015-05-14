#include "DamageType.h"

using namespace ace::medical;

injuries::DamageType::DamageType(std::string aTypeName, double minimalLethalDamage, double minDamage, double maxDamage) 
    : typeName(aTypeName), minLethalDamage(minimalLethalDamage), minDamageThreshold(minDamage), maxDamageThreshold(maxDamage)
{
}


injuries::DamageType::~DamageType()
{
}
