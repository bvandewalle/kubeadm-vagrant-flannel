# kubeadm-vagrant-flannel
Simple set of scripts to get a set of Kube nodes with KubeADM on Ubuntu, with Vagrant. Flannel for network backend

`vagrant up` starts the two VMs on VirtualBox.

If you want more VMs, the Vagrantfile can be edited to add more nodes (Copy paste the kube-node).

To connect to your cluster, you can ssh to the master and issue your `kubectl` commands.
You can also export your `kubeconfig` and connect from anywhere else.
