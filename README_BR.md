<p align="center">
  <picture>
    <a href="README.md">
      <img alt="Inglês" src="https://openmoji.org/data/color/svg/1F1EC-1F1E7.svg" width=5%>
    </a>
  </picture>
  <picture>
    <a href="README_BR.md">
      <img alt="Português" src="https://openmoji.org/data/color/svg/1F1E7-1F1F7.svg" width=5%>
    </a>
  </picture>
  <picture>
    <a href="README_ES.md">
      <img alt="Espanhol" src="https://openmoji.org/data/color/svg/1F1EA-1F1F8.svg" width=5%>
    </a>
  </picture>
</p>
<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./.media/language/portuguese/generikit_wide_dark.png">
  <source media="(prefers-color-scheme: light)" srcset="./.media/language/portuguese/generikit_wide_light.png">
  <img alt="GeneriKit" src="./.media/language/portuguese/generikit_wide_dark.png" width="55%">
</picture>
</p>

Patchs genéricos de PlayStation. Aqueles que foram rejeitados pelos sábios.

Uso
---

Ter que aplicar patchs em um arquivo e compilar um kernel inteiro requer um nível médio de conhecimento para a maioria dos usuários.<br>
Mas fazer isso é uma tarefa difícil. E é por isso que esse repositório foi feito.

Dependências
------------

No meio da jornada do repositório, muitos sistemas terão instalações automáticas.<br>
Mas esse dia ainda se encontra muito distante de acontecer. Então, considere ter os seguintes pacotes:

|   Pacote      |   URL                                             |
|---------------|---------------------------------------------------|
|   git         |   https://ftp.gnu.org/gnu/git/                    |
|   gcc         |   https://ftp.gnu.org/gnu/gcc/                    |
|   make        |   https://ftp.gnu.org/gnu/make/                   |

O uso dos headers do kernel é necessário. Cada distribuição tem o seu diferente pacote.<br>
Eles também podem ser compilados manualmente. Veja [isso](https://www.kernel.org/doc/html/latest/kbuild/modules.html).

Opcional: Outros compiladores de C podem ser usados também, mas lembre-se que o seu kernel PRECISA
ser compilado pelo mesmo compilador.

Compilando
----------

<b>Dica</b>: "su -c" pode ser seu gerenciador root, sudo, doas, ou qualquer outro...<br>
Só lembre de remover as aspas (") de todo comando contendo "su -c".

<b>Clone o repositório</b>:
```sh
git clone https://github.com/SimplyCEO/generikit-hid-sony.git
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

Remova o antigo driver para carregar o do generikit:
```sh
printf "blacklist hid-sony\n" | su -c "tee /etc/modprobe.d/generikit.conf"
```

Para carregar o driver original, desative `generikit-hid-sony` e carregue `hid-sony`:
```sh
su -c "modprobe --remove generikit-hid-sony"
su -c "modprobe hid-sony"
```
Para voltar ao driver do generikit, faça o reverso do indicado.

Removendo
---------

<b>Usando DKMS</b>:
```sh
su -c "sh dkms-remove.sh"
```

Inspiração
----------

Uma vez esse patch foi revogado por programadores do zen-kernel.<br>
Como eles disseram:
> "I'd really prefer we don't add code for fakes."

Em tradução livre:
> "Nós realmente preferimos que códigos para dispositivos falsos não sejam adicionados."

Mesmo sabendo que o dispositivo é genérico, um dispositivo continua sendo um dispositivo.

Contribuição
------------

Você é mais do que bem-vindo para ajudar no projeto, cujo foi revogado pelo time.<br>
Se o seu código bugar alguma arquitetura, considere adicionar detalhes no arquivo `warning.txt`.

Toda contribuição deve ser diretamente enviada para a branch `devel`.
```sh
git checkout devel
```

Referências
----------

Meu primeiro [pull request fechado](https://github.com/zen-kernel/zen-kernel/pull/279), um conceito do qual nasceu o projeto.<br>
[Discussão em fórum](https://retropie.org.uk/forum/topic/28263/playstation-3-controller-not-connecting-wired-on-new-pi4-retropie-build/7) sobre o genérico controle de PS3... um grande salve para doug e [b3n](https://github.com/btlogy)!
