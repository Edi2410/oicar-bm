# oicar-bm
---
## 1. O aplikaciji

Aplikacija je namijenjena za predaju feedbacka i pregled životopisa na projektu Bussiness Matchmaker.

Razvijene su tri okoline Frontend(React), Backend(Django REST framework) i Mobile (Flutter)

------
## 2. Pokretanje aplikacije lokalno

#### 2.1 Instaliravanje lokalnog environmenta za backend 

Potrebno je imati instaliran [python](https://www.python.org/downloads/)

Kreiranje  .venv: `python -m venv /path/to/new/virtual/environment`

Ulazak u .venv:
```shell
#windows
.venv/Scripts/activate

#macOS
source .venc/bin/activate
```

Pobrinite se da preuzmete sve potrebne pakete na način da instalirate sve iz `requiremnts.txt` komandom `pip install -r requiremnts.txt`
#### 2.2 Pokretanje backenda

Nakon što uđete u virtualno okruženje dođite do api foldera. Unutar api foldera je potrebno postaviti `.env` file kojeg generirate po `.example.env`  primjeru.

Nakon što popunite sve varijable spremni ste za pokretanje backend dijela aplikacije. 

Provijerite dali vam `settings/settings.py` gleda na lokalnu bazu podataka. Postavite Databse varijablu da izgleda ovako:
```python 
...
DATABASES = {
	# "default": {
		# "ENGINE": "django.db.backends.postgresql",
		# "NAME": env("POSTGRES_DB_NAME"),
		# "USER": env("POSTGRES_USER"),
		# "PASSWORD": env("POSTGRES_PASSWORD"),
		# "HOST": env("POSTGRES_DB_HOST"),
		# "PORT": env("POSTGRES_PORT"),
		# }
	'default': {
		'ENGINE': 'django.db.backends.sqlite3',
		'NAME': BASE_DIR / 'db.sqlite3',
	}
}
...
```

Kreirajte bazu sljedečim naredbama:
```shell
python manage.py makemigrations
python manage.py migrate
```

Prije samog početka si kreirajte jednog admin korisnika:
```shell
python manage.py createsuperuser

#username: 'admin'
#email: 'admin@estudent.hr'
#passworrd: 'admin'
```

kada vas pita želite li dopustiti slabu lozinku stisnite 'y'

Pokrenite server naredbom: ```
```shell
python manage.py runserver
```

Backend je pokrenut na url: [localhost:8000](www.localhost:8000)

Odite na url "api/admin"

Logirajte se s podacima od superusera i morate dodati User Data za superusera kako bi otključali njegov login i admin rolu unutar aplikacije

Sada imate inicijalnog superusera s kojim možete odraditi prvi login i pozvati druge članove u aplikaciju.

#### 2.3 Pokretanje frontenda lokalno

Potrebno je imati instaliran [Node.js](https://nodejs.org/en) 

Kroz CMD se pozicionirajte u folder frontend/web

Preuzmite sve potrebne pakete:
```shell
npm install
```

Postavite URL da gleda lokalni backend (path: web/src/context/AxiosContext.ts)
```ts
//const axios = Axios.create({ baseURL: "https://bm.estudent.hr/api/" }); // production
const axios = Axios.create({ baseURL: "http://127.0.0.1:8000/api/" }); // development
// const axios = Axios.create({ baseURL: "http://127.0.0.1:8701/api/" }); // docker
```

Pokrenite frontend:
```shell
npm start
```

Frontend je pokrenut na url: [localhost:5173](www.localhost:5173)

#### 2.4 Pokretanje mobilne aplikacije 

Potrebno je imati preuzeto [android studio](https://developer.android.com/studio) i [flutter](https://docs.flutter.dev/get-started/install)

Otvorite frontend/mobile folder u android studiu.

Pokrenite jedan android uređaj u emulatoru. 

Pokrenite sljedeće komande kako bi generirali sve potrebno za pokretanje aplikaciju.
```shell
flutter pub get

flutter gen-l10n --arb-dir assets/l10n

flutter pub run build_runner build

dart run build_runner build
```

Nakon pokrenutih komandi slobodmo možete pokrenuti build aplikacije na emulatoru kroz android studio.

---
## 3 Pokretanje aplikacije pomoću docker

Potrebno je imati instaliran Docker Dosktop https://www.docker.com/products/docker-desktop/

Unutar api foldera je potrebno postaviti `.env` file kojeg generirate po `.example.env`  primjeru. Također se jedan .env file nalazi i u root folderu. Postavite i njega.

  
Provijerite dali vam `backend/api/settings/settings.py` gleda na lokalnu bazu koja se nalazi u dockeru. Postavite Database varijablu da izgleda ovako:
```python 
...
DATABASES = {
	"default": {
		 "ENGINE": "django.db.backends.postgresql",
		 "NAME": env("POSTGRES_DB_NAME"),
		 "USER": env("POSTGRES_USER"),
		 "PASSWORD": env("POSTGRES_PASSWORD"),
		 "HOST": env("POSTGRES_DB_HOST"),
		 "PORT": env("POSTGRES_PORT"),
		 }
	#'default': {
	#	'ENGINE': 'django.db.backends.sqlite3',
	#	'NAME': BASE_DIR / 'db.sqlite3',
	#}
}
...
```

Postavite URL da gleda backend kontenjer (path: web/src/context/AxiosContext.ts)
```ts
//const axios = Axios.create({ baseURL: "https://bm.estudent.hr/api/" }); // production
// const axios = Axios.create({ baseURL: "http://127.0.0.1:8000/api/" }); // development
const axios = Axios.create({ baseURL: "http://127.0.0.1:8701/api/" }); // docker
```

Kako bi pokrenuli docker upišite komandu:
```
docker compose up -d --build
```

Nakon što se kreairaju svi kontenjeri aplikaciji pristupate na url: [localhost:8701](www.localhost:8701) , do backenda dolazite putanjom  [localhost:8701/api/](www.localhost:8701/api/).

Uđite u backend kontenjer klikom na njega kroz Docker Desktop aplikaciju.

Odite u terminal kontenjera i upišite sljedeće

Prije samog početka si kreirajte jednog admin korisnika:
```shell
python manage.py createsuperuser

#username: 'admin'
#email: 'admin@estudent.hr'
#passworrd: 'admin'
```

kada vas pita želite li dopustiti slabu lozinku stisnite 'y'

Odite na url "api/admin"

Logirajte se s podacima od superusera i morate dodati User Data za superusera kako bi otključali njegov login i admin rolu unutar aplikacije

Sada imate inicijalnog superusera s kojim možete odraditi prvi login i pozvati druge članove u aplikaciju.

----