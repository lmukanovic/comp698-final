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


* What protections are there against accidentally introducing bad code into production?
