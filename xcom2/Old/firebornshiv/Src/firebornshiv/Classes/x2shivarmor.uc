class X2shivarmor extends X2Item config(GameData);



static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Armors;

	Armors.AddItem(CreateshivArmor());
	Armors.AddItem(CreatePlatedshivArmor());
	Armors.AddItem(CreatePoweredshivArmor());
	Armors.AddItem(CreatePlatedshivArmorfake());
	Armors.AddItem(CreatePoweredshivArmorfake());

	return Armors;
}

static function X2DataTemplate CreateshivArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'shivArmor');

	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.ArmorTechCat = 'conventional';
	Template.ArmorCat = 'shivset';
	Template.Tier = 0;
	Template.AkAudioSoldierArmorSwitch = 'Conventional';
	Template.EquipSound = "StrategyUI_Armor_Equip_Conventional_Spark";


	
	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, 0, true);

	return Template;
}

static function X2DataTemplate CreatePlatedshivArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PlatedshivArmor');

	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('PlatedSparkArmorStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'shivset';
	Template.Tier = 1;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated_Spark";

	Template.CreatorTemplateName = 'PlatedshivArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'shivArmor'; // Which item this will be upgraded from



	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_PLATED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_PLATED_MITIGATION_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_PLATED_MOBILITY_BONUS);

	return Template;
}

static function X2DataTemplate CreatePoweredshivArmor()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PoweredshivArmor');

	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('PoweredSparkArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'shivset';
	Template.Tier = 3;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered_Spark";

	Template.CreatorTemplateName = 'PoweredshivArmor_Schematic'; // The schematic which creates this item
	Template.BaseItem = 'PlatedshivArmor'; // Which item this will be upgraded from



	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_MITIGATION_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_MOBILITY_BONUS);

	return Template;
}






static function X2DataTemplate CreatePlatedshivArmorfake()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PlatedshivArmorfake');

	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 20;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('PlatedSparkArmorStats');
	Template.ArmorTechCat = 'plated';
	Template.ArmorCat = 'shivset';
	Template.Tier = 1;
	Template.AkAudioSoldierArmorSwitch = 'Predator';
	Template.EquipSound = "StrategyUI_Armor_Equip_Plated_Spark";





	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_PLATED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_PLATED_MITIGATION_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_PLATED_MOBILITY_BONUS);

	return Template;
}

static function X2DataTemplate CreatePoweredshivArmorfake()
{
	local X2ArmorTemplate Template;

	`CREATE_X2TEMPLATE(class'X2ArmorTemplate', Template, 'PoweredshivArmorfake');

	Template.strImage = "img:///UILibrary_StrategyImages.ScienceIcons.IC_SentinelModule";
	Template.ItemCat = 'armor';
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	Template.TradingPostValue = 60;
	Template.PointsToComplete = 0;
	Template.Abilities.AddItem('PoweredSparkArmorStats');
	Template.ArmorTechCat = 'powered';
	Template.ArmorCat = 'shivset';
	Template.Tier = 3;
	Template.AkAudioSoldierArmorSwitch = 'Warden';
	Template.EquipSound = "StrategyUI_Armor_Equip_Powered_Spark";





	Template.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_HEALTH_BONUS, true);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_MITIGATION_AMOUNT);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_DLC_Day90ItemGrantedAbilitySet'.default.SPARK_POWERED_MOBILITY_BONUS);

	return Template;
}