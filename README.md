<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>MxCiqo — CLI Toolkit</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<body>

<h1>MxCiqo</h1>
<p>
  <b>MxCiqo</b> adalah toolkit CLI modular berbasis Bash, dirancang dengan gaya
  <i>semi-hacker</i> untuk kebutuhan <b>OSINT</b>, <b>network inspection</b>,
  dan <b>utility white-hat</b>.
</p>

<div class="box">
  <p><b>Author:</b> Khara</p>
  <p><b>Version:</b> 1.2.rc-2</p>
  <p><b>Platform:</b> Linux / Termux</p>
  <p><b>Repo:</b> <a href="https://github.com/KHaraStudio">github.com/KHaraStudio</a></p>
</div>

<h2>Instalasi</h2>
<pre>
pkg update && pkg upgrade
pkg install git bash
git clone https://github.com/KHaraStudio/MxCiqo
cd MxCiqo
bash install.sh
</pre>

<h2>Penggunaan Dasar</h2>
<pre>
MxCiqo
MxCiqo scan example.com
MxCiqo whois example.com
MxCiqo --help
MxCiqo --version
</pre>

<h2>Struktur Folder</h2>
<pre>
~/.MxCiqo
├── MxCiqo          # Core CLI
├── plugins/        # Command utama
│   ├── scan.sh
│   ├── whois.sh
│   └── dns.sh
├── home/           # Option (--*)
│   ├── help.sh
│   └── version.sh
└── back-up/
</pre>

<h2>Konsep Plugin</h2>
<ul>
  <li><b>Command</b> → <code>MxCiqo scan</code> → <code>plugins/scan.sh</code></li>
  <li><b>Option</b> → <code>MxCiqo --version</code> → <code>home/version.sh</code></li>
</ul>

<h2>Contoh Header Plugin</h2>
<pre>
#!/bin/bash
# DESC: Scan port dasar target
</pre>

<h2>Filosofi</h2>
<ul>
  <li>Tidak pakai API key</li>
  <li>Modular & mudah dikembangkan</li>
  <li>Fokus edukasi & white-hat</li>
  <li>Ringan, cepat, CLI-native</li>
</ul>

<h2>Peringatan</h2>
<p class="warn">
  Tool ini dibuat untuk tujuan edukasi, riset, dan pengujian legal.
  Segala penyalahgunaan di luar tanggung jawab author.
</p>

<h2>Lisensi</h2>
<p>
  Open-source — gunakan, modifikasi, dan kembangkan dengan tanggung jawab.
</p>

<hr>

<p>
  <i>“Simple tools. Real control.”</i><br>
  — MxCiqo
</p>

</body>
</html>
