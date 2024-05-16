# oicar-bm

### Pokretanje aplikacije kroz docker
Potrebno je imati instaliran Docker Dosktop https://www.docker.com/products/docker-desktop/ 

Postaviti .env filove tamo gdje se nalaze primjeri .env filova. Prave vrijednosti varijabli možete pronaći na githubu pod Settings/Environments

Provijeriti jeli setapirano na backendu da gleda bazu u dockeru i dali frontend gleda dobar url

Pokrenite komandu 'docker compose u p -d --build'


### Kreiranje inicialnog superadmina

Uđite u backend kontenjer klikom na njega kroz Docker Desktop aplikaciju.

Odite u terminal kontenjera i upišite sljedeće

'python manage.py createsuperuser'
username: 'test'
email: 'test@estudent.hr'
passworrd: 'test'

kada vas pita želite li dopustiti slabu lozinku stisnite 'y'

Odite na api/admin

Logirajte se s podacima od superusera i morate dodati User Data za  superusera kako bi otključali njegov login i admin rolu unutar aplikacije

Sada imate inicijalnog  superusera s kojim možete odraditi prvi login i pozvati druge članove u aplikaciju.


