
#!/bin/bash
gcloud config set project tranquil-matter-357619

for i in {0..49}
do
  gcloud compute addresses create partha-atlas-endpoint-ip-$i --region=us-east1 --subnet=mongodbclusternetwork
done

for i in {0..49}
do
  if [ $(gcloud compute addresses describe partha-atlas-endpoint-ip-$i --region=us-east1 --format="value(status)") != "RESERVED" ]; then
    echo "partha-atlas-endpoint-ip-$i is not RESERVED";
    exit 1;
  fi
done

for i in {0..49}
do
  gcloud compute forwarding-rules create partha-atlas-endpoint-$i --region=us-east1 --network=mongodbclusternetwork --address=partha-atlas-endpoint-ip-$i --target-service-attachment=projects/p-k4q4884yt6pwcbszapbtsjzt/regions/us-east1/serviceAttachments/sa-us-east1-62e021b3cb224a1ab16756a0-$i
done

if [ $(gcloud compute forwarding-rules list --regions=us-east1 --format="csv[no-heading](name)" --filter="(name:partha-atlas-endpoint*)" | wc -l) -gt 50 ]; then
  echo "Project has too many forwarding rules that match prefix partha-atlas-endpoint. Either delete the competing resources or choose another endpoint prefix."
  exit 2;
fi

gcloud compute forwarding-rules list --regions=us-east1 --format="json(IPAddress,name)" --filter="name:(partha-atlas-endpoint*)" > atlasEndpoints-partha-atlas-endpoint.json





#Code to delete
gcloud config set project tranquil-matter-357619
gcloud config set compute/region us-east1

for i in {28..49}
do
  gcloud compute forwarding-rules delete partha-atlas-endpoint-$i --quiet

  sanbox-pri-end-0
done

