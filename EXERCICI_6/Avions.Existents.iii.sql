select Avió.Marca, Avió.Model_Avió, Avió.Capacitat_Passatgers, Vol.idVol, vol.Data, Vol.Hora_Sortida, reserva.Origen, Reserva.Destí, Vol.Hora_Arribada

from Avió, Vol, Reserva

where Avió.Marca = “Airbus”;

and Avió.idAvió = Vol.idVol = Vol.Avió_idAvió

and Reserva.Vol_idVol = vol.idVol;