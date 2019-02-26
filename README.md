# Inizializzazione insegna.
Qui ti descrivo come installare le nuove insegne

## Attenzione!
Prima di procedere devi necessariamente effettuare alcune operazioni sul raspy.
Inoltre alcune cose le puoi fare solo da linux o da un mac.


### 1. Installa Raspbian Stretch Lite sul raspberry.

Lo scarichi da questa pagina https://www.raspberrypi.org/downloads/raspbian/

Ti troverai un archivio che devi estrarre. All'interno vi sarà un file .img.

Se sei su Windows scarica questo software https://sourceforge.net/projects/win32diskimager/
Seleziona l'IMG da burnare e la scheda SD sul quale farlo.

Se sei su Linux unzippa l'archivio e usa dd in questa maniera

sudo dd if=PERCORSO_DELL'IMG of=/POSIZIONE_SCHEDA-SD bs=512

per conoscere la posizione della scheda sd apri un terminale e fai
```bash
sudo blkid
```
ti troverai una lista che inizia con /dev/sda*

inserisci la scheda sd da burnare e fai di nuovo
```bash
sudo blkid
```
e controlla quale nuovo /dev è uscito. Quella è la tua scheda sd.

ATTENTO! SE SBAGLI DEVICE TI FORMATTI L'HARD DISK!

Assicurati di formattarla per sicurezza prima.

### 2. Configura la tua rete.

Accedi alla tua scheda sd. Troverai due partizioni: boot e rootfs.
Come prima cosa attiva l'SSH inserendo un file vuoto con titolo ssh nella partizione boot

```bash
touch ssh
```

ora devi settare la connessione locale. Puoi attaccare il raspy ad una LAN oppure effettuare questi passaggi.

Nella partizione rootfs apri un terminale ed esegui

```bash
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
```

dentro devi scriverci:

```
country=IT
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
ssid="NOME_DELLA_RETE"
psk="PASSWORD_DELLA_RETE"
key_mgmt=WPA-PSK
}
```

Inserisci la sd nel raspberry e attaccalo alla corrente e prega che tutto sia andato nel modo giusto.

### 3. Collegati e configura il raspberry

Apri Fing (scaricalo dal google play store) o comunque una applicazione che ti dice quali devices sono collegati al tuo wifi. Scopri l'ip del raspberry.

Apri un terminale ed esegui

```bash
ssh pi@123.456.789.012
```

dove ovviamente al posto dei numeri random che ho messo inserisci l'indirizzo ip locale del raspberry.

La password di default è

```
raspberry
```

ora che sei dentro, devi configurare la lingua, eventualmente la timezone e devi espandere il filesystem.

```bash
sudo raspi-config
```

e da qui naviga nei menù per fare queste cose... Se non lo sai fare cerca su google, ma ti assicuro che sono super semplici. Si tratta solo di leggere quello che vedi sul monitor.

### 4. Installa alcuni software.

Abbiamo bisogno di node, di npm e di git.

Collegati al raspberry da un terminale.

#### node e npm

puoi seguire questa guida ufficiale
https://github.com/nodesource/distributions/blob/master/README.md

#### git

```bash
sudo apt-get install git
```

### 5. Scarica questo repository ed esegui l'installazione

Collegati al raspy da un terminale ed esegui

```bash
git clone https://github.com/mediaintegrati/installainsegna
```

attendi che abbia scaricato dopodichè

```bash
cd installainsegna
sudo chmod +x install.sh
sudo ./install.sh
```
non aver paura, ci metterà tempo. Alla fine il raspberry si riavvierà.

### 6. Hai finito per ora. Ora devi andare a montarla.
Assicurati di conoscere il nome della rete e la password del cliente dove andrai a montare l'insegna.

Procurati un terminale ssh dal google play store (Termius o JuiceSSH o quello che preferisci).

Attacca l'insegna alla corrente e attendi qualche minuto. Troverai una rete chiamata "comitup-1234" dove al posto di 1234 troverai altri numeri.

Una volta collegato alla rete, apri il tuo terminale dal cellulare e collegati a

```bash
pi@10.42.0.1
```
dopo esserti collegato esegui

```bash
sudo comitup-cli
```

e scegli la configurazione manuale della rete.
Ti verrà chiesto il nome della rete e la password.

NON USARE LA CONFIGURAZIONE AUTOMATICA!!!

Il raspberry si riavvierà da solo. Se non funziona riavvialo tu.

### HAI FINITO BRAVO!

## HARDWARE

Il pin di controllo del led è il 32. Tenendo il raspberry con la sd rivolta verso l'alta, il pin di controllo è il quintultimo sulla fila di destra.
