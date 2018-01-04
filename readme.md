# Packer
Packer is a tool for creating Virtual Machines, think of it as a factory, where an ISO, an answerfile and a JSON script are used to create an output that can then be used to generate a machine via Virtual Box, VMWare, AWS etc.


## Instructions
1. Copy your Windows ISO file to the packer-windows/iso folder
2. Edit the Autounattend.xml file in packer-windows/answerfiles/2016 and replace your the Product key with your own Product key
3. Download Microsoft FCIV (https://www.microsoft.com/en-au/download/details.aspx?id=11533) or another tool that can display the MD5 checksum of a file.
4. Run FCIV or the alternative tool you downloaded on the ISO image and replace the Checksum value in the Windows_2016.json file
5. The Windows_2016.json script will run a set of scripts one of which performs a full Windows Update.  The entire process can take several hours.
6. run packer build windows_2016.json to build the output.  or you can use the -only switch to only build for the platform you want (Virtual box for example - https://www.packer.io/docs/commands/build.html#only-foo-bar-baz)

## Output
The output the packer build should be a .box file.  This is what will be used by Vagrant to generate images.  It can be useful having the box file as generic as possible as it allows reuse.

# Vagrant
Vagrant allows for the creation of virtual machines that are built and provisioned with software to be deployed to Virtual Box, VMware etc.

## Instructions
1. Run vagrant box add your box file --name name of box(vagrant box list will display your boxes)
2. Once the box file has been added to vagrant you can delete the .box file itself, it is no longer needed
3. Edit the vagrantfile and make sure your box that was added matches: config.vm.box = "win2k16" <- this value can be changed
4. Edit any other value, for example the hostname (although doing this will require you to edit other files at this point)
5. The folder  "c:/projects/vagrant/qlik-sense/files" is referenced and becomes a sync'd folder and is needed config.vm.synced_folder "c:/projects/vagrant/qlik-sense/files", "c:/installation/"
6. Download the qlik_sense_setup.exe and store it in the  folder "c:/projects/vagrant/qlik-sense/files"
7. Review the /qlik-sense/files/sp_config.xml file and install-qs-cfg.xml files they contain information on the hostname and how qlik sense will be installed
8. Review the pre-reqs.ps1 found in /qlik-sense/scripts to see what provisioning will be applied to the host
9. run vagrant up (this will build and provision)
or
9. vagrant up --no-provision which will just build the vm
followed by
10. vagrant up --provision to do the provisioning as a separate step
11. To delete the instance run vagrant destroy
