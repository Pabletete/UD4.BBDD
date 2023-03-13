select count(distint(vol.id)) as “numero_de_vols_reservats”

from Reserva , vol

where Reserva.Vol_idVol = vol.idVol;