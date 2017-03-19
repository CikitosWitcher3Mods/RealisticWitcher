class MovementSpeed extends CNewNPC
{
	public final function SetLightAttackSpeed(optional out LightAttackSpeedID : int )
	{
		LightAttackSpeedID = thePlayer.SetAnimationSpeedMultiplier(
			getAttackSpeedMultiplier(), 
			LightAttackSpeedID
		);
		thePlayer.AddTimer( 'ResetLightAttackSpeedID', 0.2 );
	}

	public final function SetHeavyAttackSpeed(optional out HeavyAttackSpeedID : int )
	{
		HeavyAttackSpeedID = thePlayer.SetAnimationSpeedMultiplier(
			getAttackSpeedMultiplier(), 
			HeavyAttackSpeedID
		);
		thePlayer.AddTimer( 'ResetHeavyAttackSpeedID', 0.2 );
	}

	private function getAttackSpeedMultiplier(): float
	{
		var slowestMultiplier: float = 0.7;
		return slowestMultiplier + (getCurrentMeleWeaponLightnessPercentage() / 100);
	}

	private function getCurrentMeleWeaponLightnessPercentage(): float 
	{
		var weaponEncumbrance: float;
		var maxWeaponWeight: float = 5;
		weaponEncumbrance = getCurrentMeleWeaponEncumbrance();

		if (weaponEncumbrance > maxWeaponWeight) {
			return 0;
		}
		return 100 - FloorF((weaponEncumbrance/maxWeaponWeight) * 100);

	}

	private function getCurrentMeleWeaponEncumbrance(): float 
	{
		var item : SItemUniqueId;
		var currentWeaponType: EPlayerWeapon;
		var inventory: CInventoryComponent;

		currentWeaponType = thePlayer.GetCurrentMeleeWeaponType();
		inventory = thePlayer.GetInventory();

		if (currentWeaponType == PW_Steel) {

			inventory.GetItemEquippedOnSlot( EES_SteelSword, item );
			return inventory.GetItemEncumbrance(item);

		} else if (currentWeaponType == PW_Silver) {

			inventory.GetItemEquippedOnSlot( EES_SilverSword, item );
			return inventory.GetItemEncumbrance(item);
		}
		return 0;
	}
}