# oip-core-tools-images

This repository contains various container images used to help either administering or building the platform and related services.

## odktools

This image provides a variety of tools proven useful to create or manage kubernetes and openshift components.

System packages included:
-  bash
-  bash-completion
-  curl
-  git
-  gnupg
-  grep
-  groff
-  jq
-  less
-  make
-  openssh-client
-  python3
-  py-crcmod
-  py-pip
-  shadow
-  skopeo
-  wget
-  zsh

Kubernetes and OpenShift related
-  ansible: 2.6.15
-  automation broker: latest
-  cekit: 3.0.0
-  dg (distgen): 1.3
-  openshift log utility (oclogs): latest
-  openshift oc client: 3.11
-  openshift odo client: v1.0.0-beta1 (c226b008)


## ciptools

This image is built from the okdtools image and contains additional tools create or manage other components of the platform and even components and service offerings other than the platform itself.

-  aws cli: latest
-  aws logs utility: latest
-  azure client: latest
-  docker client: 18.06.3-ce
-  docker compose: 1.24.0
-  docker machine: v0.16.1
-  helm2bundle: latest
-  google cloud sdk (gcloud): 243.0.0
-  kompose: v1.18.0
-  kubeless: v1.0.3
-  scaleway client: latest
-  serverless framework: 1.41.1

### 

To run the container with terminal emulation

```
$ function ciptools_term () \
{ \
    docker run -it --rm -v $HOME/.oipconfig/$OIPENV:/home/oipconfig/ oiprnd/ciptools:alpine-latest $* ; \
}
```

To run the container without terminal emulation, for example if you need to pipe the output to another command

```
$ function ciptools () \
{ \
    docker run -i --rm -v $HOME/.oipconfig/$OIPENV:/home/oipconfig/ oiprnd/ciptools:alpine-latest $* ; \
}
```

### Some usefull commands

```
$ ciptools awslogs get -GS CloudTrail --start='5m ago' --watch | jq '.'
```

