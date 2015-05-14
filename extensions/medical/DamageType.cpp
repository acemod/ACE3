#include "DamageType.h"

ace::medical::injuries::DamageType::DamageType(std::string aTypeName, double minimalLethalDamage, double minDamage, double maxDamage)
    : typeName(aTypeName), minLethalDamage(minimalLethalDamage), minDamageThreshold(minDamage), maxDamageThreshold(maxDamage)
{
}


ace::medical::injuries::DamageType::~DamageType()
{
}
