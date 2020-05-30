class X2Item_SHIV_M1 extends X2Item config(SHIV_M1);

var config array<int> xMEDIUM_CONVENTIONAL_RANGE;
var config WeaponDamageValue xLMG_CONVENTIONAL_BASEDAMAGE;
var config int xLMG_CONVENTIONAL_AIM;
var config int xLMG_CONVENTIONAL_CRITCHANCE;
var config int xLMG_CONVENTIONAL_ICLIPSIZE;
var config int xLMG_CONVENTIONAL_ISOUNDRANGE;
var config int xLMG_CONVENTIONAL_IENVIRONMENTDAMAGE;

var config WeaponDamageValue x2LMG_CONVENTIONAL_BASEDAMAGE;
var config int x2LMG_CONVENTIONAL_AIM;
var config int x2LMG_CONVENTIONAL_CRITCHANCE;
var config int x2LMG_CONVENTIONAL_ICLIPSIZE;
var config int x2LMG_CONVENTIONAL_ISOUNDRANGE;
var config int x2LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;

var config WeaponDamageValue x3LMG_CONVENTIONAL_BASEDAMAGE;
var config int x3LMG_CONVENTIONAL_AIM;
var config int x3LMG_CONVENTIONAL_CRITCHANCE;
var config int x3LMG_CONVENTIONAL_ICLIPSIZE;
var config int x3LMG_CONVENTIONAL_ISOUNDRANGE;
var config int x3LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;

var config WeaponDamageValue barrage_BASEDAMAGE;
var config int barrage_ENVDAMAGE;


var config int barrage_SELECTION_RANGE;
var config int barrage_TARGETING_AREA_RADIUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(CreateTemplate_Cannon_Shiv_M1());
	Templates.AddItem(CreateTemplate_Cannon_Shiv_M2());
	Templates.AddItem(CreateTemplate_Cannon_Shiv_M3());

	Templates.AddItem(CreateTemplate_misslebarrageitem());
	Templates.AddItem(CreateTemplate_shivgrapitem());

	Templates.AddItem(CreateTemplate_fakegunn1());
	Templates.AddItem(CreateTemplate_fakegunn2());
	
	
	return Templates;
}

static function X2DataTemplate CreateTemplate_Cannon_Shiv_M1()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_SHIV_M1');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannonshiv';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 0;


	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.xLMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.xLMG_CONVENTIONAL_AIM;
	Template.CritChance = default.xLMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.xLMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.xLMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.xLMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('shivstandardshot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XEU_SHIV.Archetypes.WP_SHIV_minigun";
//	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
//	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
//	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
//	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
//	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
//	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
//	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;



	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Shiv_M2()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_SHIV_M2');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannonshiv';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 2;


	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.x2LMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.x2LMG_CONVENTIONAL_AIM;
	Template.CritChance = default.x2LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.x2LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.xLMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.x2LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('shivstandardshot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XEU_SHIV.Archetypes.WP_SHIV_minigun2";
//	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
//	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
//	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
//	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
//	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
//	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
//	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CreatorTemplateName = 'shivgun_MG_Schematic';
	Template.BaseItem = 'Cannon_SHIV_M1';


	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_Cannon_Shiv_M3()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_SHIV_M3');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannonshiv';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///UILibrary_Common.ConvCannon.ConvCannon_Base";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 4;


	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.x3LMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.x3LMG_CONVENTIONAL_AIM;
	Template.CritChance = default.x3LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.x3LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.xLMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.x3LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	Template.Abilities.AddItem('shivstandardshot');
	Template.Abilities.AddItem('Overwatch');
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');

	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "XEU_SHIV.Archetypes.WP_SHIV_minigun3";
//	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
//	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
//	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
//	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
//	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
//	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
//	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");
	Template.AddDefaultAttachment('Light', "ConvAttachments.Meshes.SM_ConvFlashLight");

	Template.iPhysicsImpulse = 5;

	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.CreatorTemplateName = 'shivgun_BM_Schematic';
	Template.BaseItem = 'Cannon_SHIV_M2';

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}



static function X2DataTemplate CreateTemplate_misslebarrageitem()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'shivmissitem');
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shivitem2';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Strategyimages.ScienceIcons.IC_healshiv";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.barrage_BASEDAMAGE;
	Template.iClipSize = 0;
	Template.iSoundRange = 0;
	Template.iEnvironmentDamage = default.barrage_ENVDAMAGE;
	Template.iIdealRange = 0;
	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'BlazingPinions';

	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.Abilities.AddItem('barrageStrike');
	Template.Abilities.AddItem('barrageStrike2');

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "WP_Archon_Blazing_Pinions.WP_Blazing_Pinions_CV";
	
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 45;
	Template.PointsToComplete = 0;
	Template.Tier = 0;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.barrage_SELECTION_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.barrage_TARGETING_AREA_RADIUS);



	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 2;
	Template.Cost.ResourceCosts.AddItem(Resources);


	return Template;
}


static function X2DataTemplate CreateTemplate_shivgrapitem()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'shivgrapitem');
	
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shivitem';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///UILibrary_Strategyimages.ScienceIcons.IC_healshiv";
	Template.EquipSound = "StrategyUI_Medkit_Equip";

	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.barrage_BASEDAMAGE;
	Template.iClipSize = 0;
	Template.iSoundRange = 0;
	Template.iEnvironmentDamage = default.barrage_ENVDAMAGE;
	Template.iIdealRange = 0;
	Template.iPhysicsImpulse = 5;
	Template.DamageTypeTemplateName = 'BlazingPinions';

	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	


	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = "xeu_shiv.WP_skirmisher_grapple_pull";
	
	Template.CanBeBuilt = false;
	Template.TradingPostValue = 45;
	Template.PointsToComplete = 0;
	Template.Tier = 0;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.barrage_SELECTION_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.barrage_TARGETING_AREA_RADIUS);



	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 2;
	Template.Cost.ResourceCosts.AddItem(Resources);


	return Template;
}




static function X2DataTemplate CreateTemplate_fakegunn1()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_fake1');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannonshiv';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_shivSuppression";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 2;


	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.x2LMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.x2LMG_CONVENTIONAL_AIM;
	Template.CritChance = default.x2LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.x2LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.xLMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.x2LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;


	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = " ";
//	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
//	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
//	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
//	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
//	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
//	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
//	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");

	Template.iPhysicsImpulse = 5;




	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}

static function X2DataTemplate CreateTemplate_fakegunn2()
{
	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Cannon_fake2');
	Template.WeaponPanelImage = "_ConventionalCannon";

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'cannonshiv';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_shivSuppression";
	Template.EquipSound = "Conventional_Weapon_Equip";
	Template.Tier = 2;


	Template.RangeAccuracy = default.xMEDIUM_CONVENTIONAL_RANGE;
	Template.BaseDamage = default.x3LMG_CONVENTIONAL_BASEDAMAGE;
	Template.Aim = default.x3LMG_CONVENTIONAL_AIM;
	Template.CritChance = default.x3LMG_CONVENTIONAL_CRITCHANCE;
	Template.iClipSize = default.x3LMG_CONVENTIONAL_ICLIPSIZE;
	Template.iSoundRange = default.xLMG_CONVENTIONAL_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.x2LMG_CONVENTIONAL_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = 0;
	Template.bIsLargeWeapon = true;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;


	
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = " ";
//	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_Cannon';
//	Template.AddDefaultAttachment('Mag', 		"ConvCannon.Meshes.SM_ConvCannon_MagA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_MagA");
//	Template.AddDefaultAttachment('Reargrip',   "ConvCannon.Meshes.SM_ConvCannon_ReargripA"/*REARGRIP INCLUDED IN TRIGGER IMAGE*/);
//	Template.AddDefaultAttachment('Stock', 		"ConvCannon.Meshes.SM_ConvCannon_StockA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_StockA");
//	Template.AddDefaultAttachment('StockSupport', "ConvCannon.Meshes.SM_ConvCannon_StockA_Support");
//	Template.AddDefaultAttachment('Suppressor', "ConvCannon.Meshes.SM_ConvCannon_SuppressorA");
//	Template.AddDefaultAttachment('Trigger', "ConvCannon.Meshes.SM_ConvCannon_TriggerA", , "img:///UILibrary_Common.ConvCannon.ConvCannon_TriggerA");

	Template.iPhysicsImpulse = 5;




	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;

	Template.DamageTypeTemplateName = 'Projectile_Conventional';

	return Template;
}


