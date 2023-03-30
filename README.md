# Wp-Wordlist-Maker

>! ⚠️ **WARNING:** This tool is provided for educational and ethical purposes only. Do not use it for any illegal activities, as the author is not responsible for any misuse or damage caused by this tool. Use it at your own risk.

Use Wp-Wordlist-Maker to generate a list of all available #WordPress plugins and themes and fuzz your target and find CVEs or information dicloser to report 🔥


# Examples

#### Find Plugin Get Related Wordslist :

```bash
bash wp-wordlist "plugin" > plugins.txt
```
### Find Plugin Get Related Wordslist :
```bash
bash wp-wordlist "theme" > theme.txt
```
# How To Use With Fuff your target
### With Plugin Wordlist 
```bash
fuff -w /path/to/plugins.txt -u https://Target.com/wp-content/plugins/FUZZ/readme.txt
```
### With Theme Wordlist 
```bash
fuff -w /path/to/theme.txt -u https://Target.com/wp-content/plugins/FUZZ/readme.txt
```
