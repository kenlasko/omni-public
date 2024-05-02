# Introduction
This repository is used to install a Talos Kubernetes cluster using on-prem Omni in a declarative manner. Most of these steps should work without modification. Obviously paths and domain names should change as required.

In my situation, I have 6 NUCs/mini-PCs that I use for my cluster. Three are old Intel NUCs that are used as control planes. The other 3 are Beelink mini-PCs. My desire was to setup an easily reproducible Talos Kubernetes cluster and maintain my creative node name strategy of NUC1 through NUC6. 

Once complete, you will have a Kubernetes cluster running the latest Kubernetes flavour, but without a CNI. This means your cluster won't actually be running until a CNI is installed. I used Cilium for my cluster following [these steps](https://www.talos.dev/v1.7/kubernetes-guides/network/deploying-cilium/).


# Omni On-Prem Installation
I installed Omni on a Raspberry Pi I'm using for other Docker-related stuff.
1. Follow the [Omni on-prem install instructions](https://omni.siderolabs.com/docs/how-to-guides/how-to-deploy-omni-on-prem/).
2. Configure [docker-compose.yaml](docker-compose.yaml) file
3. Make sure omni.mydomain.com is added to whatever is being used to serve DNS

# Omnictl/Talosctl installation
1. Download omnictl and talosctl from https://omni.mydomain.com and put in proper locations on your workstation.
```
sudo mv omnictl-linux-amd64 /usr/local/bin/omnictl
sudo mv talosctl-linux-amd64 /usr/local/bin/talosctl
sudo chmod u+x /usr/local/bin/omnictl /usr/local/bin/talosctl
```
2. Download omniconfig.yaml and talosconfig.yaml from omni.mydomain.com and put in proper locations on your workstation.
```
mv omniconfig.yaml /home/ken/.config/omni/config
mv talosconfig.yaml /home/ken/.talos/config
```
# Omni/Kubectl installation
Assumes Kubectl is already installed.
1. Install Krew
```
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
```

2. Add Krew to ~/.bashrc
```
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```

3. Restart shell
```
source ~/.bashrc
```

4. Install OIDC-Login in Kubectl
```
kubectl krew install oidc-login
```

5. Install wslu (for WSL browser redirection, if your workstation is using Windows Subsystem for Linux)
```
sudo apt install wslu -y
```

# Omni cluster creation/update
Make sure all nodes are up and running in maintenance mode and are visible in https://omni.mydomain.com

You will need to modify the machine GUIDs in [cluster-template-home.yaml](cluster-template-home.yaml) to suit your needs. I have multiple cluster templates for home, lab and laptop to test various things. You may not need all this.

I setup a pass-through container cache in Docker on my NAS, which is defined in [machine-registries.yaml](patches/machine-registries.yaml). You probably won't be using this.

If any of your machine GUIDs are not randomly assigned and the BIOS is American Megatrends (AMI)-based, you may be able to create a bootable USB from the files in [uuid-gen](uuid-gen) to set a random machine GUID.

I used PXEBoot and Matchbox for this. I will publish how I did this some other time.

Once you're ready for creating your cluster, run the below command from your workstation. Yep, that's it.
```
omnictl cluster template sync -f ~/omni/cluster-(home|lab|laptop).yaml
```
Then install Cilium using whatever method you desire. In my case, I used an Ansible script to install the core apps that would allow me to log into ArgoCD and install everything else:
- Cilium
- External Secrets
- Cert Manager

The repo that contains all that is currently private. I may expose it once I'm confident all secrets are gone.