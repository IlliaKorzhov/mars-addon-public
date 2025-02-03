native GetPlayerUnitTypeCount takes player p, integer unitid returns integer

native GetUnitGoldCost takes integer unitid returns integer
native GetUnitWoodCost takes integer unitid returns integer
native GetUnitBuildTime takes integer unitid returns integer

native UnitAlive takes unit id returns boolean

// GetUnitGoldCost, GetUnitWoodCost и GetUnitBuildTime критуют, если передать равкод, содержащий буквы верхнего регистра.

globals
	unit TempUnit // НЕ ИСПОЛЬЗОВАТЬ ВНУТРИ ИВЕНТОВ
	real TempX
	real TempY
	timer TempTimer
	group TempGroup // НЕ ИСПОЛЬЗОВАТЬ ВНУТРИ ИВЕНТОВ
	trigger TempTrigger

	integer Index

	integer This
	integer AbilityID

	unit FilterUnit
	unit TriggerUnit
	unit EnumUnit
	unit ReturnedUnit
	unit FilteredUnit

	boolean WantDelay = false

	//deprecated
	integer SplashType = 0
	real SplashChance = 0
	real SplashPercent = 0
	real SplashRadius = 0
	real SplashAngle = 0
	integer iS = 0
	integer iE = 0
	group bGroup = CreateGroup()

	// фейк переменная
	unit array udg_Talent_Tree
	integer udg_Hero_XP_PercInt
	integer array udg_Hero_XP_Percent
	real array udg_Hero_HP_Reg_Scale_Main
	real array udg_Hero_MS_Simple
	boolean udg_Mode_Team = false
	boolean udg_Rev_Duel = false
	boolean udg_Rev_End = false
	//trigger gg_trg_HealEvent = CreateTrigger()
	//trigger gg_trg_HealLifestealEvent = CreateTrigger()
	trigger gg_trg_Debuff_Strong = CreateTrigger()
	//trigger gg_trg_RestoreEvent = CreateTrigger()
	hashtable udg_HT_GUI = InitHashtable()
	unit udg_AS_AuraUnit = null
	integer udg_AS_TypeId = 0
	item udg_AS_ItemAura = null
	integer udg_AS_Priority = 0
	boolean udg_AS_MultiAurasForOwner = false
	boolean udg_AS_MultiAurasToTarget = false
	boolean udg_AS_RefreshOutEnter = false
	boolean udg_AS_HardRefresh = false
	integer udg_AS_ActionsId = 0
	boolexpr udg_AS_Filter = null
	real udg_AS_RadiusMax = 0
	real udg_AS_EndDuration = 0
	boolean udg_AS_PeriodActions = false
	real udg_AS_Period = 0
	integer udg_BS_StackDataInt = 0
	real udg_BS_StackDataReal
	unit udg_BS_TargetUnit = null 
	unit udg_BS_OwnerUnit = null
	integer udg_BS_TypeID = 0 
	integer udg_BS_ActionsID = 0 
	real udg_BS_Duration = 0 
	integer udg_BS_Rank = 0 
	integer udg_BS_DispelDifficulty = 0 
	boolean udg_BS_Stackable = false 
	boolean udg_BS_SingleDuration = false 
	boolean udg_BS_SingleOutEnter = false 
	boolean udg_BS_SinglePeriod = false 
	integer udg_BS_CountStacks = 0 
	boolean udg_BS_PierceInvul = false 
	boolean udg_BS_PierceSpellImmun = false 
	boolean udg_BS_PierceDeath = false 
	boolean udg_BS_PeriodActions = false 
	real udg_BS_Period = 0
	//unit udg_AttackingUnit = null
	//unit udg_AttackedUnit = null
	real array udg_Smart_Real
	unit udg_Debuff_Caster_Strong = null
endglobals
