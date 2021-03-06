local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["actionbar"].enable == true then return end

---------------------------------------------------------------------------
-- setup MultiBarBottomLeft as bar #2
---------------------------------------------------------------------------

local bar = TukuiBar2
MultiBarBottomLeft:SetParent(bar)

local sbWidth = C.actionbar.sidebarWidth

for i=1, 12 do
	local b = _G["MultiBarBottomLeftButton"..i]
	local b2 = _G["MultiBarBottomLeftButton"..i-1]
	b:SetSize(T.buttonsize, T.buttonsize)
	b:ClearAllPoints()
	
	if i == 1 then
		b:SetPoint("BOTTOMLEFT", bar, 0,0)
	elseif i == 7 then
		b:SetPoint("TOPLEFT", bar, 0,0)
	elseif (i > sbWidth and i < 7) or (i > (sbWidth+6))  then
		b:SetPoint("TOP", UIParent, "BOTTOM", 0, -20)
	else
		b:SetPoint("LEFT", b2, "RIGHT", T.buttonspacing, 0)
	end
end