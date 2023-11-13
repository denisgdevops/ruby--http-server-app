# about
Ruby web server which
serves on configured port.
/healthcheck path returns "OK"
All other paths return "Well, hello there!"

`$ ruby http_server.rb`


# folder structure

This project contains the below folder structure

1. .github/workflows - contains the github actions workflow in `main.yml`

2. .app folder - contains the application files and this where the docker file is also located 

3.  platform folder - contains the infrastructure setup needed to deploy the application on kubernetes
    
4.   platform/helm  folder - contains the kubernetes manifest

5.   platform/argo - contains the argo cd manifest to deploy the application to kubernetes via argocd


### Installation

_This project uses algo cd to deploy the application on minikube._

1. Ensure you have argo cd and minikube setup 
2. Create a new App on argo cd dashboard instance edit as YAML and copy the content in plaform/argo/ruby-app-application.yml file
3. Save, review the  values and create the application
4. Give it some time for it to synch and you should be able to see it synch successfully
5. Map ingress host `ruby-app.local` to minikube ip to be able to access the application locally via it
6. Check if the application is running fine by clicking pod and then chek on the logs section, you should be able to see some logs
7. If the application is running fine, you should be able to access it locally by clicking on `ruby-app.local`  on the browser
   