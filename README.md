# Instalação da VM
"vagrant up" ou "start.bat"

# Como atualizar o guest aditions arquivo vagrant-rhel55-x64.virtualbox.box

- Baixe o arquivo vagrant-rhel55-x64.virtualbox.box;
- Descompacte-o (pode utilizar o 7-zip);
- Importe o arquivo no Virtualbox;
- Monte o CD de guest aditions e execute o instalador (usuário/senha: root/vagrant);
- Desligue a máquina virtual;
- Vá em exportar appliance e sobrescreva o arquivo box.ovf;
- * lembre de verificar qual arquivo vmdk o appliance exportou (geralmente box-disk1.vmdk);
- Crie um arquivo tar contendo todos os arquivos descompactados, e o renomeie com a extensão .box;