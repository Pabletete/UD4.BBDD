Select NumPolissa, Tipus_polissa.Nom, Client.DNI, Client.Nom, client.cognom
from polissa, client, tipus_polissa
where client.dni = polissa.client.dni
and client.tipus_polissa Client= tipus_polissa.id
and polissa.id_tipus_polissa = tipus_polissa.id
and tipus_polissa.mm = “viatge”;
