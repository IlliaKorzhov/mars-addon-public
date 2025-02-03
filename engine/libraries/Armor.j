library Armor initializer init requires TechUtils
	globals
		private key ParentKey
		private real LogBase
		private constant hashtable Hash = InitHashtable()

		private attacktype AttackType
		private damagetype DamageType
		private constant real AttackType_Mutliplier = 1.
		private constant real ArmorDamageReductionMultiplier = 0.07
		private constant real EtherealHealBonus = 1.66
		private constant real Damage = 100.
		private constant real ValueWhenUnitInvulnerable = 0.

		private boolean IS_EVAL_DAMAGE_GET = false
	endglobals
	
	function DebugMsg takes string s returns nothing
		debug call DisplayTimedTextToPlayer(GetLocalPlayer(), 0., 0., 5., s)
	endfunction

	function IsEvalDamage takes nothing returns boolean
		return IS_EVAL_DAMAGE_GET
	endfunction

	function SetIsEvalDamage takes boolean isEvalDamage returns nothing
		set IS_EVAL_DAMAGE_GET = isEvalDamage
	endfunction

	function EvalDamage takes unit whichUnit, unit target, real damage, attacktype attackType, damagetype damageType returns nothing
		if not IsUnitInvulnerable(target) then
			set IS_EVAL_DAMAGE_GET = true
			call UnitDamageTarget(whichUnit, target, damage, false, false, attackType, damageType, WEAPON_TYPE_WHOKNOWS)
		endif
	endfunction
	
	function GetUnitReduction takes unit u, unit attacking, boolean isSpell returns real
		local integer id = GetHandleId(u)
		local real armorReduction
		
		call SaveBoolean(Hash, ParentKey, id, false)
		call SaveInteger(Hash, ParentKey, id, 1)

		if isSpell then
			set AttackType = ATTACK_TYPE_NORMAL
			set DamageType = DAMAGE_TYPE_MAGIC
		else
			set DamageType = DAMAGE_TYPE_NORMAL
			if IsUnitType(attacking, UNIT_TYPE_HERO) then
				set AttackType = ATTACK_TYPE_HERO
			else
				set AttackType = ATTACK_TYPE_CHAOS
			endif
		endif
		call EvalDamage(u, u, Damage, AttackType, DamageType)
		if not HaveSavedReal(Hash, ParentKey, id) then
			// unit is ethereal
			//call DebugMsg("Unit is ethereal")
			call SaveBoolean(Hash, ParentKey, id, true)
			call EvalDamage(u, u, Damage, ATTACK_TYPE_MAGIC, DamageType)
		endif
		set armorReduction = LoadReal(Hash, ParentKey, id)
		call RemoveSavedBoolean(Hash, ParentKey, id)
		call RemoveSavedInteger(Hash, ParentKey, id)  // redundant, but necessary if no trigger for damage is defined
		call RemoveSavedReal(Hash, ParentKey, id)
		return armorReduction
	endfunction

	function GetUnitArmorReduction takes unit u, unit attacking returns real
		return GetUnitReduction(u, attacking, false)
	endfunction

	function GetUnitSpellReduction takes unit u, unit attacking returns real
		return GetUnitReduction(u, attacking, true)
	endfunction
	
	function EvalArmor takes nothing returns boolean
		local integer id = GetHandleId(GetTriggerUnit())
		local real reduction
		local real armorReduction
		if HaveSavedInteger(Hash, ParentKey, id) then
			call RemoveSavedInteger(Hash, ParentKey, id)
			// call DebugMsg("Damage taken " + R2SW(GetEventDamage(), 0, -1))
			
			if GetEventDamage() > 0. then
				call NegateDamage(GetTriggerUnit(), GetEventDamage())
				
				// total_damage = damage * (1 - reduction) * armor_type_multiplier
				// reduction = 1 - total_damage / damage / armor_type_multiplier
				if LoadBoolean(Hash, ParentKey, id) then
					// unit is ethereal
					set reduction = 1. - GetEventDamage() / Damage / EtherealHealBonus
				else
					set reduction = 1. - GetEventDamage() / Damage / AttackType_Mutliplier
				endif
				set armorReduction = reduction
				// call DebugMsg("Reduction " + R2SW(reduction, 0, -1))
				
				// For armor formulas, please, refer to these articles
				// http://classic.battle.net/war3/basics/armorandweapontypes.shtml
				// https://warcraft3.info/articles/208/overview-of-armor-and-damage-reduction
				// armor > 0 -- Damage Reduction = (armor * constant) / (1 + constant * armor)
				// armor < 0 -- Damage Increment = 2 - (1 - constant) ^ (-armor)
				// if reduction < 0. then
					// -reduction = 1 - (1 - multiplier) ^ (-armor)
					// reduction = (1 - multiplier) ^ (-armor) - 1
					// armor = - ln(r + 1) / ln(1 - multiplier)
					// set armor = - Ln(reduction + 1.) / LogBase
				// else
					// reduction = multiplier * armor / (1 + multiplier * armor)
					// armor = reduction / multiplier / (1 - reduction)
					// set armor = reduction / ArmorDamageReductionMultiplier / (1. - reduction)
				// endif
			else
				set armorReduction = ValueWhenUnitInvulnerable
			endif
			
			call SaveReal(Hash, ParentKey, id, armorReduction)
			return true
		endif
		return false
	endfunction
	
	//function CleanGroup takes nothing returns nothing
	//    local unit u
	//    
	//    loop
	//        set u = FirstOfGroup(TrackedUnits)
	//        exitwhen u == null
	//        call GroupRemoveUnit(TrackedUnits, u)
	//        if GetUnitTypeId(u) == 0 then
	//            // Unit does not exist
	//            call RemoveSavedReal(Hash, ParentKey, GetHandleId(u))
	//        else
	//            call GroupAddUnit(TempGroup, u)
	//        endif
	//    endloop
	//    
	//    loop
	//        set u = FirstOfGroup(TempGroup)
	//        exitwhen u == null
	//        call GroupRemoveUnit(TempGroup, u)
	//        call GroupAddUnit(TrackedUnits, u)
	//    endloop
	//endfunction
	
	private function init takes nothing returns nothing
		set LogBase = Ln(1. - ArmorDamageReductionMultiplier)
		
		//call TimerStart(Timer, CleanPeriod, true, function CleanGroup)
	endfunction
	
endlibrary
