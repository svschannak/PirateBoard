#PirateBoard

Based on dashing. A f*cking awesome tool for dashboards...

##Modification

- Ist der Vorstand beschlussfähig
	- NEIN: curl -d '{ "auth_token": "piratenrostock", "text": "NEIN" }' http://pirateboard.herokuapp.com/widgets/beschlussfaehig
	- JA: curl -d '{ "auth_token": "piratenrostock", "text": "JA" }' http://pirateboard.herokuapp.com/widgets/beschlussfaehig
- Kontostand
	- NEIN: curl -d '{ "auth_token": "piratenrostock", "current": 1000 }' http://pirateboard.herokuapp.com/widgets/kontostand

##TODO
- [X]SMV einbinden
- [X]Kontostand
- [X]Mitgliederzahl
- Kommende Termine
- Feed piraten-rostock.de
- ML Rostock
- [X]Ist der Vorstand beschlussfähig?

##Online

See it on http://pirateboard.herokuapp.com/sample .

Check out http://shopify.github.com/dashing for more information.