<meta charset='utf-8'>
<link href="http://skkzsh.github.io/style_sheet/markdown/markdown.css" rel="stylesheet" title="markdown"></link>
<!-- You can open the links below on local file with IE -->

# Windows

## Startup
System Configuration (`msconfig`) で有効・無効

- [shell:startup](shell:startup)
- [%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup](shell:startup)

で追加・削除

## SendTo
右クリック「送る」

- [shell:sendto](shell:sendto)
- [%APPDATA%\Microsoft\Windows\SendTo](shell:appdata\Microsoft\Windows\SendTo)

で追加・削除

## Registory
### 既定のプログラムを削除
    HKEY_CLASSES_ROOT\Applications

### 各拡張子で関連付けを削除
    HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.*\UserChoice
