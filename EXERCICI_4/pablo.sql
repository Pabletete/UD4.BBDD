select *
from polissa, client, tipus_polissa, venedor
where client.dni = polissa.client_dni
and polissa.id_tipus_polissa = tipus_polissa.id
and polissa.dni.venedor = “venedor”;
