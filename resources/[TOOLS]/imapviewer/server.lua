RegisterNetEvent("FRP:IMAPVIEWR:showcode")
AddEventHandler("FRP:IMAPVIEWR:showcode",function(code)
    print(tostring(code), all_imaps_list[code].dec_hash)
end)