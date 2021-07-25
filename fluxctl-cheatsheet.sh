# fluxctl cheatsheet

## Use different namespace than default for flux daemon.
# export FLUX_FORWARD_NAMESPACE={kube_ns}
export FLUX_FORWARD_NAMESPACE=flux
fluxctl --k8s-fwd-ns={kube_ns} list-workloads

## List all workloads
fluxctl list-workloads

## List all workloads in all namespaces
fluxctl list-workloads --all-namespaces

## List workloads filtered by container.
fluxctl list-workloads -c {container}

## List workload images, pointer tells the current image.
fluxctl list-images -w {kube_ns}:deployment/{app_name}

## Prevent flux from automatically updating to newer versions
fluxctl deautomate -w {kube_ns}:deployment/{app_name}

## Manually update all images of a workloads.
fluxctl release -w {kube_ns}:deployment/{app_name} --user={user} --message="{message}" --update-all-images

## Release a workload with an image. Flux will not update this workload if it is deautomated.
fluxctl release -w {kube_ns}:deployment/{app_name} -i {app_image}:{new_app_image}

## Turn on automatation for flux to rollout automatically
fluxctl automate -w {kube_ns}:deployment/[app_name]

## Lock a workload to stop manual or automated releases.
fluxctl lock -w {kube_ns}:deployment/{app_name}

## Unlock a workload to allow manual/automated releases.
fluxctl unlock -w {kube_ns}:deployment/{app_name}

## Release to a locked workload.
fluxctl release -w {kube_ns}:deployment/{app_name} --update-all-images -f

## Watch release rollout.
fluxctl release -w {kube_ns}:deployment/{app_name} --update-all-images -w
