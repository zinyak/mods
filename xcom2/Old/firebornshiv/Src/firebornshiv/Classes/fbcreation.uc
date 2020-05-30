//---------------------------------------------------------------------------------------
//  FILE:    X2StrategyElement_DefaultTechs.uc
//  AUTHOR:  Fireborn the Coyote
//           
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 DinoDicks, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class fbcreation extends X2StrategyElement config(GameData);



static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;



	Techs.AddItem(makeshivTemplate());
	Techs.AddItem(makeshiv2Template());


	return Techs;
}


/// fuck you. right in your butt.


static function X2DataTemplate makeshivTemplate()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'intshiv');
	Template.bRepeatable = true;
	Template.PointsToComplete = 720;
	Template.bProvingGround = true;
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_shiv";
	
	

	Template.ResearchCompletedFn = ResearchCompletedfbbg;
	

	
	Resources.ItemTemplateName='supplies';
	Resources.Quantity=75;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	return Template;
}


static function X2DataTemplate makeshiv2Template()
{
	local X2TechTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'intshiv2');
	Template.bRepeatable = true;
	Template.PointsToComplete = 820;
	Template.bProvingGround = true;
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_shiv";
	
	

	Template.ResearchCompletedFn = ResearchCompletedfbbg2;
	

	
	Resources.ItemTemplateName='supplies';
	Resources.Quantity=85;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName='AlienAlloy';
	Resources.Quantity=20;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	return Template;
}




function ResearchCompletedfbbg(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;

	History = `XCOMHISTORY;
	`log("research");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	UnitState = CreateUnitvipt(NewGameState);
	NewGameState.AddStateObject(UnitState);
	
	XComHQ.AddToCrew(NewGameState, UnitState);
	UnitState.SetHQLocation(eSoldierLoc_Barracks);
	XcomHQ.HandlePowerOrStaffingChange(NewGameState);
	`log("attackattack-return");
}

static function XComGameState_Unit CreateUnitvipt(XComGameState NewGameState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;
	local X2CharacterTemplateManager CharTemplateManager;
	local X2CharacterTemplate CharTemplate;
	local X2ItemTemplateManager ItemTemplateManager;
	local X2ItemTemplate ItemTemplate;
	local XComGameState_Item ItemState;
	local XGCharacterGenerator CharGen;
	local string strFirst, strLast;
	local int maxRank;
	

	`log("makinghim");
	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	CharTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	CharTemplate = CharTemplateManager.FindCharacterTemplate('SHIV_M1');
	UnitState = CharTemplate.CreateInstanceFromTemplate(NewGameState);


	if (!XComHq.IsTechResearched('PlatedshivArmor_Schematic')) 
	{
	if (!XComHq.IsTechResearched('PoweredshivArmor_Schematic')) 
	{
	ItemTemplate = ItemTemplateManager.FindItemTemplate('shivArmor');
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	UnitState.AddItemToInventory(ItemState, eInvSlot_Armor, NewGameState);
	NewGameState.AddStateObject(ItemState);
	if (XComHQ.GetNumItemInInventory('shivArmor') == 0)
		XComHQ.AddItemToHQInventory(ItemState); 
	}
	}
	

	if (XComHq.IsTechResearched('PlatedshivArmor_Schematic')) 
	{
	if (!XComHq.IsTechResearched('PoweredshivArmor_Schematic')) 
	{
	ItemTemplate = ItemTemplateManager.FindItemTemplate('PlatedshivArmor');
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	UnitState.AddItemToInventory(ItemState, eInvSlot_Armor, NewGameState);
	NewGameState.AddStateObject(ItemState);
	if (XComHQ.GetNumItemInInventory('PlatedshivArmor') == 0)
		XComHQ.AddItemToHQInventory(ItemState); 
	}
	}

	if (XComHq.IsTechResearched('PoweredshivArmor_Schematic')) 
	{
	ItemTemplate = ItemTemplateManager.FindItemTemplate('PoweredshivArmor');
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	UnitState.AddItemToInventory(ItemState, eInvSlot_Armor, NewGameState);
	NewGameState.AddStateObject(ItemState);
	if (XComHQ.GetNumItemInInventory('PoweredshivArmor') == 0)
		XComHQ.AddItemToHQInventory(ItemState); 
	}




	if (!XComHq.IsTechResearched('shivgun_MG_Schematic'))
	{
	if (!XComHq.IsTechResearched('shivgun_BM_Schematic'))
	{
		ItemTemplate = ItemTemplateManager.FindItemTemplate('Cannon_SHIV_M1');
		ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		NewGameState.AddStateObject(ItemState);
		if (XComHQ.GetNumItemInInventory('Cannon_SHIV_M1') == 0)
			XComHQ.AddItemToHQInventory(ItemState); // show in armory locker list
	}
	}

	if (XComHq.IsTechResearched('shivgun_MG_Schematic')) 
	{
	if (!XComHq.IsTechResearched('shivgun_BM_Schematic')) 
	{
		ItemTemplate = ItemTemplateManager.FindItemTemplate('Cannon_SHIV_M2');
		ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		NewGameState.AddStateObject(ItemState);
		if (XComHQ.GetNumItemInInventory('Cannon_SHIV_M2') == 0)
			XComHQ.AddItemToHQInventory(ItemState); // show in armory locker list
	}
	}

	if (XComHq.IsTechResearched('shivgun_BM_Schematic')) 
	{
		ItemTemplate = ItemTemplateManager.FindItemTemplate('Cannon_SHIV_M3');
		ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		NewGameState.AddStateObject(ItemState);
		if (XComHQ.GetNumItemInInventory('Cannon_SHIV_M3') == 0)
			XComHQ.AddItemToHQInventory(ItemState); // show in armory locker list
	}






		
	//CharGen = `XCOMGAME.spawn( class 'XGCharacterGenerator' );
	CharGen = `XCOMGAME.spawn( class 'fbnamer2' );
	CharGen.GenerateName(0, 'Country_fbshiv', strFirst, strLast);
	UnitState.SetCharacterName(strFirst, strLast, "");
	`log("debys-name " @ strFirst @ " " @ strLast);
	UnitState.SetCountry('Country_fbshiv');
	
	NewGameState.AddStateObject(UnitState);
	UnitState.SetSkillLevel(7);
	UnitState.SetSoldierClassTemplate('fbshivclass');
	
	class'x2character_shiv_m1'.static.RankUpAlien(1, UnitState, NewGameState);
	
	UnitState.kAppearance.iGender = 1;
	UnitState.StoreAppearance();
	return UnitState;
}


function ResearchCompletedfbbg2(XComGameState NewGameState, XComGameState_Tech TechState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;

	History = `XCOMHISTORY;
	`log("research");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	UnitState = CreateUnitvipt2(NewGameState);
	NewGameState.AddStateObject(UnitState);
	
	XComHQ.AddToCrew(NewGameState, UnitState);
	UnitState.SetHQLocation(eSoldierLoc_Barracks);
	XcomHQ.HandlePowerOrStaffingChange(NewGameState);
	`log("attackattack-return");
}

static function XComGameState_Unit CreateUnitvipt2(XComGameState NewGameState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Unit UnitState;
	local X2CharacterTemplateManager CharTemplateManager;
	local X2CharacterTemplate CharTemplate;
	local X2ItemTemplateManager ItemTemplateManager;
	local X2ItemTemplate ItemTemplate;
	local XComGameState_Item ItemState;
	local XGCharacterGenerator CharGen;
	local string strFirst, strLast;
	local int maxRank;
	

	`log("makinghim");
	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	CharTemplateManager = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	CharTemplate = CharTemplateManager.FindCharacterTemplate('SHIV_M2');
	UnitState = CharTemplate.CreateInstanceFromTemplate(NewGameState);


	if (!XComHq.IsTechResearched('PlatedshivArmor_Schematic')) 
	{
	if (!XComHq.IsTechResearched('PoweredshivArmor_Schematic')) 
	{
	ItemTemplate = ItemTemplateManager.FindItemTemplate('shivArmor');
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	UnitState.AddItemToInventory(ItemState, eInvSlot_Armor, NewGameState);
	NewGameState.AddStateObject(ItemState);
	if (XComHQ.GetNumItemInInventory('shivArmor') == 0)
		XComHQ.AddItemToHQInventory(ItemState); 
	}
	}
	

	if (XComHq.IsTechResearched('PlatedshivArmor_Schematic')) 
	{
	if (!XComHq.IsTechResearched('PoweredshivArmor_Schematic')) 
	{
	ItemTemplate = ItemTemplateManager.FindItemTemplate('PlatedshivArmor');
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	UnitState.AddItemToInventory(ItemState, eInvSlot_Armor, NewGameState);
	NewGameState.AddStateObject(ItemState);
	if (XComHQ.GetNumItemInInventory('PlatedshivArmor') == 0)
		XComHQ.AddItemToHQInventory(ItemState); 
	}
	}

	if (XComHq.IsTechResearched('PoweredshivArmor_Schematic')) 
	{
	ItemTemplate = ItemTemplateManager.FindItemTemplate('PoweredshivArmor');
	ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
	UnitState.AddItemToInventory(ItemState, eInvSlot_Armor, NewGameState);
	NewGameState.AddStateObject(ItemState);
	if (XComHQ.GetNumItemInInventory('PoweredshivArmor') == 0)
		XComHQ.AddItemToHQInventory(ItemState); 
	}

	if (!XComHq.IsTechResearched('shivgun_MG_Schematic'))
	{
	if (!XComHq.IsTechResearched('shivgun_BM_Schematic'))
	{
		ItemTemplate = ItemTemplateManager.FindItemTemplate('Cannon_SHIV_M1');
		ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		NewGameState.AddStateObject(ItemState);
		if (XComHQ.GetNumItemInInventory('Cannon_SHIV_M1') == 0)
			XComHQ.AddItemToHQInventory(ItemState); // show in armory locker list
	}
	}


	if (XComHq.IsTechResearched('shivgun_MG_Schematic')) 
	{
	if (!XComHq.IsTechResearched('shivgun_BM_Schematic')) 
	
	{
		ItemTemplate = ItemTemplateManager.FindItemTemplate('Cannon_SHIV_M2');
		ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		UnitState.AddItemToInventory(ItemState, eInvSlot_PrimaryWeapon, NewGameState);
		NewGameState.AddStateObject(ItemState);
		if (XComHQ.GetNumItemInInventory('Cannon_SHIV_M2') == 0)
			XComHQ.AddItemToHQInventory(ItemState); // show in armory locker list
	}
	}

		if (XComHq.IsTechResearched('shivgun_BM_Schematic')) 
	{
		ItemTemplate = ItemTemplateManager.FindItemTemplate('Cannon_SHIV_M3');
		ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		UnitState.AddItemToInventory(ItemState, eInvSlot_PrimaryWeapon, NewGameState);
		NewGameState.AddStateObject(ItemState);
		if (XComHQ.GetNumItemInInventory('Cannon_SHIV_M3') == 0)
			XComHQ.AddItemToHQInventory(ItemState); // show in armory locker list

	}


	





		
	//CharGen = `XCOMGAME.spawn( class 'XGCharacterGenerator' );
	CharGen = `XCOMGAME.spawn( class 'fbnamer3' );
	CharGen.GenerateName(0, 'Country_fbshiv', strFirst, strLast);
	UnitState.SetCharacterName(strFirst, strLast, "");
	`log("debys-name " @ strFirst @ " " @ strLast);
	UnitState.SetCountry('Country_fbshiv');
	
	NewGameState.AddStateObject(UnitState);
	UnitState.SetSkillLevel(7);
	UnitState.SetSoldierClassTemplate('fbshivclass2');
	
	class'x2character_shiv_m1'.static.RankUpAlien(1, UnitState, NewGameState);
	
	UnitState.kAppearance.iGender = 1;
	UnitState.StoreAppearance();
	return UnitState;
}

