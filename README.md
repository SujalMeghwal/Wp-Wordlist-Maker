<h1 align="center">Wp-Wordlist-Maker</h1>
<h3 align="center">Use Wp-Wordlist-Maker to generate a list of all available #WordPress plugins and themes! </h3>
Use the wordlist to fuzz your target and find CVEs or 0days to report🔥

# Examples

#### Find Plugin Get Related Wordslist :

```bash
bash wp-wordlist "plugin" > plugins.txt
```
Find Plugin Get Related Wordslist :
```bash
bash wp-wordlist "theme" > theme.txt
```
# How To Use With Fuff
With Plugin Wordlist 
```bash
fuff -w /path/to/plugins.txt -u https://Target.com/wp-content/plugins/FUZZ/readme.txt
```
With Theme Wordlist 
```bash
fuff -w /path/to/theme.txt -u https://Target.com/wp-content/plugins/FUZZ/readme.txt
```
