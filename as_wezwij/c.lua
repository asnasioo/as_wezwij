local wezwanieCzas = 0
local wezwanieAktywne = false
local wezwanieTekst = ""

RegisterNetEvent('as_wezwij:pokazPowiadomienie')
AddEventHandler('as_wezwij:pokazPowiadomienie', function(tekst, czas)
    wezwanieTekst = tekst
    wezwanieCzas = GetGameTimer() + czas * 1000
    wezwanieAktywne = true
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if wezwanieAktywne and GetGameTimer() < wezwanieCzas then
            DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 180)  -- tlo

            SetTextFont(4)
            SetTextScale(1.0, 1.0)
            SetTextColour(255, 255, 255, 255)
            SetTextOutline()
            SetTextCentre(true)
            SetTextEntry("STRING")
            AddTextComponentString(wezwanieTekst)
            DrawText(0.5, 0.5)
        elseif wezwanieAktywne and GetGameTimer() >= wezwanieCzas then
            wezwanieAktywne = false
        end
    end
end)
