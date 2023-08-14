<p align="center">
  <picture>
    <a href="/README.md">
      <img alt="Inglés" src="https://openmoji.org/data/color/svg/1F1EC-1F1E7.svg" width=5%>
    </a>
  </picture>
  <picture>
    <a href="/README_BR.md">
      <img alt="Portugués" src="https://openmoji.org/data/color/svg/1F1E7-1F1F7.svg" width=5%>
    </a>
  </picture>
  <picture>
    <a href="/README_ES.md">
      <img alt="Español" src="https://openmoji.org/data/color/svg/1F1EA-1F1F8.svg" width=5%>
    </a>
  </picture>
</p>
<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./.media/language/spanish/generikit_wide_dark.png">
  <source media="(prefers-color-scheme: light)" srcset="./.media/language/spanish/generikit_wide_light.png">
  <img alt="GeneriKit" src="./.media/language/spanish/generikit_wide_dark.png" width="55%">
</picture>
</p>

Patchs genéricos de PlayStation. Los que fueron rechazados por los sábios.

Uso
---

Tener que patchear un archivo y compilar un kernel completo requiere un nivel de conocimiento medio para la mayoría de los usuarios.<br>
Pero hacer esto es una tarea difícil. Y es por eso que yo hice este repositorio.

Dependências
------------

A la mitad del recorrido del repositorio, muchos sistemas tendrán instalaciones automáticas.<br>
Pero ese día todavía está muy lejos. Así que considere tener los siguientes paquetes:

|   Pacote      |   URL                                             |
|---------------|---------------------------------------------------|
|   git         |   https://ftp.gnu.org/gnu/git/                    |
|   gcc         |   https://ftp.gnu.org/gnu/gcc/                    |
|   make        |   https://ftp.gnu.org/gnu/make/                   |

Se requiere el uso de los headers del kernel. Cada distribución tiene su propio paquete diferente.<br>
También se pueden compilar manualmente. Vea [eso](https://www.kernel.org/doc/html/latest/kbuild/modules.html).

Compilando
----------

<b>Dica</b>: "su -c" puede ser su administrador de root, sudo, doas, o cualquier otro...<br>
Solo recuerde eliminar las comillas (") de cada comando que contenga "su -c".

<b>Clona el repositorio</b>:
```sh
git clone https://github.com/KanuX-14/generikit-hid-sony.git
cd generikit-hid-sony/
```

<b>Usando DKMS</b>:
```sh
su -c "sh dkms-install.sh"
```

<b>Compilando manualmente</b>:
```sh
make && su -c "make install clean"
```

Retire el antiguo driver para cargar el de generikit:
```sh
printf "blacklist hid-sony\n" | su -c "tee /etc/modprobe.d/generikit.conf"
```

Para cargar el driver original, desactive `generikit-hid-sony` y cargue `hid-sony`:
```sh
su -c "modprobe -r generikit-hid-sony"
su -c "modprobe hid-sony"
```
Para volver al driver de generikit, haz lo reverso de el indicado.

Retirando
---------

<b>Usando DKMS</b>:
```sh
su -c "sh dkms-remove.sh"
```

Inspiración
-----------

Este parche fue revocado una vez por los programadores de zen-kernel.<br>
Como dijeron:
> "I'd really prefer we don't add code for fakes."

En traducción libre:
> "Nosotros realmente preferimos que códigos para dispositivos falsos no sean agregados."

Aunque el dispositivo sea genérico, un dispositivo sigue siendo un dispositivo.

Contribución
------------

Eres más que bienvenido a ayudar con el proyecto, que ha sido revocado por el equipo.<br>
Si su código falla en alguna arquitectura, considere agregar detalles en el archivo `warning.txt`.

Toda contribución debe ser directamente enviada para la branch `devel`.
```sh
git checkout devel
```

Referências
----------

Mi primer [pull request cerrado](https://github.com/zen-kernel/zen-kernel/pull/279).<br>
[Discusión en el foro](https://retropie.org.uk/forum/topic/28263/playstation-3-controller-not-connecting-wired-on-new-pi4-retropie-build/7) sobre el genérico controle de PS3... un grande salve para doug y [b3n](https://github.com/btlogy)!
