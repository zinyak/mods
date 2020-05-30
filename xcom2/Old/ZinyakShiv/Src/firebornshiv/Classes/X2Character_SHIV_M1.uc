class X2Character_SHIV_M1 extends X2Character config(SHIV_M1);



static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(CreateTemplate_tesla());
	Templates.AddItem(CreateTemplate_SHIV_M2());
	Templates.AddItem(CreateTemplate_SHIV_M1());


	return Templates; 
}


static function X2CharacterTemplate CreateTemplate_tesla()
{ 
	local X2CharacterTemplate CharTemplate;


	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'SHIV_tesla');

	CharTemplate.CharacterGroupName = 'SHIV_M1';
	CharTemplate.DefaultLoadout=' ';
	CharTemplate.BehaviorClass=class'XGAIBehavior';


	CharTemplate.strPawnArchetypes.AddItem("XEU_SHIV.Archetypes.ARC_GameUnit_tesla");
	


	//CharTemplate.strMatineePackage = "CIN_Muton"; 
	//CharTemplate.strMatineePackages.AddItem("CIN_Muton"); //update with new cinematic?

	CharTemplate.UnitSize = 1;

	CharTemplate.bCanUse_eTraversal_Normal = false;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = false;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = false;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = false;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = false;
	CharTemplate.bCanUse_eTraversal_JumpUp = false;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bAppearInBase = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;
	CharTemplate.bAllowRushCam = false;
	CharTemplate.bDisplayUIUnitFlag=false;

	CharTemplate.bCanTakeCover = false; //!
	CharTemplate.bDiesWhenCaptured = true;
	
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false; 
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = false; //will be true when implementing into game
	CharTemplate.bIsTurret = true;
	CharTemplate.bIsMeleeOnly = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.AddTemplateAvailablility(CharTemplate.BITFIELD_GAMEAREA_Multiplayer); // Allow in MP!
	CharTemplate.MPPointValue = CharTemplate.XpKillscore * 10;

	CharTemplate.Abilities.AddItem('SHIV_M1Immunities');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');
	
	CharTemplate.Abilities.AddItem('Bladestormfb33zjj');
	CharTemplate.Abilities.AddItem('teslastarter');
	
	

	CharTemplate.strMatineePackages.AddItem("CIN_Spark");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Spark";
	CharTemplate.strLoadingMatineeSlotPrefix = "SparkSoldier";

	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien; //this is wrong for SHIV


	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Spark';
	CharTemplate.UICustomizationMenuClass = class'UICustomize_SparkMenu';
	CharTemplate.UICustomizationInfoClass = class'UICustomize_SparkInfo';
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_SPARK';

	return CharTemplate;
}





	

static function X2CharacterTemplate CreateTemplate_SHIV_M2()
{ 
	local X2CharacterTemplate CharTemplate;


	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'SHIV_M2');

	CharTemplate.CharacterGroupName = 'SHIV_M1';
	CharTemplate.DefaultLoadout='SHIV_M2_Loadout';
	CharTemplate.BehaviorClass=class'XGAIBehavior';


	CharTemplate.strPawnArchetypes.AddItem("XEU_SHIV.Archetypes.ARC_GameUnit_SHIV3");
	


	//CharTemplate.strMatineePackage = "CIN_Muton"; 
	//CharTemplate.strMatineePackages.AddItem("CIN_Muton"); //update with new cinematic?

	CharTemplate.UnitSize = 1;

	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = false;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = true;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bAppearInBase = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;
	CharTemplate.bAllowRushCam = false;

	CharTemplate.bCanTakeCover = false; //!
	CharTemplate.bDiesWhenCaptured = true;
	
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false; 
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = true; //will be true when implementing into game
	//CharTemplate.bIsTurret = true;
	CharTemplate.bIsMeleeOnly = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.AddTemplateAvailablility(CharTemplate.BITFIELD_GAMEAREA_Multiplayer); // Allow in MP!
	CharTemplate.MPPointValue = CharTemplate.XpKillscore * 10;

	CharTemplate.Abilities.AddItem('SHIV_M1Immunities');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');


	CharTemplate.strMatineePackages.AddItem("CIN_Spark");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Spark";
	CharTemplate.strLoadingMatineeSlotPrefix = "SparkSoldier";

	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien; //this is wrong for SHIV


	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Spark';
	CharTemplate.UICustomizationMenuClass = class'UICustomize_SparkMenu';
	CharTemplate.UICustomizationInfoClass = class'UICustomize_SparkInfo';
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_SPARK';

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_SHIV_M1()
{ 
	local X2CharacterTemplate CharTemplate;


	`CREATE_X2CHARACTER_TEMPLATE(CharTemplate, 'SHIV_M1');

	CharTemplate.CharacterGroupName = 'SHIV_M1';
	CharTemplate.DefaultLoadout='SHIV_M1_Loadout';
	CharTemplate.BehaviorClass=class'XGAIBehavior';


	CharTemplate.strPawnArchetypes.AddItem("XEU_SHIV.Archetypes.ARC_GameUnit_SHIV2");
	


	//CharTemplate.strMatineePackage = "CIN_Muton"; 
	//CharTemplate.strMatineePackages.AddItem("CIN_Muton"); //update with new cinematic?

	CharTemplate.UnitSize = 1;

	CharTemplate.bCanUse_eTraversal_Normal = true;
	CharTemplate.bCanUse_eTraversal_ClimbOver = false;
	CharTemplate.bCanUse_eTraversal_ClimbOnto = true;
	CharTemplate.bCanUse_eTraversal_ClimbLadder = false;
	CharTemplate.bCanUse_eTraversal_DropDown = true;
	CharTemplate.bCanUse_eTraversal_Grapple = false;
	CharTemplate.bCanUse_eTraversal_Landing = false;
	CharTemplate.bCanUse_eTraversal_BreakWindow = false;
	CharTemplate.bCanUse_eTraversal_KickDoor = true;
	CharTemplate.bCanUse_eTraversal_JumpUp = true;
	CharTemplate.bCanUse_eTraversal_WallClimb = false;
	CharTemplate.bCanUse_eTraversal_BreakWall = false;
	CharTemplate.bAppearanceDefinesPawn = false;    
	CharTemplate.bAppearInBase = false;
	CharTemplate.bUsesWillSystem = false;
	CharTemplate.bIsTooBigForArmory = true;
	CharTemplate.bAllowRushCam = false;

	CharTemplate.bCanTakeCover = false; //!
	CharTemplate.bDiesWhenCaptured = true;
	
	CharTemplate.bIsAlien = false;
	CharTemplate.bIsAdvent = false; 
	CharTemplate.bIsCivilian = false;
	CharTemplate.bIsPsionic = false;
	CharTemplate.bIsRobotic = true;
	CharTemplate.bIsSoldier = true; //will be true when implementing into game
	//CharTemplate.bIsTurret = true;
	CharTemplate.bIsMeleeOnly = false;

	CharTemplate.bCanBeTerrorist = false;
	CharTemplate.bCanBeCriticallyWounded = false;
	CharTemplate.bIsAfraidOfFire = true;

	CharTemplate.bAllowSpawnFromATT = false;

	CharTemplate.AddTemplateAvailablility(CharTemplate.BITFIELD_GAMEAREA_Multiplayer); // Allow in MP!
	CharTemplate.MPPointValue = CharTemplate.XpKillscore * 10;

	CharTemplate.Abilities.AddItem('SHIV_M1Immunities');
	CharTemplate.Abilities.AddItem('Evac');
	CharTemplate.Abilities.AddItem('PlaceEvacZone');
	CharTemplate.Abilities.AddItem('LiftOffAvenger');
	CharTemplate.Abilities.AddItem('Interact_ActivateAscensionGate');
	CharTemplate.Abilities.AddItem('Interact_UseElevator');

	
	

	CharTemplate.strMatineePackages.AddItem("CIN_Spark");
	CharTemplate.strMatineePackages.AddItem("CIN_AdventMEC");
	CharTemplate.strTargetingMatineePrefix = "CIN_AdventMEC_FF_StartPos";
	CharTemplate.strIntroMatineeSlotPrefix = "Spark";
	CharTemplate.strLoadingMatineeSlotPrefix = "SparkSoldier";

	CharTemplate.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.KnockbackDamageType);

	CharTemplate.strTargetIconImage = class'UIUtilities_Image'.const.TargetIcon_Alien; //this is wrong for SHIV


	CharTemplate.CustomizationManagerClass = class'XComCharacterCustomization_Spark';
	CharTemplate.UICustomizationMenuClass = class'UICustomize_SparkMenu';
	CharTemplate.UICustomizationInfoClass = class'UICustomize_SparkInfo';
	CharTemplate.CharacterGeneratorClass = class'XGCharacterGenerator_SPARK';

	return CharTemplate;
}









static function int HighestSoldierRank()
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;
	local int idx, maxRank, thisRank;

	maxRank = 0;
	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	for(idx = 0; idx < XComHQ.Crew.Length; idx++)
	{
		UnitState = XComGameState_Unit(History.GetGameStateForObjectID(XComHQ.Crew[idx].ObjectID));
		thisRank = UnitState.GetRank();
		if (thisRank > maxRank) maxRank = thisRank;
	}
	return maxRank;
}

// LevelUpBarracks is wrong, taken from here instead:
// X2StrategyElement_DefaultRewards::GeneratePersonnelReward
static function RankUpAlien(int maxRank, XComGameState_Unit UnitState, XComGameState NewGameState)
{
	local int i, j;
	local X2SoldierClassTemplate SoldierTemplate;
	local name AbilityName;

	`log ("rankup " @ maxRank @ " for " @ UnitState.GetLastName());
	SoldierTemplate = UnitState.GetSoldierClassTemplate();
	UnitState.SetXPForRank(maxRank);
	UnitState.StartingRank = maxRank;
	for (i=0; i<maxRank; i++)
	{
		if (i == 0)
		{
			// Rank up to squaddie
			`log ("rankup start");
			UnitState.RankUpSoldier(NewGameState, SoldierTemplate.DataName);
			UnitState.ApplySquaddieLoadout(NewGameState);
			for (j=0; j<SoldierTemplate.GetStatProgression(0).Length; ++j)
			{
				UnitState.BuySoldierProgressionAbility(NewGameState, 0, j);
			}
		}
		else
		{
			`log ("advanced rankup");
			UnitState.RankUpSoldier(NewGameState, UnitState.GetSoldierClassTemplate().DataName);
		}
	}
	`log ("rankup finished");
}
