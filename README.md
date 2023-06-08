
<div align="center">

<img src="https://raw.githubusercontent.com/silv3rst0n3/StoneEye/main/SILV3RST0N3_free-file.png" ></img>

</div>

# StoneEYE
HI GUYS I Write Simple BASH Code For Watch bug bounty targets UPdates LIST Every 25 minutes.


<h2>Required Tools</h2>
in This tools YOU need Anew and JQ and Notify programs
 <h2>ANEW install </h2>
 go install -v github.com/tomnomnom/anew@latest
 <h2>Jq install</h2>
sudo apt-get install jq

 <h2>Screen INSTALL</h2>
For Run script Every 25 minutes Most Run In Screen !

sudo apt update & apt install screen
<h2>NOTIFY:</h2>
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
<h3>Config:</h3>
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


