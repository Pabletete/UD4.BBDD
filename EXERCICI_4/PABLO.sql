SELECT Exercici4.Client
from Polissa, client
where client.DNI = Polissa.Client_DNI
and Client.Nom = “Felipe”;Client