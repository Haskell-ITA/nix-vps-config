# Configurazione nixos per il vps di haskell-ita

Work In Progress

Per testare:

```
sudo nixos-container create vps-test --config-file configuration.nix
sudo nixos-container start vps-test
$BROWSER $(sudo nixos-container show-ip vps-test)
```

Per testare pacchetti individuali:

```
nix-build standalone-packages.nix -A nome-del-pacchetto
```

Da fare:

* [x] haskell-ita.it
* [ ] ricompilazione automatica di haskell-ita.it a ogni push  
      (leggermente complicato)
* [ ] irc logger

