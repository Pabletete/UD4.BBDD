select cita.Matricula_Vehicle, cita.Data, cita.Hora, tipus_vehicle.Nom, vehicle.Marca, Client.Nom

from client, Vehicle, Tipus_de_vehicle, cita

where client.dni = vehicle.Client_DNI

and vehicle.matricula = cita.matricula_vehicle

and vehicle.ipus_de_vehicle = tipus_vehicle.id

and  cita.data > ‘10/3/2023’