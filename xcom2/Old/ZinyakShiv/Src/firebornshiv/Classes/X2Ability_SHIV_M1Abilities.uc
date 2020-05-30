class X2Ability_SHIV_M1Abilities extends X2Ability config(SHIV_M1);

var WeaponDamageValue trishot_BASEDAMAGE;
var WeaponDamageValue immolate_BASEDAMAGE;
var WeaponDamageValue Sectopod_LightingField_BaseDamageshiv;
var WeaponDamageValue Sectopod_LightingField_BaseDamageshiv2;


var name HighLowValueNamemissles;
var name HeightChangeEffectNamemissles;

var name shivshieldEffectName;
var name shivdamageEffectName;
var name shivteslaEffectName;

const SECTOPOD_LOW_VALUEmissles=0;	// Arbitrary value designated as LOW value
const SECTOPOD_HIGH_VALUEmissles=1;		// Arbitrary value designated as HIGH value

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	
	
	Templates.AddItem(CreateFrenzyDamageListenerAbilityshiv());
	Templates.AddItem(CreateFrenzyTriggerAbilityshiv());
	
	Templates.AddItem(CreateSHIV_M1ImmunitiesAbility());
	Templates.AddItem(shivmodule1());
	Templates.AddItem(shivmodule2());

		Templates.AddItem(Bladestormfb33z());
	Templates.AddItem(BladestormAttackfb33z());
	Templates.AddItem(Createshivdecoy());
	Templates.AddItem(ShivflushAbility());
	Templates.AddItem(shivflushDamage());
	
	Templates.AddItem(TargetDefinitionshiv());
	Templates.AddItem(TargetDefinitionPassiveshiv());
	Templates.AddItem(Createshivshielden());
	Templates.AddItem(Createshivtrishot());
	//Templates.AddItem(Createshivdamagecontrol());
	

	Templates.AddItem(misslebarrage());
	Templates.AddItem(misslebarrage2());
	Templates.AddItem(Addimmolation());
	Templates.AddItem(shivjustice());
	
	Templates.AddItem(Createshivstandardshot());
	Templates.AddItem(FB_Telepshiv());
	Templates.AddItem(Createteslaattack());

	Templates.AddItem(Bladestormfb33zjj());
	Templates.AddItem(BladestormAttackfb33zjj());
	

	Templates.AddItem(teslastarter());
	Templates.AddItem(teslalaunch());
	Templates.AddItem(shivbulwark());


	return Templates;
}



static function X2AbilityTemplate CreateSHIV_M1ImmunitiesAbility(optional Name AbilityName = 'SHIV_M1Immunities')
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_UnitPostBeginPlay Trigger;
	local X2Effect_DamageImmunity DamageImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_andromedon_robotbattlesuit"; // TODO: This needs to be changed

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	
	//Template.AdditionalAbilities.AddItem('XenoV1DeathExplosion');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.bCrossClassEligible = false;

	// Build the immunities
	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, true, true, true);
	DamageImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	DamageImmunity.ImmuneTypes.AddItem('Fire');
	DamageImmunity.ImmuneTypes.AddItem('Poison');
	//DamageImmunity.ImmuneTypes.AddItem('Acid');
	DamageImmunity.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	DamageImmunity.ImmuneTypes.AddItem('Unconscious');
	DamageImmunity.ImmuneTypes.AddItem('mental');
	Template.AddTargetEffect(DamageImmunity);
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}


static function X2AbilityTemplate shivmodule1()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_UnitPostBeginPlay Trigger;
	local X2Effect_SetUnitValue				SetHighValue;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivmodule1');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_rocketlauncher"; // TODO: This needs to be changed

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	
	//Template.AdditionalAbilities.AddItem('XenoV1DeathExplosion');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.bCrossClassEligible = false;
	Template.bDontDisplayInAbilitySummary = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	// Build the immunities
	SetHighValue = new class'X2Effect_SetUnitValue';
	SetHighValue.UnitName = default.HighLowValueNamemissles;
	SetHighValue.NewValueToSet = SECTOPOD_HIGH_VALUEmissles;
	SetHighValue.CleanupType = eCleanup_BeginTactical;
	Template.AddshooterEffect(SetHighValue);
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate shivmodule2()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_UnitPostBeginPlay Trigger;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivmodule2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_shieldwall"; // TODO: This needs to be changed

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	
	//Template.AdditionalAbilities.AddItem('XenoV1DeathExplosion');

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.bCrossClassEligible = false;

	// Build the immunities
	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, true);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, 1);
	Template.AddTargetEffect(PersistentStatChangeEffect);
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}












static function X2AbilityTemplate Bladestormfb33z()
{
	local X2AbilityTemplate                 Template;

	Template = PurePassive('Bladestormfb33z', "img:///UILibrary_PerkIcons.UIPerk_sensorsweep", false, 'eAbilitySource_Perk');
	Template.AdditionalAbilities.AddItem('BladestormAttackfb33z');

	return Template;
}

static function X2AbilityTemplate BladestormAttackfb33z(name TemplateName = 'BladestormAttackfb33z')
{
	local X2AbilityTemplate                 Template;
	local X2AbilityToHitCalc_StandardAim  ToHitCalc;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_Persistent               BladestormTargetEffect;
	local X2Condition_UnitEffectsWithAbilitySource BladestormTargetCondition;
	local X2Condition_UnitProperty          SourceNotConcealedCondition;
	local X2Condition_Visibility			TargetVisibilityCondition;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2Condition_UnitProperty UnitPropertyCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_sensorsweep";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	
	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.bReactionFire = true;
	Template.AbilityToHitCalc = ToHitCalc;
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true; // Disable this to allow civilians to be attacked.
	UnitPropertyCondition.ExcludeSquadmates = true;		   // Don't attack other AI units.
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = 500;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//  trigger on movement
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'ObjectMoved';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalOverwatchListener;
	Template.AbilityTriggers.AddItem(Trigger);
	//  trigger on an attack
	//Trigger = new class'X2AbilityTrigger_EventListener';
	//Trigger.ListenerData.EventID = 'AbilityActivated';
	//Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	//Trigger.ListenerData.Filter = eFilter_None;
	//Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalAttackListener;
	//Template.AbilityTriggers.AddItem(Trigger);

	//  it may be the case that enemy movement caused a concealment break, which made Bladestorm applicable - attempt to trigger afterwards
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'UnitConcealmentBroken';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = BladestormConcealmentListenerfb33z;
	Trigger.ListenerData.Priority = 55;
	Template.AbilityTriggers.AddItem(Trigger);

	
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bRequireBasicVisibility = true;
	//TargetVisibilityCondition.bDisablePeeksOnMovement = true; //Don't use peek tiles for over watch shots	
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());



	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);	
	Template.AddShooterEffectExclusions();

	
	

	//Don't trigger when the source is concealed
	SourceNotConcealedCondition = new class'X2Condition_UnitProperty';
	SourceNotConcealedCondition.ExcludeConcealed = true;
	Template.AbilityShooterConditions.AddItem(SourceNotConcealedCondition);

	// Don't trigger if the unit has vanished
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect('Vanish', 'AA_UnitIsConcealed');
	UnitEffectsCondition.AddExcludeEffect('VanishingWind', 'AA_UnitIsConcealed');
	Template.AbilityShooterConditions.AddItem(UnitEffectsCondition);

	Template.bAllowBonusWeaponEffects = true;
	Template.AddTargetEffect(new class'X2Effect_ApplyWeaponDamage');

	//Prevent repeatedly hammering on a unit with Bladestorm triggers.
	//(This effect does nothing, but enables many-to-many marking of which Bladestorm attacks have already occurred each turn.)
	BladestormTargetEffect = new class'X2Effect_Persistent';
	BladestormTargetEffect.BuildPersistentEffect(1, false, true, true, eGameRule_PlayerTurnEnd);
	BladestormTargetEffect.EffectName = 'BladestormTarget';
	BladestormTargetEffect.bApplyOnMiss = true; //Only one chance, even if you miss (prevents crazy flailing counter-attack chains with a Muton, for example)
	Template.AddTargetEffect(BladestormTargetEffect);
	
	BladestormTargetCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	BladestormTargetCondition.AddExcludeEffect('BladestormTarget', 'AA_DuplicateEffectIgnored');

	Template.AbilityTargetConditions.AddItem(BladestormTargetCondition);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BladeStorm_BuildVisualizationfb33z;
	Template.bShowActivation = true;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;

	//BEGIN AUTOGENERATED CODE: Template Overrides 'BladestormAttack'
	Template.bFrameEvenWhenUnitIsHidden = true;
	//END AUTOGENERATED CODE: Template Overrides 'BladestormAttack'

	return Template;
}

//Must be static, because it will be called with a different object (an XComGameState_Ability)
//Used to trigger Bladestorm when the source's concealment is broken by a unit in melee range (the regular movement triggers get called too soon)
static function EventListenerReturn BladestormConcealmentListenerfb33z(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Unit ConcealmentBrokenUnit;
	local StateObjectReference BladestormRef;
	local XComGameState_Ability BladestormState;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;

	ConcealmentBrokenUnit = XComGameState_Unit(EventSource);	
	if (ConcealmentBrokenUnit == None)
		return ELR_NoInterrupt;

	//Do not trigger if the Bladestorm Ranger himself moved to cause the concealment break - only when an enemy moved and caused it.
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext().GetFirstStateInEventChain().GetContext());
	if (AbilityContext != None && AbilityContext.InputContext.SourceObject != ConcealmentBrokenUnit.ConcealmentBrokenByUnitRef)
		return ELR_NoInterrupt;

	BladestormRef = ConcealmentBrokenUnit.FindAbility('BladestormAttackfb33z');
	if (BladestormRef.ObjectID == 0)
		return ELR_NoInterrupt;

	BladestormState = XComGameState_Ability(History.GetGameStateForObjectID(BladestormRef.ObjectID));
	if (BladestormState == None)
		return ELR_NoInterrupt;
	
	BladestormState.AbilityTriggerAgainstSingleTarget(ConcealmentBrokenUnit.ConcealmentBrokenByUnitRef, false);
	return ELR_NoInterrupt;
}

simulated function BladeStorm_BuildVisualizationfb33z(XComGameState VisualizeGameState)
{
	// Build the first shot of Bladestorm's visualization
	TypicalAbility_BuildVisualization(VisualizeGameState);
}


static function X2AbilityTemplate Createshivdecoy()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	
	local X2AbilityCooldown				Cooldown;
		local X2Condition_UnitImmunities	UnitImmunityCondition;
	local X2Condition_UnitEffects		ExcludeEffects;
	local X2Effect_Panicked             PanickedEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2Effect_SetUnitValue				SetLowValue;
	local X2Effect_DamageImmunity           DamageImmunity;
	local X2Condition_UnitProperty      UnitProperty;
	local X2Effect_LoadPerksfb8				LoadPerks;
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivshield');
	//IconImage needs to be changed once there is an icon for this
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_mobilecover";

	
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_alwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDontDisplayInAbilitySummary = true;
	

	Template.AbilityTargetStyle = default.SelfTarget;
	
	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty);
	Template.AbilityToHitCalc = default.DeadEye;

	

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	//Triggered by player or AI
	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	//fire from self, with a radius amount

	
	LoadPerks = new class'X2Effect_LoadPerksfb8';
	LoadPerks.AbilityPerkToLoad = 'shivshield';
	Template.AddShooterEffect(LoadPerks);




	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 5;
	Template.AbilityCooldown = Cooldown;



	DamageImmunity = new class'X2Effect_DamageImmunity';
	DamageImmunity.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
    DamageImmunity.ImmueTypesAreInclusive = false; 
	DamageImmunity.EffectName = default.shivshieldEffectName;
	Template.AddTargetEffect(DamageImmunity);


	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.bSkipExitCoverWhenFiring = true;
	Template.CustomFireAnim = 'HL_cast';
	Template.CinescriptCameraType = "Sectopod_LightningField";
	
	return Template;
}




static function X2AbilityTemplate ShivflushAbility()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCooldown                 Cooldown;
	local X2AbilityToHitCalc_StandardAim    ToHitCalc;
	local X2Condition_Visibility            TargetVisibilityCondition;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2Effect_RunBehaviorTree FrenzyBehaviorEffect66;
	local X2Effect_GrantActionPoints	ActionPointsEffect;
	local X2Condition_UnitProperty					TargetCondition;
	local X2Effect_Knockback						KnockbackEffect;
	
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivflush');

	Template.AdditionalAbilities.AddItem('shivflushDamage');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stun";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	ToHitCalc.FinalMultiplier = -0.35f;
	Template.AbilityToHitCalc = ToHitCalc;

	AmmoCost = new class'X2AbilityCost_Ammo';
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bAddWeaponTypicalCost = true;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);

	//  Put holo target effect first because if the target dies from this shot, it will be too late to notify the effect.
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());
	Template.AddTargetEffect(default.WeaponUpgradeMissDamage);


	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeLargeUnits = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 3;
	KnockbackEffect.OnlyOnDeath = false; 
	Template.AddTargetEffect(KnockbackEffect);
	


	//WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	//Template.AddTargetEffect(WeaponDamageEffect);
	
	Template.bAllowAmmoEffects = true;
	Template.bAllowBonusWeaponEffects = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.CinescriptCameraType = " ";

	Template.bCrossClassEligible = false;
	
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActivationSpeech = 'DeadEye';

	return Template;
}

static function X2AbilityTemplate shivflushDamage()
{
	local X2AbilityTemplate						Template;
	local X2flusheffect               DamageEffect;

	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivflushDamage');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stun";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DamageEffect = new class'X2flusheffect';
	DamageEffect.BuildPersistentEffect(1, true, false, false);
	DamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false,,Template.AbilitySourceName);
	Template.AddTargetEffect(DamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}


static function X2AbilityTemplate TargetDefinitionshiv()
{
	local X2AbilityTemplate					Template;
	local X2Effect_TargetDefinition			Effect;
	local X2Condition_UnitEffects			EffectsCondition;
	local X2Condition_UnitProperty			CivilianProperty;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Condition_UnitProperty			TargetCondition;
	local X2Condition_Visibility			VisibilityCondition;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TargetDefinitionshiv');
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_targetdefinition";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_UnitSeesUnit;
	Trigger.ListenerData.EventID = 'UnitSeesUnit';
	Template.AbilityTriggers.AddItem(Trigger);
	
	EffectsCondition = new class'X2Condition_UnitEffects';
	EffectsCondition.AddExcludeEffect(class'X2Effect_TargetDefinition'.default.EffectName, 'AA_DuplicateEffectIgnored');
	Template.AbilityTargetConditions.AddItem(EffectsCondition);

	TargetCondition = new class'X2Condition_UnitProperty';	
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	//Can only apply this to targets we can see
	VisibilityCondition = new class'X2Condition_Visibility';
	VisibilityCondition.bRequireGameplayVisible = true;
	VisibilityCondition.bRequireBasicVisibility = true;	
	Template.AbilityTargetConditions.AddItem(VisibilityCondition);

	//Target definition is not necessary for friendlies, as they are always visible to the player

	Effect = new class'X2Effect_TargetDefinition';
	Effect.BuildPersistentEffect(1, true, false, false);
	Effect.TargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	Template.AddTargetEffect(Effect);

	Effect = new class'X2Effect_TargetDefinition';
	Effect.BuildPersistentEffect(1, true, false, false);
	CivilianProperty = new class'X2Condition_UnitProperty';
	CivilianProperty.ExcludeNonCivilian = true;
	CivilianProperty.ExcludeHostileToSource = false;
	CivilianProperty.ExcludeFriendlyToSource = false;
	Effect.TargetConditions.AddItem(CivilianProperty);
	Template.AddTargetEffect(Effect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bSkipFireAction = true;

	Template.AdditionalAbilities.AddItem('TargetDefinitionPassiveshiv');
//BEGIN AUTOGENERATED CODE: Template Overrides 'TargetDefinition'
	Template.ActivationSpeech = 'TargetDefinition';
//END AUTOGENERATED CODE: Template Overrides 'TargetDefinition'

	Template.ConcealmentRule = eConceal_AlwaysEvenWithObjective;

	return Template;
}

static function X2AbilityTemplate TargetDefinitionPassiveshiv()
{
	return PurePassive('TargetDefinitionPassiveshiv', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_targetdefinition", , 'eAbilitySource_Perk', true);
}






static function X2DataTemplate Createshivshielden()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;

	local X2Condition_UnitProperty UnitPropertyCondition;
	local X2AbilityTrigger_PlayerInput InputTrigger;
	local X2Effect_PersistentStatChange ShieldedEffect;

	local X2AbilityTrigger_EventListener    EventTrigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivshielden');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_armoredshell";
	

	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.Hostility = eHostility_Defensive;

	// This ability is a free action
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 0;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);


	//Can't use while dead
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	// Add dead eye to guarantee
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);



	EventTrigger = new class'X2AbilityTrigger_EventListener';
	EventTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventTrigger.ListenerData.EventID = 'PlayerTurnBegun';
	EventTrigger.ListenerData.Filter = eFilter_Player;
	EventTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventTrigger);




	// The Targets must be within the AOE, LOS, and friendly
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeHostileToSource = true;
	UnitPropertyCondition.ExcludeCivilian = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.RequireSquadmates = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	// Friendlies in the radius receives a shield receives a shield
	ShieldedEffect = CreateShieldedEffect(Template.LocFriendlyName, Template.GetMyLongDescription(), 3);

	Template.AddShooterEffect(ShieldedEffect);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Shielded_BuildVisualization;
	Template.CinescriptCameraType = "AdvShieldBearer_EnergyShieldArmor";
	
	return Template;
}

static function X2Effect_PersistentStatChange CreateShieldedEffect(string FriendlyName, string LongDescription, int ShieldHPAmount)
{
	local X2Effect_EnergyShield ShieldedEffect;

	ShieldedEffect = new class'X2Effect_EnergyShield';
	ShieldedEffect.BuildPersistentEffect(1, true, true, , eGameRule_PlayerTurnEnd);
	ShieldedEffect.SetDisplayInfo(ePerkBuff_Bonus, FriendlyName, LongDescription, "img:///UILibrary_PerkIcons.UIPerk_adventshieldbearer_energyshield", true);
	ShieldedEffect.AddPersistentStatChange(eStat_ShieldHP, ShieldHPAmount);
	ShieldedEffect.EffectRemovedVisualizationFn = OnShieldRemoved_BuildVisualization;

	return ShieldedEffect;
}

simulated function OnShieldRemoved_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	if (XGUnit(ActionMetadata.VisualizeActor).IsAlive())
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, class'XLocalizedData'.default.ShieldRemovedMsg, '', eColor_Bad, , 0.75, true);
	}
}

simulated function Shielded_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
	local X2Action_PlayAnimation PlayAnimationAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	PlayAnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	PlayAnimationAction.Params.AnimName = 'HL_EnergyShield';

	}


	static function X2AbilityTemplate Createshivtrishot(optional Name TemplateName = 'shivtrishot')
{
	local X2AbilityTemplate	Template;
	local int				AbilityCostIndex;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityMultiTarget_BurstFire    BurstFireMultiTarget;
	local X2AbilityCooldown                 Cooldown;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2Effect_ApplyWeaponDamage DamageEffect2;

	Template = class'X2Ability_WeaponCommon'.static.Add_StandardShot(TemplateName);
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_wholenineyards";
	

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 3;
	Template.AbilityCosts.AddItem(AmmoCost);
	
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);
	Template.AddMultiTargetEffect(WeaponDamageEffect);

	BurstFireMultiTarget = new class'X2AbilityMultiTarget_BurstFire';
	BurstFireMultiTarget.NumExtraShots = 2;
	Template.AbilityMultiTargetStyle = BurstFireMultiTarget;
	
	DamageEffect2 = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect2.EffectDamageValue = default.trishot_BASEDAMAGE;
	DamageEffect2.bIgnoreBaseDamage=True;
	DamageEffect2.bAllowFreeKill=false;
	DamageEffect2.bBypassShields=True;
	DamageEffect2.bIgnoreArmor=True;
	Template.AddshooterEffect(DamageEffect2);

	Template.CustomFireAnim = 'FF_fireC';

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('BlasterDuringCannon');
	Template.CinescriptCameraType = " ";
//BEGIN AUTOGENERATED CODE: Template Overrides 'Blaster'
//BEGIN AUTOGENERATED CODE: Template Overrides 'BlasterDuringCannon'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'BlasterDuringCannon'
//END AUTOGENERATED CODE: Template Overrides 'Blaster'

	return Template;
}




static function X2AbilityTemplate CreateFrenzyDamageListenerAbilityshiv()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener EventListener;
	local X2Condition_UnitEffects ExcludeEffects;
	local X2Condition_UnitProperty UnitProperty;
	local X2Effect_RunBehaviorTree FrenzyBehaviorEffect;
	local array<name> SkipExclusions;
	local X2AbilityCooldown				Cooldown;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivdamagecontrol');
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_closecyberdisc";
	Template.Hostility = eHostility_Neutral;

	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeUnrevealedAI = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty);

	Template.bDontDisplayInAbilitySummary = true;

	//Template.AdditionalAbilities.AddItem('FrenzyInfo');
	Template.AdditionalAbilities.AddItem('FrenzyTriggershiv');

	// Frenzy may trigger if the unit is burning
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// This ability fires when the unit takes damage
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'UnitTakeEffectDamage';
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	EventListener.ListenerData.Filter = eFilter_Unit;
	Template.AbilityTriggers.AddItem(EventListener);



	// The shooter must not have Frenzy activated
	ExcludeEffects = new class'X2Condition_UnitEffects';
	ExcludeEffects.AddExcludeEffect(class'X2Effect_Frenzy'.default.EffectName, 'AA_UnitIsFrenzied');
	Template.AbilityShooterConditions.AddItem(ExcludeEffects);

	Template.AbilityTargetStyle = default.SelfTarget;

	FrenzyBehaviorEffect = new class'X2Effect_RunBehaviorTree';
	FrenzyBehaviorEffect.BehaviorTreeName = 'TryFrenzyTriggershiv';
	Template.AddTargetEffect(FrenzyBehaviorEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}

static function X2AbilityTemplate CreateFrenzyTriggerAbilityshiv()
{
	local X2AbilityTemplate Template;
	local X2Condition_UnitEffects ExcludeEffects;
	local X2Condition_UnitProperty UnitProperty;
	local X2Effect_PersistentStatChange FrenzyEffect;
	local array<name> SkipExclusions;
	

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FrenzyTriggershiv');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_closecyberdisc";
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Defensive;

	Template.bDontDisplayInAbilitySummary = true;

	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeUnrevealedAI = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);

	

	// Frenzy may trigger if the unit is burning
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// The shooter must not have Frenzy activated
	ExcludeEffects = new class'X2Condition_UnitEffects';
	ExcludeEffects.AddExcludeEffect(class'X2Effect_Frenzy'.default.EffectName, 'AA_UnitIsFrenzied');
	Template.AbilityShooterConditions.AddItem(ExcludeEffects);

	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');

	FrenzyEffect = new class'X2Effect_PersistentStatChange';
	FrenzyEffect.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnEnd);
	FrenzyEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true);
	FrenzyEffect.AddPersistentStatChange(eStat_ArmorMitigation, 3);
	FrenzyEffect.DuplicateResponse = eDupe_Ignore;
	FrenzyEffect.EffectHierarchyValue = class'X2StatusEffects'.default.FRENZY_HIERARCHY_VALUE;
	Template.AddTargetEffect(FrenzyEffect);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.bSkipFireAction = true;
	Template.BuildVisualizationFn = Frenzy_BuildVisualization;
	Template.CinescriptCameraType = "Archon_Frenzy";

	return Template;
}

simulated function Frenzy_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  Context;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
	local int EffectIndex;
	local X2Action_PlayAnimation PlayAnimation;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	if( Context.IsResultContextHit() )
	{
		InteractingUnitRef = Context.InputContext.SourceObject;

		AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(Context.InputContext.AbilityTemplateName);

		//****************************************************************************************
		//Configure the visualization track for the target
		//****************************************************************************************
		InteractingUnitRef = Context.InputContext.PrimaryTarget;
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		//PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
	//	PlayAnimation.Params.AnimName = 'HL_damage';
	//	PlayAnimation.bFinishAnimationWait = false;

		for (EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex)
		{
			AbilityTemplate.AbilityTargetEffects[EffectIndex].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, Context.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[EffectIndex]));
		}

		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_good);

				//****************************************************************************************
	}
}




















static function X2AbilityTemplate misslebarrage()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityCharges                      Charges;
	local X2AbilityCost_Charges                 ChargeCost;
	local X2AbilityMultiTarget_BlazingPinions BlazingPinionsMultiTarget;
	local X2AbilityTarget_Cursor CursorTarget;
	local X2Condition_UnitProperty UnitProperty;
	local X2Effect_DelayedAbilityActivation BlazingPinionsStage1DelayEffect;
	local X2Effect_Persistent BlazingPinionsStage1Effect;
	local X2Condition_UnitValue				IsHigh;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'barrageStrike');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_rocketlauncher";
	Template.Hostility = eHostility_Offensive;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.bShowActivation = true;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailable;
	Template.TwoTurnAttackAbility = 'CallSatStrike2';
	Template.bDontDisplayInAbilitySummary = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	IsHigh = new class'X2Condition_UnitValue';
	IsHigh.AddCheckValue(default.HighLowValueNamemissles, SECTOPOD_HIGH_VALUEmissles, eCheck_Exact);
	Template.AbilityShooterConditions.AddItem(IsHigh);
	

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Charges = new class 'X2AbilityCharges';
	Charges.InitialCharges = 2;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	

	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AddShooterEffectExclusions();
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
 
	Template.TargetingMethod = class'X2TargetingMethod_BlazingPinions';

	// The target locations are enemies
	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeFriendlyToSource = true;
	UnitProperty.ExcludeCivilian = true;
	UnitProperty.ExcludeDead = true;
	UnitProperty.FailOnNonUnits = true;
	UnitProperty.IsOutdoors = true;
	UnitProperty.HasClearanceToMaxZ = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitProperty);

	BlazingPinionsMultiTarget = new class'X2AbilityMultiTarget_BlazingPinions';
	BlazingPinionsMultiTarget.fTargetRadius = 10;
	BlazingPinionsMultiTarget.NumTargetsRequired = 6;
	Template.AbilityMultiTargetStyle = BlazingPinionsMultiTarget;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = 60;
	Template.AbilityTargetStyle = CursorTarget;

	//Delayed Effect to cause the second Blazing Pinions stage to occur
	BlazingPinionsStage1DelayEffect = new class 'X2Effect_DelayedAbilityActivation';
	BlazingPinionsStage1DelayEffect.BuildPersistentEffect(1, false, false, , eGameRule_PlayerTurnBegin);
	BlazingPinionsStage1DelayEffect.EffectName = 'BlazingPinionsStage1Delay';
	BlazingPinionsStage1DelayEffect.TriggerEventName = 'BlazingPinionsStage2Trigger';
	BlazingPinionsStage1DelayEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddShooterEffect(BlazingPinionsStage1DelayEffect);

	// An effect to attach Perk FX to
	BlazingPinionsStage1Effect = new class'X2Effect_Persistent';
	BlazingPinionsStage1Effect.BuildPersistentEffect(1, true, false, true);
	BlazingPinionsStage1Effect.EffectName = 'BlazingPinionsStage1Effect';
	Template.AddShooterEffect(BlazingPinionsStage1Effect);

	Template.ActivationSpeech = 'Flamethrower';
	Template.bCrossClassEligible = false;

	//  The target FX goes in target array as there will be no single target hit and no side effects of this touching a unit
	Template.AddShooterEffect(new class'X2Effect_ApplyBlazingPinionsTargetToWorld');

	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = SatStrikeStage1_BuildVisualization;
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";
	Template.bFrameEvenWhenUnitIsHidden = true;
	
	return Template;
}

simulated function SatStrikeStage1_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack, ActionMetadata;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local int i;
	local X2Action_MoveTurn MoveTurnAction;
	local X2Action_PlayAnimation PlayAnimation;
	local X2Action_CameraFrameAbility FrameAction;

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);


	FrameAction = X2Action_CameraFrameAbility(class'X2Action_CameraFrameAbility'.static.AddToVisualizationTree(ActionMetadata, abilityContext));
	FrameAction.AbilitiesToFrame.AddItem(abilityContext);
	
	


	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Bad);


	// Turn to face the target action. The target location is the center of the ability's radius, stored in the 0 index of the TargetLocations
	MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	MoveTurnAction.m_vFacePoint = AbilityContext.InputContext.TargetLocations[0];

	// Fly up actions
	//class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, ActionMetadata);

	// Play the animation to get him to his looping idle
	PlayAnimation = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	PlayAnimation.Params.AnimName = 'FF_jav';
	PlayAnimation.bFinishAnimationWait = true;
	
	for( i = 0; i < AbilityContext.ResultContext.ShooterEffectResults.Effects.Length; ++i )
	{
		AbilityContext.ResultContext.ShooterEffectResults.Effects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 
																								  AbilityContext.ResultContext.ShooterEffectResults.ApplyResults[i]);
	}

}

static function X2AbilityTemplate misslebarrage2()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_EventListener DelayedEventListener;
	local X2Effect_RemoveEffects RemoveEffects;
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local X2AbilityMultiTarget_Radius RadMultiTarget;
	

	`CREATE_X2ABILITY_TEMPLATE(Template, 'barrageStrike2');
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_rocketlauncher";

	Template.bDontDisplayInAbilitySummary = true;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	
	DelayedEventListener = new class'X2AbilityTrigger_EventListener';
	DelayedEventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	DelayedEventListener.ListenerData.EventID = 'BlazingPinionsStage2Trigger';
	DelayedEventListener.ListenerData.Filter = eFilter_Unit;
	DelayedEventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_BlazingPinions;
	Template.AbilityTriggers.AddItem(DelayedEventListener);



	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem('BlazingPinionsStage1Effect');
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_ApplyBlazingPinionsTargetToWorld'.default.EffectName);
	Template.AddShooterEffect(RemoveEffects);

	RadMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadMultiTarget.fTargetRadius = 6;

	Template.AbilityMultiTargetStyle = RadMultiTarget;

	// The MultiTarget Units are dealt this damage
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bApplyWorldEffectsForEachTargetLocation = true;
	Template.AddMultiTargetEffect(DamageEffect);



	Template.ModifyNewContextFn = SatStrikeStage2_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = BlazingPinionsStage2_BuildGameState;
	Template.BuildVisualizationFn = BlazingPinionsStage2_BuildVisualization;
	Template.CinescriptCameraType = "Soldier_HeavyWeapons";
	Template.bFrameEvenWhenUnitIsHidden = true;

	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.HeavyWeaponLostSpawnIncreasePerUse;

	return Template;
}

simulated function SatStrikeStage2_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local TTile SelectedTile, LandingTile;
	local XComWorldData World;
	local vector TargetLocation, LandingLocation;
	local array<vector> FloorPoints;
	local int i;
	local X2AbilityMultiTargetStyle RadiusMultiTarget;
	local XComGameState_Ability AbilityState;
	local AvailableTarget MultiTargets;
	local PathingInputData InputData;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// Find a valid landing location
	TargetLocation = World.GetPositionFromTileCoordinates(UnitState.TileLocation);

	LandingLocation = TargetLocation;
	LandingLocation.Z = World.GetFloorZForPosition(TargetLocation, true);
	LandingTile = World.GetTileCoordinatesFromPosition(LandingLocation);
	LandingTile = class'Helpers'.static.GetClosestValidTile(LandingTile);

	//if( !World.CanUnitsEnterTile(LandingTile) )
	//{
		// The selected tile is no longer valid. A new landing position
		// must be found. TODO: Decide what to do when FoundFloorPositions is false.
	//	World.GetFloorTilePositions(TargetLocation, World.WORLD_StepSize * 10, World.WORLD_StepSize, FloorPoints, true);

	//	i = 0;
	//	while( i < FloorPoints.Length )
	//	{
	//		LandingLocation = FloorPoints[i];
	//		LandingTile = World.GetTileCoordinatesFromPosition(LandingLocation);
	//		if( World.CanUnitsEnterTile(SelectedTile) )
	//		{
				// Found a valid landing location
	//			i = FloorPoints.Length;
	//		}

	//		++i;
	//	}
	//}

	//Attempting to build a path to our current location causes a problem, so avoid that
	//if(UnitState.TileLocation != LandingTile) 
	//{
		// Build the MovementData for the path
		// solve the path to get him to the end location
	//	class'X2PathSolver'.static.BuildPath(UnitState, UnitState.TileLocation, LandingTile, InputData.MovementTiles, false);

		// get the path points
	//	class'X2PathSolver'.static.GetPathPointsFromPath(UnitState, InputData.MovementTiles, InputData.MovementData);

		// string pull the path to smooth it out
	//	class'XComPath'.static.PerformStringPulling(XGUnitNativeBase(UnitState.GetVisualizer()), InputData.MovementData);

		//Now add the path to the input context
	//	InputData.MovingUnitRef = UnitState.GetReference();
	//	AbilityContext.InputContext.MovementPaths.AddItem(InputData);
	//}

	// Build the MultiTarget array based upon the impact points
	AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(AbilityContext.InputContext.AbilityRef.ObjectID, eReturnType_Reference));
	RadiusMultiTarget = AbilityState.GetMyTemplate().AbilityMultiTargetStyle;// new class'X2AbilityMultiTarget_Radius';

	AbilityContext.ResultContext.ProjectileHitLocations.Length = 0;
	for( i = 0; i < AbilityContext.InputContext.TargetLocations.Length; ++i )
	{
		RadiusMultiTarget.GetMultiTargetsForLocation(AbilityState, AbilityContext.InputContext.TargetLocations[i], MultiTargets);

		// Add the TargetLocations as ProjectileHitLocations
		AbilityContext.ResultContext.ProjectileHitLocations.AddItem(AbilityContext.InputContext.TargetLocations[i]);
	}

	AbilityContext.InputContext.MultiTargets = MultiTargets.AdditionalTargets;
}

simulated function XComGameState BlazingPinionsStage2_BuildGameState(XComGameStateContext Context)
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;	
	local XComGameStateContext_Ability AbilityContext;
	local TTile LandingTile;
	local XComWorldData World;
	local X2EventManager EventManager;
	local vector LandingLocation;
	local int LastPathElement;

	World = `XWORLD;
	EventManager = `XEVENTMGR;

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));
	
	//if(AbilityContext.InputContext.MovementPaths.Length > 0)
	//{
	//	LastPathElement = AbilityContext.InputContext.MovementPaths[0].MovementData.Length - 1;

		// Move the unit vertically, set the unit's new location
		// The last position in MovementData will be the end location
	//	`assert(LastPathElement > 0);
	//	LandingLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[LastPathElement /*- 1*/].Position;
	//	LandingTile = World.GetTileCoordinatesFromPosition(LandingLocation);
	//	UnitState.SetVisibilityLocation(LandingTile);

	//	AbilityContext.ResultContext.bPathCausesDestruction = MoveAbility_StepCausesDestruction(UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
	//	MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
	//	EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
	//	EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);
	//}

	//Return the game state we have created
	return NewGameState;
}

simulated function BlazingPinionsStage2_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local X2Action_PersistentEffect	PersistentEffectAction;
	local int i, j;
	local X2VisualizerInterface TargetVisualizerInterface;

	local XComGameState_EnvironmentDamage EnvironmentDamageEvent;
	local XComGameState_WorldEffectTileData WorldDataUpdate;
	local XComGameState_InteractiveObject InteractiveObject;
	local X2Action_CameraFrameAbility FrameAction;

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	FrameAction = X2Action_CameraFrameAbility(class'X2Action_CameraFrameAbility'.static.AddToVisualizationTree(ActionMetadata, abilityContext));
	FrameAction.AbilitiesToFrame.AddItem(abilityContext);
	


	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Bad);

	// Remove the override idle animation
	PersistentEffectAction = X2Action_PersistentEffect(class'X2Action_PersistentEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	PersistentEffectAction.IdleAnimName = '';

	// Play the firing action
	class'X2Action_BlazingPinionsStage2'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

	for( i = 0; i < AbilityContext.ResultContext.ShooterEffectResults.Effects.Length; ++i )
	{
		AbilityContext.ResultContext.ShooterEffectResults.Effects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 
																								  AbilityContext.ResultContext.ShooterEffectResults.ApplyResults[i]);
	}

	//if(AbilityContext.InputContext.MovementPaths.Length > 0)
	//{
	//	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, ActionMetadata);
	//}
	

		//****************************************************************************************

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for (i = 0; i < AbilityContext.InputContext.MultiTargets.Length; ++i)
	{
		InteractingUnitRef = AbilityContext.InputContext.MultiTargets[i];
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);
		for( j = 0; j < AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, AbilityContext.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}
	}

	//****************************************************************************************
	//Configure the visualization tracks for the environment
	//****************************************************************************************
	foreach VisualizeGameState.IterateByClassType(class'XComGameState_EnvironmentDamage', EnvironmentDamageEvent)
	{
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = none;
		ActionMetadata.StateObject_NewState = EnvironmentDamageEvent;
		ActionMetadata.StateObject_OldState = EnvironmentDamageEvent;

		//Wait until signaled by the shooter that the projectiles are hitting
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

		for( i = 0; i < AbilityTemplate.AbilityMultiTargetEffects.Length; ++i )
		{
			AbilityTemplate.AbilityMultiTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');	
		}

			}

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_WorldEffectTileData', WorldDataUpdate)
	{
		ActionMetadata = EmptyTrack;
		ActionMetadata.VisualizeActor = none;
		ActionMetadata.StateObject_NewState = WorldDataUpdate;
		ActionMetadata.StateObject_OldState = WorldDataUpdate;

		//Wait until signaled by the shooter that the projectiles are hitting
		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

		for( i = 0; i < AbilityTemplate.AbilityMultiTargetEffects.Length; ++i )
		{
			AbilityTemplate.AbilityMultiTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, 'AA_Success');	
		}

			}
	//****************************************************************************************

	//Process any interactions with interactive objects
	foreach VisualizeGameState.IterateByClassType(class'XComGameState_InteractiveObject', InteractiveObject)
	{
		// Add any doors that need to listen for notification
		if( InteractiveObject.IsDoor() && InteractiveObject.HasDestroyAnim() && InteractiveObject.InteractionCount % 2 != 0 ) //Is this a closed door?
		{
			ActionMetadata = EmptyTrack;
			//Don't necessarily have a previous state, so just use the one we know about
			ActionMetadata.StateObject_OldState = InteractiveObject;
			ActionMetadata.StateObject_NewState = InteractiveObject;
			ActionMetadata.VisualizeActor = History.GetVisualizer(InteractiveObject.ObjectID);
			class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);
			class'X2Action_BreakInteractActor'.static.AddToVisualizationTree(ActionMetadata, AbilityContext);

					}
	}
}




static function X2AbilityTemplate Addimmolation()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCooldown					Cooldown;	
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityTarget_Cursor            CursorTarget;
	local X2AbilityMultiTarget_Radius       RadiusMultiTarget;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2AbilityToHitCalc_StandardAim    StandardAim; 
	local X2AbilityCost_Ammo                AmmoCost;

	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivimmolate');

	Template.Hostility = eHostility_Offensive;
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.bShowActivation = true;
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_alwaysShow;
		
	//action point cost
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	//StandardAim + guaranteed to hit? ok!
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardAim;
	Template.TargetingMethod = class'X2TargetingMethod_RocketLauncher';
	
	// Cooldown on the ability
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = 24;            //  meters
	Template.AbilityTargetStyle = CursorTarget;

	//radius
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = false;
	RadiusMultiTarget.fTargetRadius = 3;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitPropertyCondition);

	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_flamethrower";

	//Fire on targets
	Template.AddMultiTargetEffect(class'X2StatusEffects'.static.CreateBurningStatusEffect(4,2));
	Template.AddMultiTargetEffect(new class'X2Effect_ApplyFireToWorld');

	//apply explosive fire damage
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.bExplosiveDamage = true;
	WeaponDamageEffect.DamageTag = 'Fire';
	WeaponDamageEffect.EffectDamageValue = default.immolate_BASEDAMAGE;
	WeaponDamageEffect.bIgnoreBaseDamage=True;
	Template.AddMultiTargetEffect(WeaponDamageEffect);
	
	
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	Template.bAllowAmmoEffects = true;
	

	//cinematic stuff
	Template.ActivationSpeech = 'Flamethrower';
	
	Template.CinescriptCameraType = "Psionic_FireAtUnit";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.CustomFireAnim = 'FF_immolate';
	Template.bShowActivation = false;
		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	


	//Cant learn it at school
	Template.bCrossClassEligible = false;
	
	return Template;
}


static function X2AbilityTemplate shivJustice()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityCooldown                 Cooldown;
	local X2Condition_UnitProperty          UnitPropertyCondition;
	local X2Condition_UnblockedNeighborTile UnblockedNeighborTileCondition;
	local X2AbilityToHitCalc_StandardAim    StandardAim;
	local X2Effect_GetOverHere              GetOverHereEffect;
	local X2Effect_TriggerEvent				PostAbilityMelee;
	local X2Effect_ApplyWeaponDamage		EnvironmentDamageForProjectile;
	local X2Effect_RemoveEffects			RemoveEffects;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivJustice');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_grapple";

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);

    Cooldown = New class'X2AbilityCooldown';
	Cooldown.iNumTurns = 3;
	Template.AbilityCooldown = Cooldown;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	// There must be a free tile around the source unit
	UnblockedNeighborTileCondition = new class'X2Condition_UnblockedNeighborTile';
	UnblockedNeighborTileCondition.RequireVisible = true;
	Template.AbilityShooterConditions.AddItem(UnblockedNeighborTileCondition);

	// The Target must be alive and a humanoid
	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeRobotic = true;
	UnitPropertyCondition.ExcludeNonHumanoidAliens = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = true;
	UnitPropertyCondition.RequireWithinMinRange = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	//	prevent various stationary units from being pulled inappropriately
	Template.AbilityTargetConditions.AddItem(class'X2Ability_TemplarAbilitySet'.static.InvertAndExchangeEffectsCondition());

	Template.AbilityTargetStyle = new class'X2AbilityTarget_Single';
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);

	// This will attack using the standard aim
	StandardAim = new class'X2AbilityToHitCalc_StandardAim';
	StandardAim.BuiltInHitMod = 25;
	StandardAim.bAllowCrit = false;
	Template.AbilityToHitCalc = StandardAim;

	GetOverHereEffect = new class'X2Effect_GetOverHere';
 	GetOverHereEffect.OverrideStartAnimName = 'NO_GrapplePullStart';
 	GetOverHereEffect.OverrideStopAnimName = 'NO_GrapplePullStop';
	GetOverHereEffect.RequireVisibleTile = true;
	Template.AddTargetEffect(GetOverHereEffect);

	EnvironmentDamageForProjectile = new class'X2Effect_ApplyWeaponDamage';
	EnvironmentDamageForProjectile.bIgnoreBaseDamage = true;
	EnvironmentDamageForProjectile.EnvironmentalDamageAmount = 30;
	Template.AddTargetEffect(EnvironmentDamageForProjectile);

	PostAbilityMelee = new class'X2Effect_TriggerEvent';
	PostAbilityMelee.TriggerEventName = 'ActivateSkirmisherMelee';
	Template.AddTargetEffect(PostAbilityMelee);
	//Template.AdditionalAbilities.AddItem('SkirmisherPostAbilityMelee');

	RemoveEffects = new class'X2Effect_RemoveEffects';
	RemoveEffects.EffectNamesToRemove.AddItem(class'X2Effect_Suppression'.default.EffectName);
	Template.AddTargetEffect(RemoveEffects);

	Template.bForceProjectileTouchEvents = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Justice_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.Hostility = eHostility_Offensive;
	//Template.DamagePreviewFn = PostAbilityMeleeDamagePreview;
//BEGIN AUTOGENERATED CODE: Template Overrides 'Justice'
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActionFireClass = class'XComGame.X2Action_ViperGetOverHere';
	Template.ActivationSpeech = 'Justice';
//END AUTOGENERATED CODE: Template Overrides 'Justice'
	Template.CustomFireAnim = 'FF_Firegrap';	
	return Template;
}

static function Justice_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateVisualizationMgr VisMgr;
	local X2Action_ViperGetOverHere GetOverHereAction;
	local X2Action_ExitCover ExitCover;

	VisMgr = `XCOMVISUALIZATIONMGR;

	TypicalAbility_BuildVisualization(VisualizeGameState);

	ExitCover = X2Action_ExitCover(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_ExitCover'));
	ExitCover.bUsePreviousGameState = true;

	GetOverHereAction = X2Action_ViperGetOverHere(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_ViperGetOverHere'));
	GetOverHereAction.StartAnimName = 'FF_firegrap';
	GetOverHereAction.StopAnimName = 'HL_signalpointA';
}



	static function X2AbilityTemplate Createshivstandardshot(optional Name TemplateName = 'shivstandardshot')
{
	local X2AbilityTemplate	Template;
	local int				AbilityCostIndex;



	Template = class'X2Ability_WeaponCommon'.static.Add_StandardShot(TemplateName);

	
	Template.AlternateFriendlyNameFn = StandardShot_AlternateFriendlyName;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideIfOtherAvailable;
	Template.HideIfAvailable.AddItem('BlasterDuringCannon');
	Template.CinescriptCameraType = " ";
//BEGIN AUTOGENERATED CODE: Template Overrides 'Blaster'
//BEGIN AUTOGENERATED CODE: Template Overrides 'BlasterDuringCannon'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'BlasterDuringCannon'
//END AUTOGENERATED CODE: Template Overrides 'Blaster'

	return Template;
}

static function bool StandardShot_AlternateFriendlyName(out string AlternateDescription, XComGameState_Ability AbilityState, StateObjectReference TargetRef)
{
	local XComGameState_Unit TargetUnit;

	// when targeting the lost, call the ability "Headshot" instead of "Fire Weapon"
	if( TargetRef.ObjectID > 0 )
	{
		TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(TargetRef.ObjectID));
		if( TargetUnit != None && TargetUnit.GetTeam() == eTeam_TheLost )
		{
			AlternateDescription = class'XLocalizedData'.default.HeadshotDescriptionText;
			return true;
		}
	}

	return false;
}


static function X2AbilityTemplate FB_Telepshiv()
{
	local X2AbilityTemplate Template;
	local X2AbilityCost_ActionPoints ActionPointCost;
	local X2AbilityCooldown_LocalAndGlobal Cooldown;
	local X2AbilityTarget_Cursor CursorTarget;
	local X2AbilityMultiTarget_Radius RadiusMultiTarget;
	local X2Condition_UnitProperty UnitProperty;
	local X2Condition_UnitProperty UnitProperty2;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'teleportshiv');

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_alwaysShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_leap";
	Template.bDontDisplayInAbilitySummary = true;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = false;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	Cooldown = new class'X2AbilityCooldown_LocalAndGlobal';
	Cooldown.iNumTurns = 7;
	Cooldown.NumGlobalTurns = 7;
	Template.AbilityCooldown = Cooldown;

	UnitProperty2 = new class'X2Condition_UnitProperty';
	UnitProperty2.ExcludeDead = true;
	UnitProperty2.HasClearanceToMaxZ = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty2);

	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeDead = true;
	UnitProperty.ExcludeCosmetic = true;
	UnitProperty.FailOnNonUnits = true;
	UnitProperty.IsOutdoors = true;
	UnitProperty.HasClearanceToMaxZ = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitProperty);
	
	
	//Template.TargetingMethod = class'X2TargetingMethod_RocketLauncher';
	//Template.TargetingMethod = class'X2TargetingMethod_BlazingPinions';
	Template.TargetingMethod = class'firebornblasttar';

	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_PlayerInput');

	Template.AbilityToHitCalc = default.DeadEye;

	//CursorTarget = new class'X2AbilityTarget_Cursor';
	//CursorTarget.FixedAbilityRange = 80.0f;
	//Template.AbilityTargetStyle = CursorTarget;
	
	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.bRestrictToSquadsightRange = true;
	Template.AbilityTargetStyle = CursorTarget;

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 0.25; // small amount so it just grabs one tile
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;
	

	Template.ConcealmentRule = eConceal_Always;
	// Shooter Conditions
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	//// Damage Effect
	Template.AbilityMultiTargetConditions.AddItem(default.LivingTargetUnitOnlyProperty);

	Template.bShowActivation = false;
	Template.ModifyNewContextFn = Teleport_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = Teleport_BuildGameState;
	Template.BuildVisualizationFn = Teleport_BuildVisualization;
	Template.CinescriptCameraType = "Cyberus_Teleport";

	return Template;
}


static simulated function Teleport_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local PathPoint NextPoint, EmptyPoint;
	local PathingInputData InputData;
	local XComWorldData World;
	local vector NewLocation;
	local TTile NewTileLocation;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	`assert(AbilityContext.InputContext.TargetLocations.Length > 0);
	
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));

	// Build the MovementData for the path
	// First posiiton is the current location
	InputData.MovementTiles.AddItem(UnitState.TileLocation);

	NextPoint.Position = World.GetPositionFromTileCoordinates(UnitState.TileLocation);
	NextPoint.Traversal = eTraversal_Teleport;
	NextPoint.PathTileIndex = 0;
	InputData.MovementData.AddItem(NextPoint);

	// Second posiiton is the cursor position
	`assert(AbilityContext.InputContext.TargetLocations.Length == 1);

	NewLocation = AbilityContext.InputContext.TargetLocations[0];
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	NewLocation = World.GetPositionFromTileCoordinates(NewTileLocation);

	NextPoint = EmptyPoint;
	NextPoint.Position = NewLocation;
	NextPoint.Traversal = eTraversal_Landing;
	NextPoint.PathTileIndex = 1;
	InputData.MovementData.AddItem(NextPoint);
	InputData.MovementTiles.AddItem(NewTileLocation);

    //Now add the path to the input context
	InputData.MovingUnitRef = UnitState.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);
}

static simulated function XComGameState Teleport_BuildGameState(XComGameStateContext Context)
{
	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local vector NewLocation;
	local TTile NewTileLocation;
	local XComWorldData World;
	local X2EventManager EventManager;
	local int LastElementIndex;

	World = `XWORLD;
	EventManager = `XEVENTMGR;

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.CreateStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));

	LastElementIndex = AbilityContext.InputContext.MovementPaths[0].MovementData.Length - 1;

	// Set the unit's new location
	// The last position in MovementData will be the end location
	`assert(LastElementIndex > 0);
	NewLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[LastElementIndex].Position;
	NewTileLocation = World.GetTileCoordinatesFromPosition(NewLocation);
	UnitState.SetVisibilityLocation(NewTileLocation);

	NewGameState.AddStateObject(UnitState);

	AbilityContext.ResultContext.bPathCausesDestruction = MoveAbility_StepCausesDestruction(UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);
	MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);

	EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);

	//Return the game state we have created
	return NewGameState;
}

simulated function Teleport_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local X2AbilityTemplate AbilityTemplate;
	local VisualizationActionMetadata EmptyTrack, BuildTrack;
	local X2Action_PlaySoundAndFlyOver SoundAndFlyover;
	local int i, j;
	local XComGameState_WorldEffectTileData WorldDataUpdate;
	local X2Action_MoveTurn MoveTurnAction;
	local X2VisualizerInterface TargetVisualizerInterface;
	
	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	BuildTrack = EmptyTrack;
	BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(BuildTrack, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Good);

	// Turn to face the target action. The target location is the center of the ability's radius, stored in the 0 index of the TargetLocations
	MoveTurnAction = X2Action_MoveTurn(class'X2Action_MoveTurn'.static.AddToVisualizationTree(BuildTrack, AbilityContext));
	MoveTurnAction.m_vFacePoint = AbilityContext.InputContext.TargetLocations[0];

	// move action
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, BuildTrack);

	
	
	//****************************************************************************************

	foreach VisualizeGameState.IterateByClassType(class'XComGameState_WorldEffectTileData', WorldDataUpdate)
	{
		BuildTrack = EmptyTrack;
		BuildTrack.VisualizeActor = none;
		BuildTrack.StateObject_NewState = WorldDataUpdate;
		BuildTrack.StateObject_OldState = WorldDataUpdate;

		for (i = 0; i < AbilityTemplate.AbilityTargetEffects.Length; ++i)
		{
			AbilityTemplate.AbilityTargetEffects[i].AddX2ActionsForVisualization(VisualizeGameState, BuildTrack, AbilityContext.FindTargetEffectApplyResult(AbilityTemplate.AbilityTargetEffects[i]));
		}

		
	}

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for( i = 0; i < AbilityContext.InputContext.MultiTargets.Length; ++i )
	{
		InteractingUnitRef = AbilityContext.InputContext.MultiTargets[i];
		BuildTrack = EmptyTrack;
		BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(BuildTrack, AbilityContext);
		for( j = 0; j < AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, BuildTrack, AbilityContext.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(BuildTrack.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, BuildTrack);
		}

		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, BuildTrack);
		}
	}
}



static function X2AbilityTemplate Createteslaattack()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityTrigger_PlayerInput      InputTrigger;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local X2Condition_UnitProperty UnitProperty;
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local X2AbilityCooldown                 Cooldown;
	
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'teslaattack');
	//IconImage needs to be changed once there is an icon for this
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_lightningfield";
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Offensive;
	
	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeDead = true;
	Template.AbilityShooterConditions.AddItem(UnitProperty);
	Template.AbilityToHitCalc = default.DeadEye;

	// Targets enemies
	UnitProperty = new class'X2Condition_UnitProperty';
	UnitProperty.ExcludeFriendlyToSource = true;
	UnitProperty.ExcludeDead = true;
	Template.AbilityMultiTargetConditions.AddItem(UnitProperty);

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	//Triggered by player or AI
	InputTrigger = new class'X2AbilityTrigger_PlayerInput';
	Template.AbilityTriggers.AddItem(InputTrigger);

	//fire from self, with a radius amount
	Template.AbilityTargetStyle = default.SelfTarget;
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 3.5 * class'XComWorldData'.const.WORLD_StepSize * class'XComWorldData'.const.WORLD_UNITS_TO_METERS_MULTIPLIER;
	RadiusMultiTarget.bIgnoreBlockingCover = false;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	//Weapon damage to all affected
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue = default.SECTOPOD_LIGHTINGFIELD_BASEDAMAGEshiv;
	DamageEffect.bIgnoreArmor=True;
	Template.AddMultiTargetEffect(DamageEffect);


	//Cooldowns
	Cooldown = New class'X2AbilityCooldown';
	Cooldown.iNumTurns = 4;
	Template.AbilityCooldown = Cooldown;
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.bSkipExitCoverWhenFiring = true;
	Template.CustomFireAnim = 'HL_light';
	Template.CinescriptCameraType = " ";
//BEGIN AUTOGENERATED CODE: Template Overrides 'SectopodLightningField'
	Template.bFrameEvenWhenUnitIsHidden = true;
//END AUTOGENERATED CODE: Template Overrides 'SectopodLightningField'
	
	return Template;
}









static function X2AbilityTemplate Bladestormfb33zjj()
{
	local X2AbilityTemplate                 Template;

	Template = PurePassive('Bladestormfb33zjj', "img:///UILibrary_PerkIcons.UIPerk_lightningfield", false, 'eAbilitySource_Perk');
	Template.AdditionalAbilities.AddItem('BladestormAttackfb33zjj');

	return Template;
}

static function X2AbilityTemplate BladestormAttackfb33zjj(name TemplateName = 'BladestormAttackfb33zjj')
{
	local X2AbilityTemplate                 Template;
	local X2AbilityToHitCalc_StandardAim  ToHitCalc;
	local X2AbilityTrigger_EventListener	Trigger;
	local X2Effect_Persistent               BladestormTargetEffect;
	local X2Condition_UnitEffectsWithAbilitySource BladestormTargetCondition;
	local X2Condition_UnitProperty          SourceNotConcealedCondition;
	local X2Condition_Visibility			TargetVisibilityCondition;
	local X2Condition_UnitEffects			UnitEffectsCondition;
	local X2AbilityTarget_Single            SingleTarget;
	local X2AbilityCost_Ammo                AmmoCost;
	local X2Condition_UnitProperty UnitPropertyCondition;
	local X2Effect_ApplyWeaponDamage DamageEffect;
	local X2Condition_UnitEffects UnitEffectsCondition2;
	

	`CREATE_X2ABILITY_TEMPLATE(Template, TemplateName);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_lightningfield";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;

	//AmmoCost = new class'X2AbilityCost_Ammo';
	//AmmoCost.iAmmo = 1;
	//Template.AbilityCosts.AddItem(AmmoCost);

	
	//ToHitCalc = new class'X2AbilityToHitCalc_StandardAim';
	//ToHitCalc.bReactionFire = false;
	SingleTarget = new class'X2AbilityTarget_Single';
	Template.AbilityTargetStyle = SingleTarget;
	Template.AbilityToHitCalc = default.DeadEye;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.FailOnNonUnits = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false; // Disable this to allow civilians to be attacked.
	UnitPropertyCondition.ExcludeSquadmates = false;		   // Don't attack other AI units.
	UnitPropertyCondition.RequireWithinRange = true;
	UnitPropertyCondition.WithinRange = 400;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);
	
	//  trigger on movement
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.EventID = 'ObjectMoved';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.Filter = eFilter_None;
	Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalOverwatchListener;
	Template.AbilityTriggers.AddItem(Trigger);
	//  trigger on an attack
	//Trigger = new class'X2AbilityTrigger_EventListener';
	//Trigger.ListenerData.EventID = 'AbilityActivated';
	//Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	//Trigger.ListenerData.Filter = eFilter_None;
	//Trigger.ListenerData.EventFn = class'XComGameState_Ability'.static.TypicalAttackListener;
	//Template.AbilityTriggers.AddItem(Trigger);

	//  it may be the case that enemy movement caused a concealment break, which made Bladestorm applicable - attempt to trigger afterwards
	Trigger = new class'X2AbilityTrigger_EventListener';
	Trigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	Trigger.ListenerData.EventID = 'UnitConcealmentBroken';
	Trigger.ListenerData.Filter = eFilter_Unit;
	Trigger.ListenerData.EventFn = BladestormConcealmentListenerfb33zjj;
	Trigger.ListenerData.Priority = 55;
	Template.AbilityTriggers.AddItem(Trigger);

	
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	TargetVisibilityCondition = new class'X2Condition_Visibility';
	TargetVisibilityCondition.bRequireGameplayVisible = true;
	TargetVisibilityCondition.bRequireBasicVisibility = true;
	//TargetVisibilityCondition.bDisablePeeksOnMovement = true; //Don't use peek tiles for over watch shots	
	Template.AbilityTargetConditions.AddItem(TargetVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(class'X2Ability_DefaultAbilitySet'.static.OverwatchTargetEffectsCondition());



	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);	
	Template.AddShooterEffectExclusions();

	
	

	//Don't trigger when the source is concealed
	SourceNotConcealedCondition = new class'X2Condition_UnitProperty';
	SourceNotConcealedCondition.ExcludeConcealed = false;
	Template.AbilityShooterConditions.AddItem(SourceNotConcealedCondition);

	// Don't trigger if the unit has vanished
	UnitEffectsCondition = new class'X2Condition_UnitEffects';
	UnitEffectsCondition.AddExcludeEffect('Vanish', 'AA_UnitIsConcealed');
	UnitEffectsCondition.AddExcludeEffect('VanishingWind', 'AA_UnitIsConcealed');
	Template.AbilityShooterConditions.AddItem(UnitEffectsCondition);

	Template.bAllowBonusWeaponEffects = true;
	

	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.EffectDamageValue = default.SECTOPOD_LIGHTINGFIELD_BASEDAMAGEshiv2;
	DamageEffect.bIgnoreArmor=True;
	Template.AddTargetEffect(DamageEffect);


	//Prevent repeatedly hammering on a unit with Bladestorm triggers.
	//(This effect does nothing, but enables many-to-many marking of which Bladestorm attacks have already occurred each turn.)
	BladestormTargetEffect = new class'X2Effect_Persistent';
	BladestormTargetEffect.BuildPersistentEffect(1, false, true, true, eGameRule_PlayerTurnEnd);
	BladestormTargetEffect.EffectName = 'BladestormTarget';
	BladestormTargetEffect.bApplyOnMiss = true; //Only one chance, even if you miss (prevents crazy flailing counter-attack chains with a Muton, for example)
	Template.AddTargetEffect(BladestormTargetEffect);
	
	BladestormTargetCondition = new class'X2Condition_UnitEffectsWithAbilitySource';
	BladestormTargetCondition.AddExcludeEffect('BladestormTarget', 'AA_DuplicateEffectIgnored');


	



	Template.AbilityTargetConditions.AddItem(BladestormTargetCondition);


	UnitEffectsCondition2 = new class'X2Condition_UnitEffects';
	UnitEffectsCondition2.AddExcludeEffect('BladestormTarget', 'AA_DuplicateEffectIgnored');
	Template.AbilityTargetConditions.AddItem(UnitEffectsCondition2);




	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = BladeStorm_BuildVisualizationfb33zjj;
	Template.bShowActivation = true;

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;

	//BEGIN AUTOGENERATED CODE: Template Overrides 'BladestormAttack'
	Template.bFrameEvenWhenUnitIsHidden = true;
	//END AUTOGENERATED CODE: Template Overrides 'BladestormAttack'
	Template.CinescriptCameraType = " ";
	Template.CustomFireAnim = 'HL_light';

	return Template;
}

//Must be static, because it will be called with a different object (an XComGameState_Ability)
//Used to trigger Bladestorm when the source's concealment is broken by a unit in melee range (the regular movement triggers get called too soon)
static function EventListenerReturn BladestormConcealmentListenerfb33zjj(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Unit ConcealmentBrokenUnit;
	local StateObjectReference BladestormRef;
	local XComGameState_Ability BladestormState;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;

	ConcealmentBrokenUnit = XComGameState_Unit(EventSource);	
	if (ConcealmentBrokenUnit == None)
		return ELR_NoInterrupt;

	//Do not trigger if the Bladestorm Ranger himself moved to cause the concealment break - only when an enemy moved and caused it.
	AbilityContext = XComGameStateContext_Ability(GameState.GetContext().GetFirstStateInEventChain().GetContext());
	if (AbilityContext != None && AbilityContext.InputContext.SourceObject != ConcealmentBrokenUnit.ConcealmentBrokenByUnitRef)
		return ELR_NoInterrupt;

	BladestormRef = ConcealmentBrokenUnit.FindAbility('BladestormAttackfb33zjj');
	if (BladestormRef.ObjectID == 0)
		return ELR_NoInterrupt;

	BladestormState = XComGameState_Ability(History.GetGameStateForObjectID(BladestormRef.ObjectID));
	if (BladestormState == None)
		return ELR_NoInterrupt;
	
	BladestormState.AbilityTriggerAgainstSingleTarget(ConcealmentBrokenUnit.ConcealmentBrokenByUnitRef, false);
	return ELR_NoInterrupt;
}

simulated function BladeStorm_BuildVisualizationfb33zjj(XComGameState VisualizeGameState)
{
	// Build the first shot of Bladestorm's visualization
	TypicalAbility_BuildVisualization(VisualizeGameState);
}





static function X2AbilityTemplate teslastarter()
{
	local X2AbilityTemplate Template;
	local X2AbilityTrigger_UnitPostBeginPlay Trigger;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local fbteslahelper autofirt;
	local X2AbilityCost_ActionPoints ActionPointCost;
	

	`CREATE_X2ABILITY_TEMPLATE(Template, 'teslastarter');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_electro_pulse"; // TODO: This needs to be changed

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);



	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.bCrossClassEligible = false;

	// Build the immunities
	autofirt = new class'fbteslahelper';
	autofirt.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(autofirt);


	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, true, true);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_mobility, -15);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionRadius, -15);
	Template.AddShooterEffect(PersistentStatChangeEffect);



		
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}






static function X2AbilityTemplate teslalaunch()
{
	local X2AbilityTemplate					Template;
	local X2AbilityCost_ActionPoints		ActionPointCost;
	local X2AbilityCost_Ammo				AmmoCost;
	local X2AbilityTarget_Cursor			CursorTarget;
	local X2AbilityMultiTarget_Radius		RadiusMultiTarget;
	local X2rifraf	Spawntesla;
	local X2AbilityCharges                      Charges;
	local X2AbilityCost_Charges                 ChargeCost;
	local X2Effect_LoadPerksfb8				LoadPerks;
	 
	`CREATE_X2ABILITY_TEMPLATE(Template, 'teslalaunch');

	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_electro_pulse"; // TODO: This needs to be changed
	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;


	Charges = new class 'X2AbilityCharges';
	Charges.InitialCharges = 3;
	Template.AbilityCharges = Charges;

	ChargeCost = new class'X2AbilityCost_Charges';
	ChargeCost.NumCharges = 1;
	Template.AbilityCosts.AddItem(ChargeCost);

	
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_GRENADE_PRIORITY;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);




	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.FixedAbilityRange = 20.0f;
	Template.AbilityTargetStyle = CursorTarget;
	

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = 1.0; // small amount so it just grabs one tile
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;


	Template.TargetingMethod = class'X2TargetingMethod_RocketLauncher';


	//LoadPerks = new class'X2Effect_LoadPerksfb8';
	//LoadPerks.AbilityPerkToLoad = 'teslalaunch';
	//Template.AddShooterEffect(LoadPerks);

	Template.bCrossClassEligible = false;

	// Effect Parameters
	Template.CustomFireAnim = 'ff_tesla';

	Spawntesla = new class'X2rifraf';
	Spawntesla.BuildPersistentEffect(1, false, true, false, eGameRule_PlayerTurnBegin);
	Template.AddShooterEffect(Spawntesla);
	Template.AddShooterEffect(new class'X2Effect_BreakUnitConcealment');
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = Deploytesla_BuildVisualization;

	Template.bShowActivation = true;

	//BEGIN AUTOGENERATED CODE: Template Overrides 'BladestormAttack'
	Template.bFrameEvenWhenUnitIsHidden = true;
	//END AUTOGENERATED CODE: Template Overrides 'BladestormAttack'
	Template.CinescriptCameraType = " ";
		
	return Template;
}

simulated function Deploytesla_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata teslaTrack, SourceTrack;
	local XComGameState_Unit SpawnedUnit, SourceUnit;
	local StateObjectReference InteractingUnitRef;
	local UnitValue SpawnedUnitValue;
	local x2rifraf Spawntesla;
	local X2Action_MimicBeaconThrow FireAction;
	local X2Action_PlayAnimation AnimationAction;
	
	History = `XCOMHISTORY;
	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;




	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceTrack, Context);
	FireAction = X2Action_MimicBeaconThrow(class'X2Action_MimicBeaconThrow'.static.AddToVisualizationTree(SourceTrack, Context));
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceTrack, Context);


	SourceUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
	`assert(SourceUnit != none);
	SourceUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

	teslaTrack = EmptyTrack;
	teslaTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
	teslaTrack.StateObject_NewState = teslaTrack.StateObject_OldState;
	SpawnedUnit = XComGameState_Unit(teslaTrack.StateObject_NewState);
	`assert(SpawnedUnit != none);
	teslaTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);


	
	FireAction.MimicBeaconUnitReference = SpawnedUnit.GetReference();
	
	class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(teslaTrack, Context);
	


	Spawntesla = X2rifraf(Context.ResultContext.ShooterEffectResults.Effects[0]);
	
	if( Spawntesla == none )
	{
		`RedScreenOnce("BuildVisualization: Missing X2rifraf");
		return;
	}

	
	class'X2Action_SyncVisualizer'.static.AddToVisualizationTree(teslaTrack, Context);

	AnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(teslaTrack, Context));
	AnimationAction.Params.AnimName = 'LL_MimicStart';
	AnimationAction.Params.BlendTime = 0.0f;

	Spawntesla.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, teslaTrack, SourceUnit);
}





static function X2AbilityTemplate shivBulwark()
{
	local X2AbilityTemplate						Template;
	local X2Effect_GenerateCover                CoverEffect;
	local X2Effect_BonusArmor		            ArmorEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'shivBulwark');
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_DLC3Images.UIPerk_spark_bulwark";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	CoverEffect = new class'X2Effect_GenerateCover';
	CoverEffect.bRemoveWhenMoved = false;
	CoverEffect.bRemoveOnOtherActivation = false;
	CoverEffect.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnBegin);
	CoverEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, true, , Template.AbilitySourceName);
	CoverEffect.CoverType = CoverForce_High;
	Template.AddTargetEffect(CoverEffect);

	ArmorEffect = new class'X2Effect_BonusArmor';
	ArmorEffect.BuildPersistentEffect(1, true, false, false);
	ArmorEffect.ArmorMitigationAmount = 1;
	Template.AddTargetEffect(ArmorEffect);

	Template.bSkipFireAction = true;
	Template.bShowActivation = false;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, ArmorEffect.ArmorMitigationAmount);

	return Template;
}






DefaultProperties
{
	shivshieldEffectName="shivshielderEffect"	
	shivdamageEffectName="shivdamagerEffect"
	shivteslaEffectName="shivteslaEffect"

	HighLowValueNamemissles = "HighLowValuemissles"
	trishot_BASEDAMAGE=(Damage=3, Spread = 0, PlusOne = 0, Crit = 0, Pierce = 0, Shred=0, Tag = "", DamageType="Projectile_BeamXCom")
	immolate_BASEDAMAGE=(Damage=2, Spread = 0, PlusOne = 0, Crit = 0, Pierce = 0, Shred=0, Tag = "", DamageType="fire")

	Sectopod_LightingField_BaseDamageshiv= (Damage=7, Spread=1, PlusOne=0, Crit=0, Pierce=0, Shred=0, Tag = "", DamageType="Electrical")
	Sectopod_LightingField_BaseDamageshiv2= (Damage=7, Spread=1, PlusOne=0, Crit=2, Pierce=0, Shred=0, Tag = "", DamageType="Electrical")
}