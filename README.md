# Textscreen logger
Logs text screen addons to online admins and console!

#### Supported addons are:

- [3D2D Textscreens](https://steamcommunity.com/sharedfiles/filedetails/?id=109643223)
- [LED screens](https://steamcommunity.com/sharedfiles/filedetails/?id=1784911999)
- [Wiremod text screen](https://steamcommunity.com/sharedfiles/filedetails/?id=160250458)


#### Examples:

![image](https://user-images.githubusercontent.com/69946827/184075600-985b6046-d8f4-458b-b0e5-acbf0b60c66b.png)

![image](https://user-images.githubusercontent.com/69946827/184075648-d9eaeed0-50e8-4b5e-bf5b-d5100a8c17bc.png)

#### Dev info:
There's also a hook available:
```
TSLScreenSpawned:
entity, owner, screen_class, text
```

Ranks that receive the log can be configured in `sv_textscreen_logger.lua`
