//! nocjass
//! zinc

	// engine

	//! import vjass    "./config/dev_kane/header.j"
	//! import zinc     "./config/dev_kane/constants.zn"

	//! import vjass    "./engine/functions/CoordUtils.j"
	//! import zinc     "./engine/functions/GameUtils.zn"
	//! import vjass    "./engine/functions/TechUtils.j"
	//! import zinc     "./engine/functions/TexttagUtils.zn"

	//! import zinc     "./engine/hashtable/HashCleaner.zn"
	//! import zinc     "./engine/hashtable/HashId.zn"

	//! import vjass    "./engine/libraries/Armor.j"
	//! import vjass    "./engine/libraries/Math.j"
	//! import vjass    "./engine/libraries/NegateDamage.j"
	//! import vjass    "./engine/libraries/SetUnitMaxState.j"
	//! import vjass    "./engine/libraries/UnitDamaged.j"
	//! import vjass    "./engine/libraries/UnitUnstuck.j"
	//! import zinc     "./engine/libraries/Debug.zn"
	//! import zinc     "./engine/libraries/Parabolas.zn"
	//! import zinc     "./engine/libraries/Points.zn"
	//! import zinc     "./engine/libraries/Rectangle.zn"
	//! import zinc     "./engine/libraries/Attachment.zn"
	//! import zinc     "./engine/libraries/JumpToPoint.zn"
	//! import zinc     "./engine/libraries/FloatingText.zn"
	//! import zinc     "./engine/libraries/Vector.zn"
	//! import zinc     "./engine/libraries/VectorAPI.zn"
//	//!  import vjass    "./engine/libraries/AntiMH.j"

	//! import zinc     "./engine/systems/AreaSpells.zn"
	//! import zinc     "./engine/systems/Auras.zn"
	//! import zinc     "./engine/systems/Buffs.zn"
	//! import zinc     "./engine/systems/Damage.zn"
	//! import zinc     "./engine/systems/Heroes.zn"
	//! import zinc     "./engine/systems/Modifiers.zn"
	//! import zinc     "./engine/systems/MultiModifiers.zn"
	//! import zinc     "./engine/systems/StaticProjectiles.zn"
	//! import zinc     "./engine/systems/Stuns.zn"
	//! import zinc     "./engine/systems/SpellGetters.zn"
	//! import zinc     "./engine/systems/Events.zn"
	//! import zinc     "./engine/systems/DynamicProjectiles.zn"
	//! import zinc     "./engine/systems/Illusions.zn"
	//! import zinc     "./engine/systems/Crystal.zn"

	// mars

	//! import zinc     "./mars/auras/AurasActions_dev.zn"
	//! import zinc     "./mars/auras/AurasFilters.zn"
	//! import zinc     "./mars/auras/AurasTypes.zn"

	//! import zinc     "./mars/buffs/BuffActions_dev.zn"
	//! import zinc     "./mars/buffs/BuffFilters.zn"
	//! import zinc     "./mars/buffs/BuffTypes.zn"

	//! import zinc     "./mars/keys/HashIdGUI.zn"

	//! import zinc     "./mars/modifiers/ModifiersList.zn"
	//! import zinc     "./mars/modifiers/MultiModifiersList.zn"
	//! import zinc     "./mars/modifiers/DodgeStaticModifiers.zn"
	//! import zinc     "./mars/modifiers/PrecedingStaticModifiers.zn"
	//! import zinc     "./mars/modifiers/UniqueStaticModifiers.zn"
	//! import zinc     "./mars/modifiers/PostStaticModifiers.zn"

	//! import zinc     "./mars/spells/heroes/Arthas/ArthasJump.zn"
	//! import zinc     "./mars/spells/heroes/Arthas/ArthasDome.zn"
//	//! import zinc     "./mars/spells/heroes/Hort.zn"
	//! import zinc     "./mars/spells/heroes/Stanley/StanleyMissiles.zn"
	//! import zinc     "./mars/spells/heroes/Stanley/StanleyPiro.zn"
	//! import zinc     "./mars/spells/heroes/Malefic/MaleficWisp.zn"
	//! import zinc     "./mars/spells/heroes/Witcher.zn"
	//! import vjass    "./mars/spells/heroes/Wormy.j"
	//! import vjass    "./mars/spells/heroes/Nomi.j"
	//! import vjass    "./mars/spells/heroes/Hope.j"
	//! import zinc     "./mars/spells/heroes/Gordon.zn"
	//! import zinc     "./mars/spells/heroes/James.zn"
	//! import zinc     "./mars/spells/heroes/Fox.zn"
	//! import zinc     "./mars/spells/heroes/Forg.zn"
	//! import zinc     "./mars/spells/heroes/DebugSpell.zn"
	//! import zinc     "./mars/spells/heroes/Anna.zn"
//	//! import vjass    "./mars/spells/heroes/Anna.j"

	//! import zinc     "./mars/spells/items/HiruzenSpear.zn"

	//! import zinc     "./mars/spells/others/ChainHeal.zn"
	//! import zinc     "./mars/spells/others/ChainLightning.zn"
	//! import zinc     "./mars/spells/others/Chakram.zn"
	//! import zinc     "./mars/spells/others/Doubles.zn"
	//! import zinc     "./mars/spells/others/Hammer.zn"
	//! import zinc     "./mars/spells/others/Lightning.zn"
	//! import zinc     "./mars/spells/others/RectangleSplash.zn"
	//! import zinc     "./mars/spells/others/CliffMiss.zn"

	//! import zinc     "./mars/spells/Filters.zn"
	//! import zinc     "./mars/spells/SpellsTypes.zn"

	// test
//	//! import zinc     "./engine/tests/AurasTest.zn"

//! endzinc
//! endnocjass