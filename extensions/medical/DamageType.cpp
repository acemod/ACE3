#include "DamageType.h"

ace::medical::injuries::DamageType::DamageType(std::string aTypeName, double minimalLethalDamage, std::vector<double> minDamage, std::vector<double> amountOfInjuresOnDamage, bool specificOnly)
    : typeName(aTypeName), minLethalDamage(minimalLethalDamage), minDamageThreshold(minDamage), amountOfInjuresOnDamage(amountOfInjuresOnDamage), selectionSpecific(specificOnly)
{
}


ace::medical::injuries::DamageType::~DamageType()
{
}
