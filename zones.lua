local areas = workspace:FindFirstChild("Areas")

if areas then
    print("=== ZONES TROUVÉES ===")

    for _, zone in ipairs(areas:GetChildren()) do
        print(zone.Name)
    end
else
    print("Dossier Areas introuvable")
end