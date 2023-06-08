# StoneEYE
HI GUYS I Write Simple BASH Code For Watch bug bounty targets UPdates LIST

in This tools YOU need Anew and JQ and Notify programs 


<h1>NOTIFY:</h1>
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
<h1>Config</h1>
you most Config Notify to your telegram bot or slack or discord app for send results .
For Discord app if you want separate RESULT of bounty programs You most Edit code and after notify use -id hackerone for send results send to hackerone Discord channel

```discord:
  - id: "hackerone"
    discord_channel: "#hackerone"
    discord_username: "StoneEye"
    discord_format: "{{data}}"
    discord_webhook_url: "DISCORD WEB HOOK"
  
  - id: "bugcrowd"
    discord_channel: "#bugcrowd"
    discord_username: "StoneEye"
    discord_format: "{{data}}"
    discord_webhook_url: "DISCORD WEB HOOK"

  - id: "hackenproof"
    discord_channel: "#hackenproof"
    discord_username: "StoneEye"
    discord_format: "{{data}}"
    discord_webhook_url: "DISCORD WEB HOOK"
  
  - id: "domains"
    discord_channel: "#domains"
    discord_username: "StoneEye"
    discord_format: "{{data}}"
    discord_webhook_url: "DISCORD WEB HOOK"

telegram:
  - id: "tel"
    telegram_api_key: "API TELEGRAM BOT"
    telegram_chat_id: "chatid"
    telegram_format: "{{data}}"

  - id: "tel2"
    telegram_api_key: "API TELEGRAM BOT"
    telegram_chat_id: "chatid"
    telegram_format: "{{data}}"
```
 <h1>ANEW install </h1>
 go install -v github.com/tomnomnom/anew@latest
 <h1>Jq install</h1>
sudo apt-get install jq

 <h1>Screen INSTALL</h1>
For Run script Every 25 minutes Most Run In Screen !

sudo apt update & apt install screen

