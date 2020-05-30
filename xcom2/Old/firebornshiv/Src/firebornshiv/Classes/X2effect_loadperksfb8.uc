class X2Effect_LoadPerksfb8 extends X2Effect;

var name AbilityPerkToLoad;

simulated protected function OnEffectAdded (const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{


	local XComContentManager		Content;
	local XComUnitPawnNativeBase	UnitPawnNativeBase;
	
	Content = `CONTENT;
	UnitPawnNativeBase = XGUnit(XComGameState_Unit(kNewTargetState).GetVisualizer()).GetPawn();

	Content.BuildPerkPackageCache();
	Content.CachePerkContent(AbilityPerkToLoad);
	Content.AppendAbilityPerks(AbilityPerkToLoad, UnitPawnNativeBase);

}