--Armored Pilot Engager
local s,id,o=GetID()
function s.initial_effect(c)
	c:EnableReviveLimit()
	--You can only Special Summon "Dingirsu, the Orcust of the Evening Star(s)" once per turn
	c:SetSPSummonOnce(id)
	--Xyz Summon Procedure
	Xyz.AddProcedure(c,nil,8,2,s.ovfilter,aux.Stringid(id,0))
	--atk down
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetRange(LOCATION_PZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetTargetRange(0,LOCATION_MZONE)
	e1:SetValue(-300)
	c:RegisterEffect(e1)
end
s.listed_names={id}
function s.ovfilter(c,tp,xyzc)
	return c:IsFaceup() and c:IsType(TYPE_NORMAL,xyzc,SUMMON_TYPE_XYZ,tp)
end