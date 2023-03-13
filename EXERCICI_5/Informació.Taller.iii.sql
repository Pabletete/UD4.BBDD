select *

from client, vehicle, tipus_vehicle, cita

where client_DNI = vehicle.Client_DNI

and vehicle.Tipus_de_vehicle = tipus_vehicle.id

and vehicle.matricula = cita.matricula_vehicle