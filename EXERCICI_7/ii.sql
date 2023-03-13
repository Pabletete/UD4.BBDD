select ticket.factura, ticket.data, ticket.hora, empleat.nom, dums(linea_ticket.presuport_iva)
from ticket, empleat, linea_ticket
where ticket.empleat_dni = empleat.dni
and ticket.id = linea_ticket.ticket_id
and producte.id = linea_ticket.producte_id
and producte.codi_barres = “8410128000400”