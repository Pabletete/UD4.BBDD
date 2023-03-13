select Passatgers.DNI, pasatger.Nom, pasatger.Cognom, Vol.Num_vol, Vol.Origen, Vol.Destí, Reserva.import

from Passatgers, Reserva, Vol

where Passatgers.DNI = Reserva.DNI

and Reserva.Vol_idVol = vol.idVol

and Reserva.idReserva = “__”;