# comp698-final
 Why use git?
* You have access to all versions of all files in a Git repo at any time
* Almost impossible to lose any part of a code (ability to roll back if needed)
* Multiple developers can work on one project at the same time without interfering with each other
* Quick to start a new repository
* Easy to use and easy to learn 

Why write an application in golang?
* Open-source programming language 
* Compiler can compile projects quickly. You can even edit and run Go programs directly on the Web.
* Syntax is small compared to other languages, and it’s easy to learn
* Clean and easy-to-read

What purpose does Travis CI serve?
* It is a service that uses continuious integration with our github repo as we create pull requests and modify our code. Travis CI runs our program's tests every time there is a commit to GitHub. You can configure this i many ways, and you can always disable builds on some branches. The main use of Travis CI is to quickly discover if your commit(s) broke something, and fix it before it becomes a problem.


 What is the purpose of terraform?
* Terraform is an open source infrastructure automation tool. It allows us to build and configure an infrastructure through our code. We use terraform to deloy our docker images and containers. It can manage existing and popular service providers as well as custom in-house solutions.


Why use virtualized resources?
* Virtual resources allow us to configure and set up a system once and then reuse it again. It gives us (developers) the freedom to have multiple versions running and the ability to destroy one if somethings goes wrong. Virtualized resources do not affect the system that it is using and therefore a developer can experiment and try new settings if they wish too.


* Include a diagram of the architecture from laptop to GCP



Why use bash commands vs clicking through UI?
* Using bash commands allows us to become more proficient in knowing linux (for Mac users) and powershell (for Windows users). Bash commands are quick and effective which create a local repo with a couple of steps. Clicking through the UI can create some problems with the local and git repo that are unable to be fixed. In addition, there are more features that you can utilize through a bash command over clicking through the UI. Bash commands are stored and able to be accessed later on, while clicking through the UI is not stores and users have a hard time remembering what they did. 



Why docker vs installing application directly on the host?
* Installing applications directly on the host allows for installation issues that docker does not come with. When installing applications on a local system or vm, there are requirements that the application needs such as storage, a certain OS, or previous applications to install a current one. Docker has consistency across multiple development and release cycles, which allows for standardizing your environment. Docker provides repeatable development, build, test, and production environments. In addition, Docker has containers which allow you to commit changes to your Docker images and version control them. If there is a problem in one image it is easy to roll back to a previous image.

What protections are there against accidentally introducing bad code into production?
* Travis CI running along side your Git Repo
* Creating a stagging area of code then pushing it to production
* Protecting the master branch through github 
* Creating pull requests whenever changing code 
* When working in a team having multiple people review code before it gets pushed to production 


Documentation for this project: 
Make local folder called it comp698-final
Went to github, udner repo, clicked new, called it comp698-final
•	initialize it with a README.md
•	license- MIT license
After creating repo, clicked Clone or Download 
Opened terminal, went to Desktop folder called COMP698
In COMP698, wrote, cloned repo from github
•	configure the Github repo to protect your master branch
•	Go to Settings (for repo comp698-final)>branches> Branch protection rules>choose master, select Protect this branch, select, Require status checks to pass before merging, select include administrators, hit save changes 
On local repo copy, create two files 
-	Main.go
-	Main_test.go
Input code given (https://github.com/mathyourlife/comp698-final/tree/helloworld-source) 
In terminal locate your local repo with the two files, do this twice for main.go and main_test.go 
Push changes to github by, adding a branch
Commit message 
pull request through github
merge to master
Create local docker file
Open text editor, copy docker file components from (https://github.com/mathyourlife/comp698-final/blob/master/Dockerfile)
Push changes to github by, adding a branch
Commit message 
pull request through github
merge to master
**Check what latest commit on github to make sure it matches local copy
-	On terminal, type git log and compare with repo on github, if the commit numbers are different 
-	In terminal type, git checkout master, git pull, then compare again, they should be the same now 
Add .travis.yml file to local repo and push it to github for pull request validation 
Push changes to github by, adding a branch
Commit message 
pull request through github
merge to master
configure travis CI on https://travis-ci.org/lmukanovic/comp698-final
*Professor added file .travis.yml accepted PR) had error on terminal, fixed it through 
git checkout master
rm .travis.yml
git pull



Go to GCP, and search fro Build Trigger 
Create trigger, github
Select repo (comp698-final)
Name, branch master
Image name- gcr.io/$PROJECT_ID/$REPO_NAME:$COMMIT_SHA
After creating, hit run trigger to master, wait until it builds successful 

In comp698-final, create a subfolder calling it terraform 
-	add terraform configuration files to your github repo in a terraform subdirectory
-	copied from webserver and changed names and added new image 
       
push local changes to github in terraform folder 
Push changes to github by, adding a branch
Commit message 
pull request through github
merge to master

login to terraform configuration server and run the file with terraform apply 
-	gcloud compute ssh terraform-configuration 
git clone comp698-final to terraform-configuration server
cd terraform
ls
youll see main.tf 
run terraform apply 
saw error,
running terraform init
again terraform apply 
-	name not available trying again- same steps
Push changes to github by, adding a branch
Commit message 
pull request through github
merge to master
git checkout master
rm .travis.yml
git pull
**Travis is giving me a weird error but GCP/Terraform is working correctly
Compute Engine>staging-18x7>External IP (http://104.154.162.161) gives me Hello World! 

Updating update the main.go, main_test.go, Dockerfile, functional-test.sh files
Then going git add, commit, pull request, travis, merge to master for each of them 

Gcloud compute ssh terraform-configuration

Added final resource to main.tf  then 
Git branch updatet
Git add main.tf
Git commit –m 
Git push origin updatet

Worked, going into terraform server to run from there 
Terraform/main.tf
Terraform apply 

Didn’t work, trying again
Added final resource to main.tf  then 
Git branch newterra
Git add main.tf
Git commit –m 
Git push origin newterra

Got it to work but it was swapped 
Production was the production
Staging was the hello world 

In order to make it work, I swapped the image in main.tf under metadata/containers from the staging to the production 

Now it is
Production says "Hello World"
Staging/home is the bootstrap version
