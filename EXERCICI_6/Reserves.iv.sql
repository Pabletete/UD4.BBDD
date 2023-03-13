select Reserva.idReserva, Passatgers.Nom

from Passatgers, Vol ,Reserva

where Passatgers.DNI = Reserva.DNI

and Reserva.Vol_idVol = vol.idVol

Vol.Data_Vol > “06/05/2022”;