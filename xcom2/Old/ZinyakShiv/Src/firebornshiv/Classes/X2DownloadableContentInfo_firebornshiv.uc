//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_firebornshiv.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Dinodicks, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_firebornshiv extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
//static event OnLoadedSavedGame()
//{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
//static event InstallNewCampaign(XComGameState StartState)
//{}




/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{
	UpdateResearch();
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}


static event OnLoadedSavedGameToStrategy()
{
	UpdateResearch();
}


static function bool IsResearchInHistory(name ResearchName)
{
	// Check if we've already injected the tech templates
	local XComGameState_Tech	TechState;
	
	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
	{
		if ( TechState.GetMyTemplateName() == ResearchName )
		{
			return true;
		}
	}
	return false;
}


static function UpdateResearch()
{
	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local X2TechTemplate TechTemplate;
	local XComGameState_Tech TechState;
	local X2StrategyElementTemplateManager	StratMgr;

	//In this method, we demonstrate functionality that will add ExampleWeapon to the player's inventory when loading a saved
	//game. This allows players to enjoy the content of the mod in campaigns that were started without the mod installed.
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	History = `XCOMHISTORY;	

	//Create a pending game state change
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Research Templates");


	//Find tech template		
	if ( !IsResearchInHistory('intshiv') )
	{
	TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('intshiv'));
	NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}

	if ( !IsResearchInHistory('intshiv2') )
	{
	TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('intshiv2'));
	NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}

	if ( !IsResearchInHistory('shivgun_MG_Schematic') )
	{
	TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('shivgun_MG_Schematic'));
	NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}

	if ( !IsResearchInHistory('shivgun_BM_Schematic') )
	{
	TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('shivgun_BM_Schematic'));
	NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}

	if ( !IsResearchInHistory('PlatedshivArmor_Schematic') )
	{
	TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('PlatedshivArmor_Schematic'));
	NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}

	if ( !IsResearchInHistory('PoweredshivArmor_Schematic') )
	{
	TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate('PoweredshivArmor_Schematic'));
	NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate);
	}
	




	


	

	//Commit the state change into the history.
	if( NewGameState.GetNumGameStateObjects() > 0 )
	{
	History.AddGameStateToHistory(NewGameState);
	}

	else
	{
	History.CleanupPendingGameState(NewGameState);
	}
}