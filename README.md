# 🦎 asngecko 1.2.0 – Fetch IP ranges for Autonomous Systems

![License](https://img.shields.io/badge/license-MIT-blue)
![Shell](https://img.shields.io/badge/shell-bash-green)

> Quickly fetch & format IPv4/IPv6 prefix lists for one‑or‑many Autonomous Systems (ASNs).

Awesome customizable tool for retrieving registered IPs attached to ASN systems, enabling easy management, listing, filtering, and automation to your needs.

---

## ✨ Quick start

```bash
# install the tool (adds `asngecko` to /usr/local/bin)
bash install.sh

# remove it again (cleans up binary & completion files)
bash uninstall.sh
```

---

## 🚀 Usage

```bash
asngecko -a AS15169 [options]
asngecko -a "AS15169 AS16509" [options]
asngecko -a AS15169 -q [more options] | your-special-command
asngecko -l list.txt [options]
```

### Options

| Short | Long / Arg        | Meaning                                                   |         |                           |
| ----- | ----------------- | --------------------------------------------------------- | ------- | ------------------------- |
| `-a`  | `--asn "AS… AS…"` | Space‑separated list of ASNs (quote the list)             |         |                           |
| `-l`  | `--list FILE`     | Read ASNs from *FILE*, one per line                       |         |                           |
| `-4`  |                   | IPv4 only                                                 |         |                           |
| `-6`  |                   | IPv6 only                                                 |         |                           |
|       | `-b, --both`      | Fetch both families (default)                             |         |                           |
| `-s`  | `--server HOST`   | WHOIS server for both families                            |         |                           |
|       | `--server4 HOST`  | WHOIS server for IPv4 (default **whois.radb.net**)        |         |                           |
|       | `--server6 HOST`  | WHOIS server for IPv6 (default **whois.ripe.net**)        |         |                           |
| `-o`  | `--output FILE`   | Base filename (adds `.ipv4` / `.ipv6` if needed)          |         |                           |
|       | `--output4 FILE`  | Explicit IPv4 output path (overrides `-o`)                |         |                           |
|       | `--output6 FILE`  | Explicit IPv6 output path (overrides `-o`)                |         |                           |
| `-c`  | `--console`       | Print to stdout (default when no `-o/--outputX` is given) |         |                           |
| `-f`  | `--format FMT`    | Output format: `cidr`                                     |  `csv`  |  `json` (default: `cidr`) |
| `-u`  | `--uniq`          | De‑duplicate & sort prefixes                              |         |                           |
| `-t`  | `--throttle SEC`  | Sleep *SEC* seconds between individual ASN queries        |         |                           |
| `-q`  | `--quiet`         | Suppress progress output                                  |         |                           |
| `-h`  | `--help`          | Show help & exit                                          |         |                           |

---

## 💡 Examples

```bash
# Dump all prefixes for AS1234 and filter a single /24
asngecko -a AS1234 | grep 120.0.0.0/24

# Google IPv6 ranges to file
asngecko -a AS15169 -6 -o google_v6.txt

# Fetch Google (AS15169) and Facebook/Meta (AS32934) at once,
# writing IPv4 & IPv6 lists to separate folders
asngecko -a "AS15169 AS32934" -46 \
  --output4 /srv/v4/all.txt \
  --output6 /srv/v6/all.txt
```

---

## 📦 Installation

### Arch Linux / Manjaro

```bash
sudo pacman -S asngecko
```

### Manual

```bash
# Clone this repo & make the script executable
git clone https://github.com/youruser/asngecko.git
cd asngecko
chmod +x asngecko
audo cp asngecko /usr/local/bin/asngecko

# Optionally, add shell completion
sudo cp contrib/asngecko-completion.bash /etc/bash_completion.d/
```

### Dependencies

* **bash** >= 4.x (associative arrays)
* Standard UNIX tools: `awk`, `sed`, `grep`, `sort`, `uniq`
* External: `whois` (tested with *GNU jwhois* & *RIPE whois*)

---

## 🗃️ Output formats

* **cidr** – plain list (`203.0.113.0/24`)
* **csv**  – `asn,prefix,family` per line
* **json** – array of objects

---

---

## 📜 License

Licensed under the MIT License – see [LICENSE](LICENSE) for details.
