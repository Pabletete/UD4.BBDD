select count(linea_ticket) as “numero linies”
from linea_ticket, ticket, empleat
where empleat.dni = ticket.empleat_dni
and ticket.id = liniea_ticket.ticket_id
and empleat.nom like “o%”
and ticket.data < “23/2/2023”;