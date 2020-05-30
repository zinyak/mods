class fbteslahelper extends X2Effect_Persistent config(GameCore);



function ModifyTurnStartActionPoints(XComGameState_Unit UnitState, out array<name> ActionPoints, XComGameState_Effect EffectState)
{
	ActionPoints.Length = 0;
}




DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	EffectName = "autofiryl"
}