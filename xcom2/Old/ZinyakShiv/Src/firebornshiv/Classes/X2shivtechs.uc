class X2shivtechs extends X2Item;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;
	
	// Weapon Schematics
	Schematics.AddItem(CreateTemplate_shivgun_Magnetic_Schematic());
	Schematics.AddItem(CreateTemplate_shivgun_Beam_Schematic());

	Schematics.AddItem(CreateTemplate_PlatedshivArmor_Schematic());
	Schematics.AddItem(CreateTemplate_PoweredshivArmor_Schematic());


	return Schematics;
}

// **************************************************************************
// ***                       Weapon Schematics                            ***
// **************************************************************************


static function X2DataTemplate CreateTemplate_shivgun_Magnetic_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'shivgun_MG_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Mag_Rifle";
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_shivSuppression";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Cannon_fake1';
	Template.HideIfPurchased = 'shivgun_BM_Schematic';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
    Resources.Quantity = 75;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateTemplate_shivgun_Beam_Schematic()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'shivgun_BM_Schematic');

	Template.ItemCat = 'weapon';
	//Template.strImage = "img:///UILibrary_StrategyImages.X2InventoryIcons.Inv_Beam_Rifle";
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_shivSuppression";
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'Cannon_fake2';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
    Resources.Quantity = 125;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = 20;
	Template.Cost.ResourceCosts.AddItem(Resources);
	
	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateTemplate_PlatedShivArmor_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PlatedshivArmor_Schematic');

	Template.ItemCat = 'armor';
	//Template.strImage = "img:///UILibrary_DLC3Images.Inv_Spark_Plated_A";
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'PlatedshivArmorfake';
	Template.HideIfPurchased = 'PoweredshivArmor_Schematic';

	// Narrative Requirements
	Template.Requirements.RequiredTechs.AddItem('PlatedArmor');
	Template.Requirements.RequiredEngineeringScore = 10;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Non-Narrative Requirements
	AltReq.RequiredTechs.AddItem('PlatedArmor');
	AltReq.RequiredEngineeringScore = 10;
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 75;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = 15;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = 5;
	Template.Cost.ArtifactCosts.AddItem(Resources);

	return Template;
}

static function X2DataTemplate CreateTemplate_PoweredShivArmor_Schematic()
{
	local X2SchematicTemplate Template;
	local StrategyRequirement AltReq;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'PoweredshivArmor_Schematic');

	Template.ItemCat = 'armor';
	//Template.strImage = "img:///UILibrary_DLC3Images.Inv_Spark_Powered_A";
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.PointsToComplete = 0;
	Template.Tier = 1;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	// Reference Item
	Template.ReferenceItemTemplate = 'PoweredshivArmorfake';

	// Narrative Requirements
	Template.Requirements.RequiredTechs.AddItem('PoweredArmor');
	Template.Requirements.RequiredEngineeringScore = 20;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Non-Narrative Requirements
	AltReq.RequiredTechs.AddItem('PoweredArmor');
	AltReq.RequiredEngineeringScore = 20;
	AltReq.bVisibleIfPersonnelGatesNotMet = true;
	Template.AlternateRequirements.AddItem(AltReq);

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 150;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'AlienAlloy';
	Resources.Quantity = 25;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Resources.ItemTemplateName = 'EleriumDust';
	Resources.Quantity = 10;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}


